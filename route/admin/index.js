const express=require('express');
const common=require('../../libs/common');

module.exports=function (){
  var router=express.Router();
  //检查登录状态
  router.use((req, res, next)=>{
    if(!req.session['admin_id'] && req.url!='/login'){ //没有登录
      res.redirect('/admin/login');
    }else{
      next();
    }
  });
  router.get('/', (req, res)=>{
    res.render('admin/index.ejs', {});
  });

  router.use('/login', require('./login')());
  router.use('/products', require('./products')());
  router.use('/banners', require('./banners')());
  router.use('/news', require('./news')());
  router.use('/patner', require('./patner')());
  router.use('/aboutus', require('./aboutus')());
  router.use('/fuwu', require('./fuwu')());
  router.use('/contact', require('./contact')());
  router.use('/nav', require('./nav')());
  router.use('/userlist', require('./userlist')());
  return router;
};
