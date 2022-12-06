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
    <title>Add or Edit</title>
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
            </div>
        </div>
    </div>
</nav>
<div class="col-6 offset-3 mt-4">
    <form action="<c:url value="/admin/categories/saveOrUpdate" />" method="POST">
        <div class="card">
            <div class="card-header">
                <h2>${ category.isEdit ? 'Edit Category' : 'Add New Category' }</h2>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="categoryId" class="form-label">Category ID:</label>
                    <input type="hidden" value="${category.isEdit}">
                    <input type="text" readonly="readonly" class="form-control" value="${ category.categoryId }"
                           id="categoryId" name="categoryId" aria-describedby="categoryId" placeholder="Category ID">
                </div>
                <div class="mb-3">
                    <label for="categoryCode" class="form-label">Category Code:</label>
                    <input type="hidden" value="${category.isEdit}">
                    <input type="text" class="form-control" value="${ category.categoryCode }"
                           id="categoryCode" name="categoryCode" aria-describedby="categoryCode"
                           placeholder="Category Code">
                </div>
                <div class="mb-3">
                    <label for="categoryName" class="form-label">Category Name:</label>
                    <input type="hidden" value="${category.isEdit}">
                    <input type="text" class="form-control" value="${ category.categoryName }"
                           id="categoryName" name="categoryName" aria-describedby="categoryName"
                           placeholder="Category Name">
                </div>
                <div class="mb-3">
                    <label for="status">Status</label>
                    <select class="form-select" name="status" id="status">
                        <option ${ category.status == false ? 'selected' : ''} value="false">Không hoạt động</option>
                        <option ${ category.status == true ? 'selected' : ''} value="true">Hoạt động</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="card-footer text-muted">
            <a href="<c:url value="/admin/categories/add"/>" class="btn btn-danger"><i class="fa-solid fa-arrows-rotate"></i> New</a>
            <a href="<c:url value="/admin/categories"/>" class="btn btn-warning"><i class="fas fa-bars"></i> List
                Category</a>
            <button class="btn btn-primary" type="submit"><i class="fas fa-save"></i>
                <c:if test="${ category.isEdit }">
                    <span>Update</span>
                </c:if>
                <c:if test="${ !category.isEdit }">
                    <span>Save</span>
                </c:if>
            </button>
        </div>
    </form>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>