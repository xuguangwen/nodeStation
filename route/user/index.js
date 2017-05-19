
const express=require('express');
const common=require('../../libs/common');

module.exports=function (){
  var router=express.Router();
  //检查登录状态
  router.use((req, res, next)=>{
    if(!req.session['user_id'] && req.url!='/login'){ //没有登录
      res.redirect('/user/login');
    }else{
      next();
    }
  });
  router.get('/', (req, res)=>{
    res.render('user/index.ejs', {});
  });
  router.use('/login', require('./login')());
  return router;
};
