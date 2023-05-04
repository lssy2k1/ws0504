<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let item_search = {
        init: function(){
            $('#search_btn').click(()=>{
                $('#search_form').attr({
                    method:'/get',
                    action:'/item/search'
                });
                $('#search_form').submit();
            })
        }
    }
    $(function(){
        item_search.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item All</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item All</h6>
            <%--            serach form --------------------------------------------------------%>
            <form id="search_form" class="form-inline well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price_min">Price_min:</label>
                    <div class="col-sm-10">
                        <input type="number" name="price_min" class="form-control" id="price_min" placeholder="Enter price"
                               value = "${itemSearch.price_min}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price_max">Price_max:</label>
                    <div class="col-sm-10">
                        <input type="number" name="price_max" class="form-control" id="price_max" placeholder="Enter price"
                               value = "${itemSearch.price_max}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">NAME:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Enter name"
                               value = "${itemSearch.name}">
                    </div>
                </div>
                <div class="col-sm-offset-2">
                    <button id="search_btn" type="button" class="btn btn-danger">search</button>
                </div>
            </form>
            <%--            serach form --------------------------------------------------------%>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>DATE</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>DATE</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${ilist}">
                        <tr>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#target${obj.id}">
<%--                                    modal id과 target을 일치시킴--%>
                                <img src = "/img/${obj.imgname}" style = "width : 50px; height : 50px">
                                </a>
                            </td>
                            <td><a href = "/item/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" type="number" pattern = "###,###원" /></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd:HH:mm:ss"/></td>
                        </tr>

                        <!-- Modal for문 안에 위치시켜야한다.-->
                        <div class="modal fade" id="target${obj.id}" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.name}</p>
                                        <img src = "/img/${obj.imgname}" style = "width : 300px; height : 300px">
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button">Go Detail</a>
                                        <a href = "#" class="btn btn-info" data-dismiss="modal" role="button">Close</a>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

