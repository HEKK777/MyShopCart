<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.shopcart.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .cart {
            width: 80%;
            margin: 40px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .cart h1 {
            text-align: center;
            color: #4CAF50;
        }
        .cart ul {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }
        .cart li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            border-bottom-color: #dee2e6;
        }
        .product-name {
            flex: 1;
            color: #212529;
        }
        .price {
            margin-right: 20px;
            color: #FF0000;
        }
        .quantity {
            margin-right: 20px;
            color: #6c757d;
        }
        .total-price {
            font-weight: bold;
            font-size: 18px;
        }
        .remove-button {
            background-color: #f00;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            background-color: #dc3545;
            border-radius: 4px;
        }
        .remove-button:hover {
            opacity: 0.85;
        }
        .total-price {
            color: #FF0000;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            background-color: #4CAF50;
            border-radius: 4px;
            text-decoration: none;
            transition: opacity 0.3s;
        }

        .button:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>
    <div class="cart">
    <h1><i class="fas fa-shopping-cart">购物车</i></h1>
        <%
            // 从Session中获取购物车
            Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
            double totalPrice = 0.0;
            if (cart != null && !cart.isEmpty()) {
        %>
            <ul>
                <% for (CartItem item : cart.values()) { %>
                    <li>
                        <div class="product-name"><%= item.getName() %></div>
                        <div class="price">￥<%= item.getPrice() %></div>
                        <div class="quantity">× <%= item.getQuantity() %></div>
                        <form action="remove-from-cart" method="post">
                            <input type="hidden" name="productName" value="<%= item.getName() %>">
                            <input type="submit" class="remove-button" value="移除"> <i class="fas fa-trash-alt"></i>
                        </form>
                    </li>
                    <%
                        // 累计总价
                        totalPrice += item.getTotalPrice();
                        DecimalFormat df = new DecimalFormat("#.00");
                    %>
                <% } %>
            </ul>
            <p class="total-price">总价：￥<%= new DecimalFormat("0.00").format(totalPrice) %></p>
        <%
            } else {
        %>
            <p style= "text-align: center; font-weight: 700; font-size: 50px;">购物车为空</p>
        <%
            }
        %>
    </div>
    <div style="text-align:center; margin-top:20px;">
            <a href="index.jsp" class="button">返回商品列表</a>
    </div>
</body>
</html>