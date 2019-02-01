<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Title</title>
    <link href="${contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resource/css/common.css" rel="stylesheet">
</head>
<body>
<form:form  action="/seach" method="get">
    <div class="form-group row">
        <label for="sDet" class=" col-sm-offset-2 col-sm-1 col-form-label">Поиск</label>
        <div class="col-sm-6">
        <input type="text" class="form-control" name="seachName" id="sDet" placeholder="Введите наименование товара">
        </div>
        <div class="col-sm-2">
        <input type="submit" class="btn btn-primary"  value="Искать"/>
        </div>
    </div>
</form:form>

    <c:set var="number" value="${(page-1)*10+1}" scope="page"/>

    <c:if test="${!empty seachData}">
        <div class="alert alert-success" role="alert"><p class="text-center"> ${seachData}</p></div>
    </c:if>

    <div class="container">
        <div class="col-sm-offset-4 col-sm-5">
    <form:form action="/" method="get">
    <input style="margin: 5px;" type="radio" name="filter" class="form-check-input" value="0" <c:if test="${filters.name()=='none'}">checked</c:if>>Все</input>
        <input style="margin: 5px;" type="radio" name="filter" class="form-check-input" value="1" <c:if test="${filters.name()=='necessary'}">checked</c:if>>Необходимые</input>
        <input style="margin: 5px;" type="radio" name="filter" class="form-check-input" value="2" <c:if test="${filters.name()=='optional'}">checked</c:if>>Опциональные</input>
        <input style="margin: 5px;" class="btn btn-primary" type="submit" value="Выбрать"/>
    </form:form>
        </div>
    </div>

    <c:if test="${!empty details}">
<div class="container-fluid">
        <table class="table table-striped" style="margin: 5px;">
            <tr >
                <th class="col-sm-2" >№</th>
                <th class="col-sm-2" >Наименование</th>
                <th class="col-sm-2" >Количество</th>
                <th class="col-sm-2" >Необходимость</th>
                <th class="col-sm-2" ></th>
                <th class="col-sm-2" ></th>
            </tr>
            <c:forEach items="${details}" var="detail">
                <tr >
                    <td class="col-sm-2">${number}</td>
                    <c:set  var="number" value="${number+1}" scope="page"/>
                    <td  class="col-sm-2">${detail.name}</td>
                    <td  class="col-sm-2">${detail.count}</td>
                    <td  class="col-sm-2">${detail.necessary==true?"да":"нет"}</td>
                    <td  class="col-sm-2"><a class="btn btn-warning btn-sm" href="<c:url value='/edit/${detail.id}#addForm'/>">Редактировать</a></td>
                    <td  class="col-sm-2"><a class="btn btn-danger btn-sm" href="<c:url value='/remove/${detail.id}'/>">Удалить</a></td>
                </tr>
            </c:forEach>
        </table>
</div>
    </c:if>

<div class="text-center">
        <ul class="pagination">
        <c:if test="${page>2}">
            <li class="page-item"><a class="page-link" href="<c:url value="/?page=1"/>">1</a></li>
        </c:if>
        <c:if test="${page>3}">
            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
        </c:if>
        <c:if test="${page>1}">
            <li class="page-item"><a class="page-link" href="<c:url value="/?page=${page-1}"/>">${page-1}</a></li>
        </c:if>
        <c:if test="${page!=0}">
            <li class="page-item disabled"><a class="page-link" href="#">${page}</a></li>
        </c:if>
        <c:if test="${page<maxPage}">
            <li class="page-item"><a class="page-link" href="<c:url value="/?page=${page+1}"/>">${page+1}</a></li>
        </c:if>
            <c:if test="${maxPage-page>2}">
                <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
            </c:if>
        <c:if test="${maxPage-page>1}">
            <li class="page-item"><a class="page-link" href="<c:url value="/?page=${maxPage}"/>">${maxPage}</a></li>
        </c:if>
        </ul>
</div>

    <div class="alert alert-success" role="alert">
    <p class="text-center">Можно собрать ${canBuild} компьютеров.</p>
    </div>

    <div id="addForm" ><form:form action="/add#addForm" commandName="updateDetail">

                        <form:hidden path="id"/>
        <div class="form-group row">
            <label for="nameDet" class="col-sm-offset-2 col-sm-2 c col-form-label "  path="name">Наименование</label>
            <div class="col-sm-6">
            <form:input class="form-control" id="nameDet" path="name"/>
            </div>
        </div>

        <div class="text-center alert-danger">
            <form:errors path="name"/>
        </div>

        <div class="form-group row">
            <label for="countDet" class="col-sm-offset-2 col-sm-2 c col-form-label "  path="count">Количество</label>
            <div class="col-sm-6">
            <form:input id="countDet" class="form-control" path="count"/>
            </div>
        </div>
        <div class="text-center alert-danger">
            <form:errors path="count" />
        </div>
        <div class="form-check ">
            <div class="col-sm-offset-5 col-sm-2">
            <form:checkbox class="form-check-input" id="necDet" path="necessary"/>
             <label path="necessary" for="necDet">Необходимость</label>
            </div>
        </div>
        <div class="col-sm-offset-5 col-sm-2">
        <c:if test="${!empty updateDetail.name}">
            <input class="btn btn-primary" type="submit"
                   value="<spring:message text="Редактировать"/>"/>
        </c:if>
        <c:if test="${empty updateDetail.name}">
            <input class="btn btn-primary" type="submit"
                   value="<spring:message text="Добавить"/>"/>
        </c:if>
        </div>
    </form:form></div>
</body>
</html>
