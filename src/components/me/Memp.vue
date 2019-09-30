<template>
  <div class="me-user">
    <transition name="tran">
      <div class="me-width">
        <div class="header">
          <div class="header-item-icon">
            <img src="../../assets/icon/usernotice.png" class="icon1" @click="info" />
            <img src="../../assets/icon/ic_edit.png" class="icon2" @click="meEdit" />
          </div>
          <div class="header-item">
            <div class="header-headItem" v-if="isLogin==true">
              <div class="headItem-h">
                <img src="../../assets/icon/pic_me_portrait_default.png" class="headItem-icon1" />
                <img src="../../assets/icon/ic_crown.png" class="headItem-icon2" />
                <div class="headItem-emp1"></div>
                <div class="headItem-empText">&nbsp;乐影迷注册会员</div>
                <span class="headItem-emp2" v-text="grow"></span>
              </div>
              <div class="headItem-p">
                <p class="headItem-p">欢乐影迷</p>
                <p v-text="phone"></p>
              </div>
              <router-link to="/Login">
                <div class="headItem-right">
                  <img src="../../assets/icon/ic_right_arrow.png" />
                </div>
              </router-link>
            </div>
            <div class="header-headItem2" v-else @click="login">
              <div>
                <img src="../../assets/icon/pic_mine_service_default.png" />
                <span>注册/登录</span>
              </div>
              <div>
                <h4>欢迎来到欢乐影城</h4>
                <p>"生活因欢乐更美好"</p>
              </div>
            </div>
          </div>
        </div>
        <div class="me-list1">
          <div>
            <img src="../../assets/icon/ic_order.png" />我的订单
          </div>
          <div>
            <img src="../../assets/icon/ic_wallet.png" />我的钱包
          </div>
        </div>
        <div class="me-list2">
          <mt-cell is-link title>
            <img src="../../assets/icon/ic_badge.png" slot="icon" />
            <span class="list2title">我的勋章</span>
          </mt-cell>
          <mt-cell is-link title>
            <img src="../../assets/icon/ic_qr.png" slot="icon" />
            <span class="list2title">会员码</span>
          </mt-cell>
          <mt-cell is-link title>
            <img src="../../assets/icon/ic_member.png" slot="icon" />
            <span class="list2title">会员手册</span>
          </mt-cell>
          <mt-cell is-link title class="list2Cell">
            <img src="../../assets/icon/ic_coin.png" slot="icon" />
            <span class="list2title">我的积分</span>
            <span>0积分</span>
          </mt-cell>
          <mt-cell is-link title>
            <img src="../../assets/icon/ic_film.png" slot="icon" />
            <span class="list2title">我的影单</span>
          </mt-cell>
          <mt-cell is-link title class="list2Cell">
            <img src="../../assets/icon/ic_prize.png" slot="icon" />
            <span class="list2title">我的奖品</span>
          </mt-cell>
          <mt-cell is-link title>
            <img src="../../assets/icon/ic_service.png" slot="icon" />
            <span class="list2title">客服中心</span>
          </mt-cell>
          <mt-cell is-link title>
            <img src="../../assets/icon/ic_badge.png" slot="icon" />
            <span class="list2title">设置</span>
          </mt-cell>
        </div>
      </div>
    </transition>
  </div>
</template>
<script>
import Login from "./Login";
export default {
  data() {
    return {
      grow: "还需195成长值升级",
      phone: 13123456789,
      isLogin: false
    };
  },
  components: {
    login: Login
  },
  methods: {
    info() {},
    meEdit() {},
    login() {
      console.log(1);
      this.$router.push("/login");
      // this.isLogin=!this.isLogin;
    },
    changelogin() {
      var url = "http://127.0.0.1:8080/mep";
      this.axios.get(url).then(res => {
        var code = res.data.code;
        console.log(code);
        if (code == 1) {
          this.isLogin = true;
        } else {
          this.isLogin = false;
        }
        console.log(this.isLogin);
      });
    }
  },
  created() {
    this.changelogin();
  },
};
</script>
<style scoped>
.header {
  background: #373a43;
}
.icon1,
.icon2 {
  width: 20px;
  padding: 15px 0;
  margin: 0 10px;
}
.icon2 {
  float: right;
}
.header-headItem2 {
  display: flex;
  justify-content: center;
  height: 100px;
  padding-top: 10px;
}
.header-headItem2 > div {
  width: 60px;
  text-align: center;
  color: #e2b87f;
}
.header-headItem2 > div + div {
  width: 150px;
  padding: 2px 0;
}
.header-headItem2 img {
  width: 30px;
}
.header-headItem2 span {
  font-size: 10px;
  display: block;
}
.header-headItem {
  display: flex;
}
.headItem-h {
  width: 80px;
  margin-left: 30%;
  position: relative;
  font-size: 8px;
  height: 100px;
}
.headItem-icon1,
.headItem-icon2 {
  width: 60px;
}
.headItem-icon2 {
  width: 66px;
  position: absolute;
  top: -3px;
  left: -2px;
}
.headItem-emp1 {
  background: #e2b87f;
  display: block;
  position: absolute;
  border-radius: 9px;
  width: 62px;
  height: 9px;
  top: 52px;
}
.headItem-emp2 {
  font-size: 8px;
  display: block;
  color: #999;
  position: absolute;
  left: -3px;
  top: 58px;
}
.headItem-empText {
  position: absolute;
  top: 46px;
}
.headItem-p.headItem-p {
  font-size: 18px;
  padding-top: 5px;
}
.headItem-p p {
  font-size: 11.5px;
  color: #f6f6f6;
  margin: 0;
}
.headItem-right {
  position: absolute;
  right: 20px;
  top: 80px;
}
.headItem-right img {
  width: 8px;
}
.me-list1 {
  display: flex;
  justify-content: space-around;
  padding-top: 30px;
  margin-bottom: 10px;
  background: #fff;
}
.me-list1 div {
  width: 50px;
  text-align: center;
  font-size: 11px;
}
.me-list1 div + div {
  padding-top: 10px;
}
.me-list1 img {
  width: 50px;
}
.me-list2 img {
  width: 16px;
}
.list2Cell {
  margin-bottom: 10px;
}
.list2Cell span {
  font-size: 12px;
}
.me-user {
  display: flex;
  width: 200%;
}
.me-width {
  width: 50%;
}
.tran-enter-active,
.tran-leave-active {
  transition: all 1s;
}
.tran-enter {
  transform: translateX(100%);
}
</style>
<style>
div.mint-cell-wrapper {
  background-image: linear-gradient(180deg, #fff, #fff 50%, transparent 50%);
}
</style>