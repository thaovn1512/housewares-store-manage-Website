<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>
 <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">MANAGE CATEGORY</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Category</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                               <form:form action="admin/category/insert.htm" modelAttribute="category">
                               <form:input path="id" style="display:none" />
                                <div class="form-group">
                               <label>Name</label>
                               <form:input path="name" class="form-control"/>
                               </div>
                               ${message}
                                <div class="form-group">
                               <form:button class="btn btn-primary" type="submit">Save</form:button>
                             
                               </div>
                                 
                               </form:form>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                           
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="item" items="${categories}">
                                        <tr>
                                            <td>${item.id}</td>
                                             <td>${item.name}</td>
                                            <td>
                                            <a name = "btn-sua" class="btn btn-sm btn-warning" href="admin/category/edit/${item.id}.htm?btn-sua">Edit</a>
                                            <a name = "btn-xoa" class="btn btn-sm btn-danger" href="admin/category/delete/${item.id}.htm?btn-xoa">Delete</a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
    
    
    
    
    <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    