<template>
  <div class="login">
    <mt-header fixed class="header">
      <router-link to="/home" slot="left" class="iconfont icon-zuo"></router-link>
      <router-link to slot="left">登录注册</router-link>
    </mt-header>
    <div class="loginicon">
      <img src="../../assets/icon/login.png">
    </div>
    <div class="phone-form" v-if="select=='login'">
    <mt-field placeholder="请输入账号" v-model="uname" class="phone" id="Lname"></mt-field>
    <mt-field placeholder="请输入密码" v-model="upwd" id="Lpwd"></mt-field>
    <div class="reg" @click="isSelect">去注册</div>
    <mt-button class="login-button" @click="login">登录验证</mt-button>
    </div>
    <div class="phone-form" v-else>
    <mt-field placeholder="请输入新的账号" v-model="uname" class="phone" id="Rname"></mt-field>
    <mt-field placeholder="请输入新的密码" v-model="upwd" id="Rpwd"></mt-field>
    <mt-field placeholder="请再次密码" v-model="upwd" id="Rpwd2"></mt-field>
    <div class="reg" @click="isSelect">去登录</div>
    <mt-button class="login-button" @click="reg">注册</mt-button>
    </div>
    <div class="login-icon">
        <div><img src="../../assets/icon/weibo.png">微博登录</div>
        <div><img src="../../assets/icon/qq.png">QQ登录</div>
        <div><img src="../../assets/icon/weixin.png">微信登录</div> 
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      uname:"",
      upwd:"",
      select:"login",
    };
  },
  props:[
    "isLogin"
  ],
  methods:{
    back(){
      console.log(123)
      this.$router.go(-1);
    },
    isSelect(){
      if(this.select=='login'){
        this.select='reg';
      }else{
        this.select='login';
      }
    },
    reg(){

    },
    login(){
      var uname = this.uname;
      var upwd = this.upwd;
      console.log(uname,upwd);
      if(uname==""||uname===undefined){
        //var 
        this.$messagebox("消息","请输入账号!");
        //document.getElementById("Lname").focus()
          //this.$refs.val.focus()
        console.log(document.getElementById("Lname"));
      }else if(upwd===""||upwd===undefined){
        console.log(0);
        this.$messagebox("消息","请输入密码!");
      }else{
        var regName = /^[a-z0-9]{6,16}$/i;
        var regPwd = /^[a-z0-9]{8,16}$/i;
        if(!regName.test(uname)){
          this.$toast("用户名格式为6-16位字母或数字");
          return;
        }
        if(!regPwd.test(upwd)){
          this.$toast("密码格式为8-16位字母或数字");
          return;
        }
        var url = `http://127.0.0.1:8080/login`;
        var obj={uname:uname,upwd:upwd};
        console.log(obj);
        this.axios.get(url,{params:obj})
        .then(res=>{
          var code = res.data.data;
          console.log(code);
          if(code==-1){
            this.$messagebox("消息","登录成功")
            .then(()=>{
              this.$router.go(-1);
            }).catch(()=>{
              this.$messagebox("消息","账号或密码错误！")
          })
          }
        })
        .catch(()=>{
              this.$messagebox("消息","账号或密码错误！")
          })
        console.log(1);
      }
    }
  },
};
</script>
<style scoped>
.login {
  align-items: center;
  text-align: center;
  background-color: #fff;
}
.header {
  color: #000;
  background-color: #fff;
  border-bottom: 1px solid #aaa;
}
.loginicon{
  padding: 20px 0;
}
.icon-zuo {
  padding-right: 15px;
}
.login-button{
  font-size: 2rem;
  color: #fff;
  width: 97.5%;
  background-color: #d67e36;
}
.login-icon{
    display: flex;
    justify-content: space-around;
    padding: 50px 20px;
    align-items: flex-end;
}
.reg{
  font-size: 14px;
  margin-bottom: 10px;
  width: 70px;
}
.login-icon div{
  width: 20%;
  font-size: 14px;
}
.login-icon img{
  width: 100%;
}
</style>
<style>
.mint-cell-value .mint-field-core {
  background-color: #e6e6e6;
}
</style>
