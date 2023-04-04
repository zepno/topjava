<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/topjava.common.js" defer></script>
<script type="text/javascript" src="resources/js/topjava.meals.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>
<section class="jumbotron pt-4">
    <div class="container">
        <h3 class="text-center"><spring:message code="meal.title"/></h3>
        <form id="filterForm" method="get" action="meals/filter">
            <div class="row">
                <div class="col-2">
                    <label for="startDate"><spring:message code="meal.startDate"/>:</label>
                    <input class="form-control" type="date" name="startDate" id="startDate"
                           value="${param.startDate}">
                </div>
                <div class="col-2">
                    <label for="endDate"><spring:message code="meal.endDate"/>:</label>
                    <input class="form-control" type="date" name="endDate" id="endDate"
                           value="${param.endDate}">
                </div>
                <div class="offset-2 col-3">
                    <label for="startTime"><spring:message code="meal.startTime"/>:</label>
                    <input class="form-control" type="time" name="startTime" id="startTime"
                           value="${param.startTime}">
                </div>
                <div class="col-3">
                    <label for="endTime"><spring:message code="meal.endTime"/>:</label>
                    <input class="form-control" type="time" name="endTime" id="endTime"
                           value="${param.endTime}">
                </div>
            </div>
            <button class="btn btn-primary" type="submit"><spring:message code="meal.filter"/></button>
        </form>
    </div>
    <br>
    <button class="btn btn-primary" onclick="add()">
        <span class="fa fa-plus"></span>
        <spring:message code="meal.add"/>
    </button>
    <br>
    <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
        <table class="table table-striped" id="datatable">
            <thead>
            <tr>
                <th><spring:message code="meal.dateTime"/></th>
                <th><spring:message code="meal.description"/></th>
                <th><spring:message code="meal.calories"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${requestScope.meals}" var="meal">
                <jsp:useBean id="meal" type="ru.javawebinar.topjava.to.MealTo"/>
                <tr data-meal-excess="${meal.excess}" id="${meal.id}">
                    <td>
                            <%--${meal.dateTime.toLocalDate()} ${meal.dateTime.toLocalTime()}--%>
                            <%--<%=TimeUtil.toString(meal.getDateTime())%>--%>
                            <%--${fn:replace(meal.dateTime, 'T', ' ')}--%>
                            ${fn:formatDateTime(meal.dateTime)}
                    </td>
                    <td>${meal.description}</td>
                    <td>${meal.calories}</td>
                    <td><a href="meals/update?id=${meal.id}"><spring:message code="common.update"/></a></td>
                        <%--                        <td><a href="meals/delete?id=${meal.id}"><spring:message code="common.delete"/></a></td>--%>
                    <td><a class="delete"><span class="fa fa-remove"></span></a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <jsp:include page="fragments/footer.jsp"/>
</body>
</html>