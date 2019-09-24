//1 下载第三方模块
//2 引入第三方模块包
const mysql =require('mysql');//数据库
const express =require('express');//服务器创建
const cors =require('cors');//跨域
const session =require('express-session');//
//3 创建连接池
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    port:3306,
    connectionLimit:20,
    database:"hldy"
})
//4 创建web服务器监听 8080 端口
var server=express();
server.listen(8080);
//5 处理跨域
server.use(cors({
    origin:["http://127.0.0.1:3001","http://localhost:3001"],
    credentials:true
}));
//配置session会话
server.use(session({
    secret:"hldy",
    resave:true,
    rolling:true,
    saveUninitialized:true,
    cookie:{
        maxAge:60000
    }
}))
//7 配置静态目录
server.use(express.static("public"))

//轮播图
server.get("/carousel",(req,res)=>{
    var sql = "SELECT * FROM hldy_index_carousel";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
})

//电影院列表
// 1.接收客户请求  /product GET
server.get("/cinemalist",(req,res)=>{
    // 2.接收客户请求数据
    //     pno 页码   pageSize 页大小
        var pno = req.query.pno;
        var ps = req.query.pageSize;
    // 3.如果客户没有请示数据设置默认数据
        if(!pno){
            pno = 1;
        }
        if(!ps){
            ps = 4;
        }
        //创建sql语句
        var sql = "SELECT lid,lname,price,img_url FROM xz_laptop LIMIT ?,?";
        var offset = (pno-1)*ps;//起始记录数
        pool.query(sql,[offset,ps],(err,result)=>{
            if(err) throw err;
            //发送sql语句
            //获取返回结果发送给客户端
            res.send({code:1,msg:"查询成功",data:result});
        })
    })
//
server.get("/upcoming",(req,res)=>{
    var sql = "SELECT * hldy_index_details";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});

//电影列表
server.get("/filmList",(req,res)=>{
    var sql = "SELECT * hldy_index_product";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    });
});

//功能一.完成用户登录
//启动服务器app.js/启动数据库
//打开浏览器
server.get("/login",(req,res)=>{
    //6.1接收网页传递数据 用户名和密码
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    //6.2创建sql
    var sql="SELECT id FROM xz_login";
    sql+=" WHERE uname = ? AND upwd = md5(?)";
    //6.3执行sql语句并且获取返回结果
    pool.query(sql,[uname,upwd],(err,result)=>{
        //6.4判断登录是否成功
        if(err) throw err;
        //6.5将结果返回网页
        if(result.length==0){
            res.send({code:-1,msg:"用户名或密码有误"})
        }else{
            //获取当前登录用户id
            var id =result[0].id;
            //将用户id保存session对象中
            req.session.uid = id;
            res.send({code:1,msg:"登录成功"});
        }
    });
})
//二 创建商品列表的分页
// 1.接收客户请求  /product GET
server.get("/product",(req,res)=>{
// 2.接收客户请求数据
//     pno 页码   pageSize 页大小
    var pno = req.query.pno;
    var ps = req.query.pageSize;
// 3.如果客户没有请示数据设置默认数据
    if(!pno){
        pno = 1;
    }
    if(!ps){
        ps = 4;
    }
    //创建sql语句
    var sql = "SELECT lid,lname,price,img_url FROM xz_laptop LIMIT ?,?";
    var offset = (pno-1)*ps;//起始记录数
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err) throw err;
        //发送sql语句
        //获取返回结果发送给客户端
        res.send({code:1,msg:"查询成功",data:result});
    })
})

//功能三:将指定商品添加至购物车
//#此功能先行条件先登录
//1:接收客户端请求 /addcart GET
//http://127.0.0.1:8080/login?uname=tom&upwd=123
//http://127.0.0.1:8080/addcart?lid=1&lname=kk&price=9
server.get("/addcart",(req,res)=>{
//2:判断当前用户是否登录成功
// uid
// 如果uid为undefined 没登录
    var uid = req.session.uid;
    if(!uid){
    res.send({code:-1,msg:"请先登录"});
    return;
    }
    //3:获取客户端数据???小心处理
    // lid 商品编号
    // price 商品价格
    // lname 商品名称
    var lid = req.query.lid;
    var price = req.query.price;
    var lname = req.query.lname;
    //console.log(lid+":"+price+":"+lname);
    //res.send(lid+":"+price+":"+lname);
    //4:创建查询sql:当前用户是否购买此商品
    var sql = "SELECT id FROM xz_cart WHERE uid = ? AND lid = ?"
    //5:执行sql语句
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err) throw err;
        //6:在回调函数中判断下一步操作
        // 没购买过此商品 添加
        if(result.length==0){
            var sql = `INSERT INTO xz_cart VALUES(null,${lid},${price},1,'${lname}',${uid})`;
        }else{
            // 己购买过此商品 更新
            var sql = `UPDATE xz_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
        }
        //7:执行sql获取返回结果
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            if(result.affectedRows>0){
                res.send({code:1,msg:"商品添加成功"});
            }else{
                res.send({code:-2,msg:"添加失败"})
            }
        })
    })
})
//功能四：查询指定用户购物车信息
server.get("/carts",(req,res)=>{
    // 1 参数
    var uid = req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请先登录"});
        return;
    }
    // 2 创建sql语句
    var sql = "SELECT id,lname,price FROM xz_cart WHERE uid = ?"
    // 3 执行sql语句并且将数据库返回结果发送客户
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})
server.get("/delItem",(req,res)=>{
    var uid = req.session.uid;
    if (!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    var id = req.query.id;
    var sql = "DELETE FROM xz_cart WHERE id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"});
        }else{
            res.send({code:-1,msg:"删除失败"});
        }
    })
})

// 功能六：删除购物车中多个商品
server.get("/delItems",(req,res)=>{
    //0 判断用户是否登录
    var uid = req.session.uid;
    if(!uid){
        this.$router.push("/Login");
    }
    //1 获取参数 id
    var id = req.query.id;
    //2 创建 sql语句
    var sql = `DELETE FROM xz_cart WHERE id IN (${id})`;
    //3 执行sql语句
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        //4 获取服务器返回结果
        if(result.affectedRows>0){
            //5 将结果返回客户端
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    });
})