<%--
  Created by IntelliJ IDEA.
  User: sakitami
  Date: 2023/6/21
  Time: 下午2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>天科闲置</title>
  <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp}/css/style.css" rel="stylesheet">

  <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
  <script src="${cp}/js/ajaxfileupload.js" type="text/javascript"></script>
  <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="${cp}/js/layer.js" type="text/javascript"></script>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/respond.min.js"></script>
</head>
<body>
<jsp:include page="include/header.jsp"/>

<div class="container-fluid">
  <div class="row">

    <div class="col-sm-3 col-md-2 sidebar sidebar-1">
      <ul class="nav nav-sidebar">
        <li class="list-group-item-diy"><a href="#section1">我的闲置</a></li>
        <li class="list-group-item-diy"><a href="#section2">添加商品</a></li>
      </ul>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

      <div class="col-md-12">
        <hr/>
        <h1><a name="section1">我的闲置</a></h1>
        <hr/>
        <div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
        <br/>
      </div>

      <div class="col-md-12">
        <hr/>
        <h1><a name="section2">添加商品</a></h1>
        <hr/>
        <div class="col-sm-offset-2 col-md-offest-2">
          <div  class="form-horizontal">
            <div class="form-group">
              <label for="productName" class="col-sm-2 col-md-2 control-label">商品名称</label>
              <div class="col-sm-6 col-md-6">
                <input type="text" class="form-control" id="productName" placeholder="商品名称" />
              </div>
            </div>
            <div class="form-group">
              <label for="productDescribe" class="col-sm-2 col-md-2 control-label">商品描述</label>
              <div class="col-sm-6 col-md-6">
                <textarea type="text" class="form-control" id="productDescribe" placeholder="balabalabalabala"></textarea>
              </div>
            </div>
            <div class="form-group">
              <label for="keyWord" class="col-sm-2 col-md-2 control-label">关键词</label>
              <div class="col-sm-6 col-md-6">
                <textarea type="text" class="form-control" id="keyWord" placeholder="关键词1;关键词2;"></textarea>
              </div>
            </div>
            <div class="form-group">
              <label for="productPrice" class="col-sm-2 col-md-2 control-label">商品价格</label>
              <div class="col-sm-6 col-md-6">
                <input type="text" class="form-control" id="productPrice" placeholder="399" />
              </div>
            </div>
            <div class="form-group">
              <label for="productCount" class="col-sm-2 col-md-2 control-label">商品原价</label>
              <div class="col-sm-6 col-md-6">
                <input type="text" class="form-control" id="productCount" placeholder="100" />
              </div>
            </div>
            <div class="form-group">
              <label for="productType" class="col-sm-2 col-md-2 control-label">商品类别</label>
              <div class="col-sm-6 col-md-6">
                <select name="productType" class="form-control" id="productType">
                  <option value="1">服饰</option>
                  <option value="2">数码</option>
                  <option value="3">书籍</option>
                  <option value="4">游戏</option>
                  <option value="5">生活</option>
                  <option value="6">化妆</option>
                  <option value="7">运动</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="productImgUpload" class="col-sm-2 col-md-2 control-label" accept="image/jpg">商品图片</label>
              <div class="col-sm-6 col-md-6">
                <input name="productImgUpload" type="file"  id="productImgUpload"/>
                <p class="help-block">上传的图片大小应为280*160大小</p>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-6" id="imgPreSee">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-6">
                <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="addProduct()">添加商品</button>
              </div>
            </div>
          </div>
          <br/>
        </div>
      </div>
    </div>
  </div>
</div>



<jsp:include page="include/foot.jsp"/>
<script type="text/javascript">

  var loading = layer.load(0);
  listAllProduct();
  layer.close(loading);

  function listAllProduct() {
    var productArea = document.getElementById("productArea");
    var allProduct = getAllProducts();
    var html="";
    productArea.innerHTML = '';
    for(var i=0;i<allProduct.length;i++){
      var imgURL = "${cp}/img/"+allProduct[i].id+".jpg";
      html+='<div class="col-sm-4 col-md-4 pd-5">'+
              '<div class="boxes">'+
              '<div class="big bigimg">'+
              '<img src="'+imgURL+'">'+
              '</div>'+
              '<p class="font-styles center">'+allProduct[i].name+'</p>'+
              '<p class="pull-left">价格：'+allProduct[i].price+'</p>'+
              '<div class = "row">'+
              '<button class="btn btn-primary delete-button" type="submit" onclick="deleteProduct('+allProduct[i].id+')">删除商品</button>'+
              '</div>'+
              '</div>'+
              '</div>';
    }
    productArea.innerHTML+=html;
  }
  //列出所有商品
  function getAllProducts() {
    judgeIsLogin();
    var allProducts = null;
    var nothing = {};
    $.ajax({
      async : false, //设置同步
      type : 'POST',
      url : '${cp}/getAllProducts?userid=${currentUser.user_id}',
      data : nothing,
      dataType : 'json',
      success : function(result) {
        if (result!=null) {
          allProducts = result.allProducts;
        }
        else{
          layer.alert('查询所有商品错误');
        }
      },
      error : function(resoult) {
        layer.alert('查询所有商品错误');
      }
    });
    allProducts = eval("("+allProducts+")");
    return allProducts;
  }

  function deleteProduct(id) {
    var product = {};
    product.id = id;
    var deleteResult = "";
    $.ajax({
      async : false,
      type : 'POST',
      url : '${cp}/deleteProduct',
      data : product,
      dataType : 'json',
      success : function(result) {
        deleteResult = result;
      },
      error : function(result) {
        layer.alert('删除商品错误');
      }
    });
    layer.msg(deleteResult.message);
    listAllProduct();
  }

  function judgeIsLogin() {
    if("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" ==""){
      window.location.href = "${cp}/login";
    }
  }

  function addProduct() {
    var loadings = layer.load(0);
    var product = {};
    product.name = document.getElementById("productName").value;
    product.description = document.getElementById("productDescribe").value;
    product.keyWord = document.getElementById("keyWord").value;
    product.price = document.getElementById("productPrice").value;
    product.counts = document.getElementById("productCount").value;
    product.type = document.getElementById("productType").value;
    product.user_id = '${currentUser.user_id}';
    var addResult="";
    $.ajax({
      async : false,
      type : 'POST',
      url : '${cp}/addProduct',
      data : product,
      dataType : 'json',
      success : function(result) {
        addResult = result.result;
      },
      error : function(result) {
        layer.alert('添加商品错误');
      }
    });
    if(addResult == "success") {
      fileUpload();
      layer.msg('添加商品成功', {icon: 1, time: 1000});
      layer.close(loadings)
    }
    listAllProduct();
  }

  function fileUpload() {
    var results = "";
    var name = document.getElementById("productName").value;
    $.ajaxFileUpload({
      url:'${cp}/uploadFile?name='+name,
      secureuri:false ,
      fileElementId:'productImgUpload',
      type:'POST',
      dataType : 'text',
      success: function (result){
        result = result.replace(/<pre.*?>/g, '');
        result = result.replace(/<PRE.*?>/g, '');
        result = result.replace("<PRE>", '');
        result = result.replace("</PRE>", '');
        result = result.replace("<pre>", '');
        result = result.replace("</pre>", '');
        result = JSON.parse(result);
        results = result.result;
        if(results == "success") {
          layer.msg("图片上传成功", {icon: 1});
          window.location.href = "${cp}/second_hand_manage";
        }
        else {
          layer.msg("图片上传失败", {icon: 0});
        }

      },
      error: function ()
      {
        layer.alert("上传错误");
      }}
    );
  }
</script>
</body>
</html>