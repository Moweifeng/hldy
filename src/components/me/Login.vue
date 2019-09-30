<template>
  <div class="login">
    <mt-header fixed class="header">
      <router-link to="/home" @click="back" slot="left" class="iconfont icon-zuo"></router-link>
      <router-link to slot="left">登录注册</router-link>
    </mt-header>
    <div class="loginicon">
      <img src="../../assets/icon/login.png" />
    </div>
    <div class="phone-form" v-if="select=='login'">
      <mt-field placeholder="请输入账号" v-model="uname" class="phone" id="Lname"></mt-field>
      <mt-field placeholder="请输入密码" v-model="upwd" id="Lpwd" type="password"></mt-field>
      <div class="reg" @click="isSelect">去注册</div>
      <mt-button class="login-button" @click="login">登录验证</mt-button>
    </div>
    <div class="phone-form" v-else>
      <mt-field placeholder="请输入新的账号" class="phone" v-model="uname" id="Rname"></mt-field>
      <mt-field placeholder="请输入新的密码" id="Rpwd1" v-model="upwd" type="password"></mt-field>
      <mt-field placeholder="请再次密码" id="Rpwd2" v-model="upwd2" type="password"></mt-field>
      <div class="reg" @click="isSelect">去登录</div>
      <mt-button class="login-button" @click="reg">注册</mt-button>
    </div>
    <div class="login-icon">
      <div>
        <img src="../../assets/icon/weibo.png" />微博登录
      </div>
      <div>
        <img src="../../assets/icon/qq.png" />QQ登录
      </div>
      <div>
        <img src="../../assets/icon/weixin.png" />微信登录
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      upwd2: "",
      select: "login"
    };
  },
  props: ["isLogin"],
  methods: {
    back() {
      console.log(this.$router.go);
      this.$router.go(-1);
    },
    isSelect() {
      if (this.select == "login") {
        this.select = "reg";
      } else {
        this.select = "login";
      }
    },
    codeTest(name, pwd) {
      return new Promise(door => {
        if (name == "" || name === undefined) {
          this.$messagebox("消息", "请输入账号!");
          return;
        }
        if (pwd == "" || pwd === undefined) {
          this.$messagebox("消息", "请输入密码!");
          return;
        }
        door();
      });
    },
    reg() {
      var uname = this.uname;
      var upwd = this.upwd;
      var upwd2 = this.upwd2;
      var regName = /^[a-z][a-z0-9]{3,15}$/i;
      var regPwd = /^[a-z0-9]{8,16}$/i;
      this.codeTest(uname, upwd)
        .then(() => {
          if (upwd2 == "" || upwd2 === undefined) {
            this.$messagebox("消息", "请再次输入密码！");
            return;
          }
        })
        .then(() => {
          if (!regName.test(uname)) {
            this.$messagebox(
              "消息",
              "用户名需为首字母开头的4-16位字母或数字！"
            );
            return;
          }
          if (!regPwd.test(upwd)) {
            this.$messagebox("消息", "密码为8-16位字母或数字！");
            return;
          }
          if (!upwd == upwd2) {
            this.$messagebox("消息", "两次输入密码不一致，请重新输入！");
            return;
          }
          var obj = { uname: uname, upwd: upwd };
          console.log(obj);
          var url = "http://127.0.0.1:8080/reg";
          // this.axios({
          //   method:'post',
          //   url:url,
          //   data:obj,
          // })
          this.axios({
            method: "POST",
            headers: { "content-type": "application/x-www-form-urlencoded" },
            data: this.qs.stringify(obj),
            url
          }).then(res => {
            var code = res.data.code;
            console.log(code);
            if (code == 200) {
              this.$messagebox("消息", "注册成功！");
              this.$router.push("/login");
            } else if (code == 400) {
              this.$messagebox("消息", "用户已存在！");
            } else {
              this.$messagebox("消息", "注册失败！");
            }
          });
        });
    },
    login() {
      var uname = this.uname;
      var upwd = this.upwd;
      this.codeTest(uname, upwd);
      var regName = /^[a-z][a-z0-9]{3,15}$/i;
      var regPwd = /^[a-z0-9]{8,16}$/i;
      if (!regName.test(uname)) {
        this.$messagebox("消息", "用户名需为首字母开头的4-16位字母或数字！");
        return;
      }
      if (!regPwd.test(upwd)) {
        this.$messagebox("消息", "密码为8-16位字母或数字！");
        return;
      }
      var url = `http://127.0.0.1:8080/login`;
      var obj = { uname: uname, upwd: upwd };
      this.axios({
        method: "post",
        headers: { "content-type": "application/x-www-form-urlencoded" },
        url: url,
        data: this.qs.stringify(obj)
      }).then(res => {
        var code = res.data.code;
        console.log(code);
        if(code==200){
          this.$messagebox("消息","登录成功!")
          .then(()=>{
            
            this.$router.go(-1);
          })
          console.log(res.data.data);
        }else{
          this.$messagebox("消息","用户名或密码有误!");
          this.uname = "";
          this.upwd = "";
        }
      });
    }
  }
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
.loginicon {
  padding: 20px 0;
}
.icon-zuo {
  padding-right: 15px;
}
.login-button {
  font-size: 2rem;
  color: #fff;
  width: 97.5%;
  background-color: #d67e36;
}
.login-icon {
  display: flex;
  justify-content: space-around;
  padding: 50px 20px;
  align-items: flex-end;
}
.reg {
  font-size: 14px;
  margin-bottom: 10px;
  width: 70px;
}
.login-icon div {
  width: 20%;
  font-size: 14px;
}
.login-icon img {
  width: 100%;
}
</style>
<style>
.mint-cell-value .mint-field-core {
  background-color: #e6e6e6;
}
</style>
