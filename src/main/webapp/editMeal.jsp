<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ru">
<head>
    <title>Meal</title>
</head>
<body>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>${param.action == 'create' ? 'add meal' : 'edit meal'}</h2>
<jsp:useBean id="meal" type="ru.javawebinar.topjava.model.Meal" scope="request"/>
<form method="post" action="meals">
    <input type="hidden" name="id" value="${meal.id}">
    date Time : <input type="datetime-local" name="dateTime" value="${meal.dateTime}">
    description : <input type="text" name="description" value="${meal.description}">
    calories : <input type="number" name="calories" value="${meal.calories}">
    <button type="submit">Save</button>
    <button type="button" onclick="window.history.back()">Cancel</button>
</form>
</body>