<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>天科闲置 - 商品详情</title>

      <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${cp}/css/style.css" rel="stylesheet">

      <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
      <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${cp}/js/layer.js" type="text/javascript"></script>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/js/respond.min.js"></script>

  </head>
  <body>
  <script>
      function getUserPhoneNumber(id) {
          var phoneNumber = "";
          var user = {};
          user.id = id;
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/getUserAddressAndPhoneNumber',
              data : user,
              dataType : 'json',
              success : function(result) {
                  phoneNumber = result.phoneNumber;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          return phoneNumber;
      }
      function getUserByUserid(uuid) {
          var user = {};
          user.user_id = uuid;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUserByUserId',
              data : user,
              dataType : 'json',
              success : function(result) {
                  id = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误2');
              }
          });
          return id;
      }
  </script>

    <jsp:include page="include/header.jsp"/>


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-10 col-md-10">
                <h1>${productDetail.name}</h1>
                <hr/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-5 col-md-5">
                <img class="detail-img" src="${cp}/img/${productDetail.id}.jpg">
            </div>
            <div class="col-sm-5 col-md-5 detail-x">
                <table class="table table-striped">
                    <tr>
                        <th>名称</th>
                        <td>${productDetail.name}</td>
                    </tr>
                    <tr>
                        <th>二手价</th>
                        <td>${productDetail.price}</td>
                    </tr>
                    <tr>
                        <th>联系人</th>
                        <td id="sale_nickname"></td>
                    </tr>
                    <tr>
                        <th>联系方式</th>
                        <td id="sale_phone"></td>
                    </tr>

                </table>
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="">联系卖家购买</button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-10 col-md-10 col-lg-10">
                <hr class="division"/>
                <h3>闲置详情</h3>
                ${productDetail.description}
                <hr/>
                <div id="inputArea"></div>
            </div>
        </div>
    </div>
  <script>
      function getUserByUserid(uuid) {
          var phoneNumber = "";
          var user = {};
          user.user_id = uuid;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUserByUserId',
              data : user,
              dataType : 'json',
              success : function(result) {
                  id = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误2');
              }
          });
          return id;
      }
      sale_user = JSON.parse(getUserByUserid('${productDetail.user_id}'));
      var resultTd = document.getElementById("sale_phone");
      resultTd.innerHTML = getUserPhoneNumber(sale_user['id']);
      var nicknameTd = document.getElementById("sale_nickname");
      nicknameTd.innerHTML = sale_user['nickName'];
  </script>
    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>
  </body>
</html>