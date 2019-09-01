<template>
  <div class="login">
    <mt-header fixed class="header">
      <router-link to="javascript:;" slot="left" class="iconfont icon-zuo"></router-link>
      <router-link to="javascript:;" slot="left">登录注册</router-link>
    </mt-header>
    <p>请先进行登录，未注册的手机号会自动为您注册</p>
    <div class="phone-btn">
      <mt-field placeholder="输入手机号" v-model="uphone" class="phone"></mt-field>
      <mt-button v-model="m" disabled>获取验证码</mt-button>
    </div>
    <mt-field placeholder="输入验证码"></mt-field>
    <mt-button disabled class="login-code">登录验证</mt-button>
    <div>
      <mt-checklist></mt-checklist>
      <router-link to>《万达电影用户协议》</router-link>
    </div>
    <div class="login-icon">
        <div><img src="">微博登录</div>
        <div><img src="">QQ登录</div>
        <div><img src="">微信登录</div> 
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      value: "1"
    };
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
.icon-zuo {
  padding-right: 15px;
}
.login p {
  padding: 15px 0 5px;
}
.phone-btn {
  display: flex;
}
.phone {
  width: 73.5%;
}
.login button {
  font-size: 0.8rem;
  color: #fff;
  background-color: #d67e36;
}
.login-code {
  width: 95%;
}
.mint-field-core {
  background-color: #aaa;
}
.phone-btn .mint-cell-value .mint-field-core {
  background-color: gray !important;
}
.login-icon{
    display: flex;
    justify-content: space-between;
    padding: 0 20px;
    align-items: flex-end;
}
</style>
<style>
.mint-cell-value .mint-field-core {
  background-color: #e6e6e6;
}
</style>
