<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <title>List Category</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/admin/categories">Vu Nguyen Huong</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="/admin/categories">List Categories</a>
                <a class="nav-link" href="/admin/categories/add">Add Categories</a>
                <a class="nav-link" href="#">Pricing</a>
                <form class="d-flex" action="/admin/categories/searchpagination">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="name" name="name">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
</nav>
<section class="row">
    <div class="col mt-4">
        <div class="card">
            <div class="card-header">List Category</div>
            <div class="card-body">
                <!-- Hi???n th??ng b??o -->
                <c:if test="${message != null }">
                    <div class="alert alert-primary" role="alert">
                        <i>${message}</i>
                    </div>
                </c:if>
                <!-- H???t th??ng b??o -->

                <table class="table table-dark table-hover">
                    <thead class="thead-inverse">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Code</th>
                        <th scope="col">Name</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ categories }" var="category">
                        <tr>
                            <td scope="row">${ category.categoryId }</td>
                            <td>${ category.categoryCode }</td>
                            <td>${ category.categoryName }</td>
                            <td>${ category.status ? 'Ho???t ?????ng' : 'Kh??ng ho???t ?????ng'}</td>
                            <td>
                                <a href="/admin/categories/view/${ category.categoryId }" class="btn btn-outline-info">
                                    <i class="fa fa-info"></i> Th??ng tin</a>
                                <a href="/admin/categories/edit/${ category.categoryId }"
                                   class="btn btn-outline-warning">
                                    <i class="fa fa-edit"></i> C???p nh???t</a>
                                <a href="/admin/categories/delete/${ category.categoryId }"
                                   class="btn btn-outline-danger">
                                    <i class="fa fa-trash"></i> X??a</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${ categoryPage.totalPages > 0 }">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            <li class="${1==categoryPage.number + 1 ? 'page-item-active' : 'page-tem'}">
                                <a class="page-link" href="<c:url value="/admin/categories/searchpagination?name=${categoryName}&size=${categoryPage.size}&page=${1}"></c:url>">Previous</a>
                            </li>
                            <c:forEach items="${pageNumbers}" var="pageNumber">
                                <c:if test="${categoryPage.totalPages > 1}">
                                    <li class="${1==categoryPage.number + 1 ? 'page-item-active' : 'page-tem'}" href="<c:url value="/admin/categories/searchpagination?name=${categoryName}&size=${categoryPage.size}&page=${category.totalPages}">
                                        <a>${pageNumber}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <li class="${1==categoryPage.number + 1 ? 'page-item-active' : 'page-tem'}">
                                <a class="page-link" href="<c:url value="/admin/categories/searchpagination?name=${categoryName}&size=${categoryPage.size}&page=${category.totalPages}"></c:url>">Next</a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>
</section>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>