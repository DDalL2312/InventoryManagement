<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html lang="en">

    <jsp:include page="layout/head.jsp"/>
    <body>
        <jsp:include page="layout/preloader.jsp"/>

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="layout/sidebar.jsp"/>
            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <jsp:include page="layout/menu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-xl-9 col-lg-6 col-md-4">
                                <h5 class="mb-0">Product</h5>
                            </div><!--end col-->

                            <div class="col-xl-3 col-lg-6 col-md-8 mt-4 mt-md-0">
                                <div class="justify-content-md-end">
                                    <form>
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-sm-12 col-md-5">
                                                <div class="mb-0 position-relative">
                                                    <select onchange="filter(this.value)" class="form-control time-during select2input">
                                                        <option value="all">All</option>
                                                        <c:forEach items="${CategoryData}" var="c">
                                                            <option <c:if test="${filter == c.id}"> selected </c:if> value="${c.id}">${c.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-sm-12 col-md-7 mt-4 mt-sm-0">
                                                <div class="d-grid">
                                                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#appointmentform">Add product</a>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </form><!--end form-->
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" >#</th>
                                                <th class="border-bottom p-3" >Category</th>
                                                <th class="border-bottom p-3" >Name</th>
                                                <th class="border-bottom p-3">Price</th>
                                                <th class="border-bottom p-3">Raw Price</th>
                                                <th class="border-bottom p-3">Quantity</th>
                                                <th class="border-bottom p-3">Receipts</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ProductData}" var="p">
                                                <tr>
                                                    <th class="p-3">${p.id}</th>
                                                    <td class="p-3">${p.category.name}</td>
                                                    <td class="p-3">
                                                        <a href="#" class="text-dark">
                                                            <div class="d-flex align-items-center">
                                                                <img src="assets/${p.img}" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                <span class="ms-2">${p.name}</span>
                                                            </div>
                                                        </a>
                                                    </td>

                                                    <td class="p-3">${p.price}</td>
                                                    <td class="p-3">${p.rawPrice}</td>
                                                    <td class="p-3">${p.quantity}</td>
                                                    <td class="p-3">${p.receipt}</td>
                                                    <td class="text-end p-3">
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#acceptappointment"><i class="uil uil-check-circle"></i></a>
                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#cancelappointment"><i class="uil uil-times-circle"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:set var="page" value="${page}"/>
                                <div class="row text-center">
                                    <div class="col-12 mt-4">
                                        <div class="d-md-flex align-items-center text-center justify-content-between">
                                            <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                    <li class="page-item ${i==page?"active":""}"><a class="page-link" href="product?action=all&page=${i}">${i}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!--end row-->
                    </div>
                </div>

                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Tien Dat</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
        </div>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>
        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>
        <script src="assets/js/jquery.timepicker.min.js"></script> 
        <script src="assets/js/timepicker.init.js"></script> 
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script>
                                                function filter(type) {
                                                    window.location.href = "product?action=filter&id=" + type;
                                                }
        </script>
    </body>

</html>
