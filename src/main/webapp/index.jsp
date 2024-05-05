<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.shopcart.bean.Product" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <title>商品列表</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #000000;
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
        }

        .product-item {
            width: 30%;
            margin: 1%;
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            padding: 10px;
            text-align: center;
        }

        .product-item img {
            width: 100%;
            max-width: 200px;
            height: auto;
        }

        .product-name {
            margin-top: 10px;
            font-weight: bold;
            color: #333333;
        }

        .product-price {
            float: left;
            color: #FF0000;
        }

        .add-to-cart {
            float: right;
            margin-right: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-to-cart:hover {
                background-color: #45a049;
            }

        .cart-link {
            position: fixed;
            right: 20px;
            top: 20px;
            z-index: 100;
            font-size: 16px;
            color: white;
            border: none;
            background-color: #4CAF50;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }

        .cart-link:hover {
            background-color: #45a049;
        }
    </style>
    <style>
        /* 弹出表单的外层容器样式 */
        #addProductForm {
            display: none; /* 初始时隐藏表单 */
            position: fixed; /* 固定位置 */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* 居中显示 */
            width: 400px; /* 设置表单宽度 */
            background-color: #ffffff; /* 设置背景颜色为白色 */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); /* 添加阴影效果 */
            border-radius: 8px; /* 设置圆角 */
            padding: 20px; /* 内边距 */
            z-index: 1000; /* 确保表单在最上层 */
            overflow: hidden; /* 隐藏超出部分 */
        }

        /* 表单标题样式 */
        #addProductForm h2 {
            text-align: center; /* 居中标题 */
            margin-bottom: 20px; /* 与下方内容保持间距 */
        }

        /* 表单标签样式 */
        #addProductForm label {
            display: block; /* 块级显示 */
            margin-bottom: 5px; /* 与下方输入框保持间距 */
        }

        /* 表单输入框样式 */
        #addProductForm input[type="text"] {
            width: 100%; /* 宽度占满容器 */
            padding: 10px; /* 内边距 */
            margin-bottom: 15px; /* 与下方元素保持间距 */
            border: 1px solid #ccc; /* 边框样式 */
            border-radius: 4px; /* 输入框圆角 */
            box-sizing: border-box; /* 确保内边距不会影响元素宽度 */
        }

        #addProductForm input[type="number"] {
            width: 100%; /* 宽度占满容器 */
            padding: 10px; /* 内边距 */
            margin-bottom: 15px; /* 与下方元素保持间距 */
            border: 1px solid #ccc; /* 边框样式 */
            border-radius: 4px; /* 输入框圆角 */
            box-sizing: border-box; /* 确保内边距不会影响元素宽度 */
        }

        /* 表单提交按钮样式 */
        #addProductForm input[type="submit"] {
            width: 100%; /* 宽度占满容器 */
            padding: 10px; /* 内边距 */
            background-color: #4CAF50; /* 按钮背景颜色 */
            color: white; /* 按钮文字颜色 */
            border: none; /* 无边框 */
            border-radius: 4px; /* 按钮圆角 */
            cursor: pointer; /* 鼠标悬停时变为手形 */
            margin-bottom: 15px; /* 与下方元素保持间距 */
        }

        /* 表单提交按钮悬停样式 */
        #addProductForm input[type="submit"]:hover {
            background-color: #45a049; /* 悬停时背景颜色变深 */
        }

        /* 表单关闭按钮样式 */
        #addProductForm button[type="button"] {
           width: 100%; /* 宽度占满容器 */
           padding: 10px; /* 内边距 */
           background-color: #4CAF50; /* 按钮背景颜色 */
           color: white; /* 按钮文字颜色 */
           border: none; /* 无边框 */
           border-radius: 4px; /* 按钮圆角 */
           cursor: pointer; /* 鼠标悬停时变为手形 */
        }

        /* 弹出表单的外层容器样式 */
        #editProductFrom {
            position: fixed; /* 固定位置 */
            bottom: 20px; /* 距离页面底部 20px */
            left: 50%; /* 水平居中 */
            transform: translateX(-50%); /* 水平居中 */
            width: 100%; /* 设置表单宽度 */
            max-width: 1000px; /* 设置表单的最大宽度 */
            background-color: #ffffff; /* 设置背景颜色为白色 */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); /* 添加阴影效果 */
            border-radius: 8px; /* 设置圆角 */
            padding: 20px; /* 内边距 */
        }

        /* 表单标题样式 */
        #editProductFrom h2 {
            text-align: center; /* 居中标题 */
            margin-bottom: 20px; /* 与下方内容保持间距 */
        }

        /* 表单标签样式 */
        #editProductFrom label {
            display: block; /* 块级显示 */
            margin-bottom: 5px; /* 与下方输入框保持间距 */
        }

        /* 表单输入框样式 */
        #editProductFrom input[type="text"] {
            width: 100%; /* 宽度占满容器 */
            padding: 10px; /* 内边距 */
            margin-bottom: 15px; /* 与下方元素保持间距 */
            border: 1px solid #ccc; /* 边框样式 */
            border-radius: 4px; /* 输入框圆角 */
            box-sizing: border-box; /* 确保内边距不会影响元素宽度 */
        }

        #editProductFrom input[type="number"] {
            width: 100%; /* 宽度占满容器 */
            padding: 10px; /* 内边距 */
            margin-bottom: 15px; /* 与下方元素保持间距 */
            border: 1px solid #ccc; /* 边框样式 */
            border-radius: 4px; /* 输入框圆角 */
            box-sizing: border-box; /* 确保内边距不会影响元素宽度 */
        }

        /* 表单提交按钮样式 */
        #editProductFrom input[type="submit"] {
            width: 100%; /* 宽度占满容器 */
            padding: 10px; /* 内边距 */
            background-color: #4CAF50; /* 按钮背景颜色 */
            color: white; /* 按钮文字颜色 */
            border: none; /* 无边框 */
            border-radius: 4px; /* 按钮圆角 */
            cursor: pointer; /* 鼠标悬停时变为手形 */
            margin-bottom: 15px; /* 与下方元素保持间距 */
        }

        /* 表单提交按钮悬停样式 */
        #editProductFrom input[type="submit"]:hover {
            background-color: #45a049; /* 悬停时背景颜色变深 */
        }

        /* 表单关闭按钮样式 */
        #editProductFrom button[type="button"] {
           width: 100%; /* 宽度占满容器 */
           padding: 10px; /* 内边距 */
           background-color: #4CAF50; /* 按钮背景颜色 */
           color: white; /* 按钮文字颜色 */
           border: none; /* 无边框 */
           border-radius: 4px; /* 按钮圆角 */
           cursor: pointer; /* 鼠标悬停时变为手形 */
        }
    </style>

