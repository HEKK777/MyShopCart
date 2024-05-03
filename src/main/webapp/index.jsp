<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "com.shopcart.bean.Product" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

    <script>
    $(document).ready(function() {
        $('.add-to-cart input[type="submit"]').click(function(e) {
            e.preventDefault();
            var form = $(this).closest('form');

            $.ajax({
                type: 'POST',
                url: form.attr('action'),
                data: form.serialize(),
                success: function(response) {
                    showAlertAndClose('商品已成功添加到购物车！', 1000); // 弹窗提示添加成功，并设置1秒后关闭
                },
                error: function(xhr, status, error) {
                    alert('添加购物车失败：' + error);
                }
            });
        });
    });

    function showAlertAndClose(message, duration) {
        var alertDiv = $('<div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999; padding: 20px; background-color: #4CAF50; color: white; border: 1px solid #f5c6cb; border-radius: 5px;">'+ message +'</div>');
        alertDiv.appendTo('body').fadeIn('fast');
        setTimeout(function() {
            alertDiv.fadeOut('fast', function(){
                $(this).remove();
            });
        }, duration);
    }
    </script>

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
                    <form action="add-to-cart" method="post" class="add-to-cart">
                        <input type="hidden" name="productName" value="<%= product.getName() %>">
                        <input type="hidden" name="price" value="<%= product.getPrice() %>">
                        <input class="add-to-cart" type="submit" value="添加到购物车">
                    </form>
                    <div class="product-price">￥<%= product.getPrice() %></div>
                </div>
            </div>
        <% } %>
    </div>
    <div>
        <a class="cart-link" href="cart.jsp"><i class="fas fa-shopping-cart"></i> 查看购物车</a>
    </div>
</body>
</html>