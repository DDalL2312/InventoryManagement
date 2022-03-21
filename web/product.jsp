<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html lang="en">

    <jsp:include page="layout/head.jsp"/>
    <body>
        <style>
            .Choicefile{
                display: block;
                background: #396CF0;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }
        </style>
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
                                                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addnew">Add product</a>
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

                <div class="modal fade" id="addnew" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-bottom p-3">
                                <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body p-3 pt-4">
                                <form action="product?action=add" method="POST">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <div>
                                                    <p class="text-muted">Product picture.</p>
                                                    <div id="myfileupload">
                                                        <input type="file" name="image" id="uploadfile" name="ImageUpload" onchange="readURL(this);" />
                                                    </div>
                                                    <div id="thumbbox">
                                                        <img class="rounded" height="20%" width="30%" alt="Thumb image" id="thumbimage" style="display: none" />
                                                        <a class="removeimg" href="javascript:"></a>
                                                    </div>
                                                    <div id="boxchoice">
                                                        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                                        <p style="clear:both"></p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-8 col-md-8">
                                            <div class="mb-3">
                                                <label class="form-label">Product Name <span class="text-danger">*</span></label>
                                                <input name="name" id="name" type="text" class="form-control">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-4 col-md-4">
                                            <div class="mb-3">
                                                <label class="form-label">Category</label>
                                                <select name="category" class="form-control select2input">
                                                    <c:forEach items="${CategoryData}" var="c">
                                                        <option <c:if test="${filter == c.id}"> selected </c:if> value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-6 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Price <span class="text-danger">*</span></label>
                                                <input name="price" type="number" class="form-control">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-lg-6 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Raw Price <span class="text-danger">*</span></label>
                                                <input name="rawprice" type="number" class="form-control">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-lg-6 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Quantity <span class="text-danger">*</span></label>
                                                <input name="quantity" type="number" class="form-control">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-lg-6 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Receipts <span class="text-danger">*</span></label>
                                                <input name="receipt" type="text" class="form-control" </input>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-12">
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-primary">Add</button>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </form>
                            </div>
                        </div>
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
        <script>
            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $(".Choicefile").hide();
                $(".removeimg").show();
            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").show();
                    $(".filename").text("");
                });
            })
        </script>
    </body>

</html>
