<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
        <th></th>
        <th></th>
    </tr>
    <jsp:useBean id="mealTos" scope="request" type="java.util.List"/>
    <c:forEach items="${mealTos}" var="meal">
        <jsp:useBean id="meal" type="ru.javawebinar.topjava.model.MealTo"/>
        <tr style="color: ${meal.excess ? "red" : "green"}">
            <td>${f:replace(meal.dateTime, 'T', ' ')}</td>
            <td>${meal.description}</td>
            <td>${meal.calories}</td>
            <td>Update</td>
            <td>Delete</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>