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
                <form class="d-flex" action="/admin/categories/search">
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
                <!-- Hiện thông báo -->
                <c:if test="${message != null }">
                    <div class="alert alert-primary" role="alert">
                        <i>${message}</i>
                    </div>
                </c:if>
                <!-- Hết thông báo -->

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
                            <td>${ category.status ? 'Hoạt động' : 'Không hoạt động'}</td>
                            <td>
                                <a href="/admin/categories/view/${ category.categoryId }" class="btn btn-outline-info">
                                    <i class="fa fa-info"></i> Thông tin</a>
                                <a href="/admin/categories/edit/${ category.categoryId }"
                                   class="btn btn-outline-warning">
                                    <i class="fa fa-edit"></i> Cập nhật</a>
                                <a href="/admin/categories/delete/${ category.categoryId }"
                                   class="btn btn-outline-danger">
                                    <i class="fa fa-trash"></i> Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
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