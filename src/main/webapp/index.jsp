<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.shopcart.entity.Product" %>
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
        #addProductForm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            padding: 20px;
            z-index: 1000;
            overflow: hidden;
        }

        #addProductForm h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        #addProductForm label {
            display: block;
            margin-bottom: 5px;
        }

        #addProductForm input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #addProductForm input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #addProductForm input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 15px;
        }

        /* 表单提交按钮悬停样式 */
        #addProductForm input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* 表单关闭按钮样式 */
        #addProductForm button[type="button"] {
           width: 100%;
           padding: 10px;
           background-color: #4CAF50;
           color: white;
           border: none;
           border-radius: 4px;
           cursor: pointer;
        }

        /* 弹出表单的外层容器样式 */
        #editProductFrom {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            max-width: 1000px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            padding: 20px;
        }

        /* 表单标题样式 */
        #editProductFrom h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* 表单标签样式 */
        #editProductFrom label {
            display: block;
            margin-bottom: 5px;
        }

        /* 表单输入框样式 */
        #editProductFrom input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #editProductFrom input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #editProductFrom input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 15px;
        }

        #editProductFrom input[type="submit"]:hover {
            background-color: #45a049;
        }

        #editProductFrom button[type="button"] {
           width: 100%;
           padding: 10px;
           background-color: #4CAF50;
           color: white;
           border: none;
           border-radius: 4px;
           cursor: pointer;
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
            <input type="text" name="Name" placeholder="商品名称">
            <input type="number" step="0.01" name="Price" placeholder="商品价格">
            <input type="text" name="Image" placeholder="商品图片路径">
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
        <form action="/editProduct" method="post">
            <input type="hidden" name="id" value="<%= edit_product.getId() %>">
            <input type="text" name="name" value="<%= edit_product.getName() %>" placeholder="商品名称">
            <input type="number" step="0.01" name="price" value="<%= edit_product.getPrice() %>" placeholder="商品价格">
            <input type="text" name="image" value="<%= edit_product.getImage() %>" placeholder="商品图片路径">
            <input type="submit" value="提交">
            <button type="button" id="closeEditFormBtn">关闭</button>
        </form>
    </div>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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