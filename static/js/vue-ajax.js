//这里是对获取数据的一个封装
var vueAjax = (function(){
  return function(url,element){
    $.ajax({
                type:"get",              
                 url:url,  
                dataType:"json",
                success:function(data){
                    console.log(data);
                    var a=new Vue({
                        el:element,
                        data:{
                            msg:data
                        }
                    })
                },
                error:function(data){
                    console.log("发生错误")
                }
            });
} 
})();