</head>
<body>
    <h1>商品列表</h1>
    <%
        List<Product> lists = (List<Product>)request.getAttribute("lists");
    %>
    <div class="product-list">
        <% for (Product product: lists) { %>
            <div class="product-item">
                <img src="<%= product.getImage() %>" alt="商品图片">
                <div class="product-name"><%= product.getName() %></div>
                <div style="clear: both;">
                    <form action="addToCart" method="post">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <input type="hidden" name="productName" value="<%= product.getName() %>">
                        <input type="hidden" name="price" value="<%= product.getPrice() %>">
                        <input class="add-to-cart" type="submit" value="添加到购物车">
                    </form>
                    <form action="deleteProduct" method="post">
                        <input type="hidden" name="id" value="<%= product.getId() %>">
                        <input type="submit" class="add-to-cart" value="删除商品">
                    </form>
                    <form action="getProductById" method="post">
                        <input type="hidden" name="edit_id" value="<%= product.getId() %>">
                        <input type="submit" id="editProductBtn" class="add-to-cart" value="编辑商品">
                    </form>
                </div>
                <div class="product-price">￥<%= product.getPrice() %></div>
            </div>
        <% } %>
    </div>
    <div>
        <a class="cart-link" href="/getAllShopCart"><i class="fas fa-shopping-cart"></i> 查看购物车</a>
    </div>


    <div style="position: absolute; top: 10px; left: 10px;">
        <button id="addProductBtn" class="add-to-cart">添加商品</button>
    </div>

    <div id="addProductForm">
        <h2>添加商品信息</h2>
        <form action="/addProduct" method="post">
            <!-- 表单内容，如商品名称、价格、图片等 -->
            <input type="text" name="Name" placeholder="商品名称">
            <input type="number" step="0.01" name="Price" placeholder="商品价格">
            <input type="text" name="Image" placeholder="商品图片路径">
            <!-- 其他需要的输入字段 -->
            <input type="submit" value="提交">
            <button type="button" id="closeFormBtn">关闭</button>
        </form>
    </div>

    <%
         Product edit_product = (Product)request.getAttribute("product");
         if (edit_product == null) {
             edit_product = new Product();
             edit_product.setId(0);
             edit_product.setName("");
             edit_product.setPrice(0.0);
             edit_product.setImage("");
         }
    %>
    <div id="editProductFrom">
        <h2>编辑商品信息</h2>
        <form action="/editProduct" method="post">
            <!-- 表单内容，如商品名称、价格、图片等 -->
            <input type="hidden" name="id" value="<%= edit_product.getId() %>">
            <input type="text" name="name" value="<%= edit_product.getName() %>" placeholder="商品名称">
            <input type="number" step="0.01" name="price" value="<%= edit_product.getPrice() %>" placeholder="商品价格">
            <input type="text" name="image" value="<%= edit_product.getImage() %>" placeholder="商品图片路径">
            <!-- 其他需要的输入字段 -->
            <input type="submit" value="提交">
            <button type="button" id="closeEditFormBtn">关闭</button>
        </form>
    </div>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- 商品列表等其他内容 -->
    <script>
        document.getElementById('addProductBtn').addEventListener('click', function() {
            document.getElementById('addProductForm').style.display = 'block'; // 显示表单
        });

        document.getElementById('closeFormBtn').addEventListener('click', function() {
            document.getElementById('addProductForm').style.display = 'none'; // 隐藏表单
        });

        document.getElementById('editProductBtn').addEventListener('click', function() {
            document.getElementById('editProductFrom').style.display = 'block'; // 显示表单
        });

        document.getElementById('closeEditFormBtn').addEventListener('click', function() {
            document.getElementById('editProductFrom').style.display = 'none'; // 隐藏表单
        });
    </script>
</body>
</html>