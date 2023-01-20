<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회의실 예약 - 예약 목록 </title>
    <style>
        table {
            align-content: center;
            text-align: center;
        }
        th, td {
            color: black;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }
    </style>
</head>

<body>

    <!--**********************************
        Main wrapper start
    ***********************************-->
    
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>회의실 예약 목록</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">회의실 예약</li>
                            <li class="breadcrumb-item active"><a href="mrlist.mr">예약 목록</a></li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                            
                                <!-- 탭 영역 시작 -->
                                <ul class="nav nav-pills mb-4">
                                    <li class=" nav-item">
                                        <a href="#navpills-1" class="nav-link active" data-toggle="tab" aria-expanded="false">전체 예약 목록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#navpills-2" class="nav-link" data-toggle="tab" aria-expanded="false">내 예약 목록</a>
                                    </li>
                                </ul>
                                <!-- 탭 영역 끝 -->
                                
                                <!-- 탭 컨텐츠 영역 시작 -->
                                <div class="tab-content">
                                
                                    <!-- 1st 탭 컨텐츠 시작 -->
                                    <div id="navpills-1" class="tab-pane active">
                                        <div class="table-responsive">
                                            <table class="table table-responsive-sm" id="tb1"">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            <!-- 1st 탭 검색 시작 -->
                                                            <form action="mrsearch.mr">
                                                                <div class="row justify-content-end">
                                                                    <div class="col-px-0">
                                                                        <select class="form-control form-control-sm" id="searchCondition1" name="searchCondition" required>
                                                                            <option value="r_no" <c:if test="${searchCondition == 'r_no'}">selected</c:if>>예약번호</option>
                                                                            <option value="r_date" <c:if test="${searchCondition == 'r_date'}">selected</c:if>>예약날짜</option>
                                                                            <option value="r_status" <c:if test="${searchCondition == 'r_status'}">selected</c:if>>예약상태</option>
                                                                            <option value="r_meetName" <c:if test="${searchCondition == 'r_meetName'}">selected</c:if>>회의실 명</option>
                                                                            <option value="r_mName" <c:if test="${searchCondition == 'r_mName'}">selected</c:if>>예약자</option>
                                                                            <option value="r_content" <c:if test="${searchCondition == 'r_content'}">selected</c:if>>예약내용</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control form-control-sm" id="searchKeyword1" name="searchKeyword" value="<c:if test="${searchKeyword != ''}">${searchKeyword}</c:if>">
                                                                            <div class="input-group-prepend">
                                                                                <button class="btn btn-primary btn-xs">검색</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- 검색 창 placeholder 표시 -->
                                                                    <script>
                                                                        $('#searchCondition1').on('click change', function() {
                                                                            if($('#searchCondition1').val() == 'r_no')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '1'");
                                                                            else if($('#searchCondition1').val() == 'r_date')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '2022-01-26'");
                                                                            else if($('#searchCondition1').val() == 'r_status')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '예약 완료'");
                                                                            else if($('#searchCondition1').val() == 'r_meetName')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '회의실'");
                                                                            else if($('#searchCondition1').val() == 'r_mName')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '홍길동'");
                                                                            else if($('#searchCondition1').val() == 'r_content')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '회의'");
                                                                        });
                                                                        $('#searchKeyword1').on('click change', function() {
                                                                            if($('#searchCondition1').val() == 'r_no')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '1'");
                                                                            else if($('#searchCondition1').val() == 'r_date')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '2022-01-26'");
                                                                            else if($('#searchCondition1').val() == 'r_status')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '예약 완료'");
                                                                            else if($('#searchCondition1').val() == 'r_meetName')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '회의실'");
                                                                            else if($('#searchCondition1').val() == 'r_mName')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '홍길동'");
                                                                            else if($('#searchCondition1').val() == 'r_content')
                                                                                $('#searchKeyword1').prop('placeholder', "예시:  '회의'");
                                                                            
                                                                            $('#searchKeyword1').css({'background':'lavender'});
                                                                        }).focusout(function() {
                                                                            $('#searchKeyword1').css({'background':'white'});
                                                                        });
                                                                    </script>
                                                                </div>
                                                            </form>
                                                            <!-- 1st 탭 검색 끝 -->
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col" width="50px">예약번호</th>
                                                        <th scope="col" width="200px">예약날짜</th>
                                                        <th scope="col" width="100px">예약상태</th>
                                                        <th scope="col" width="120px">회의실 명</th>
                                                        <th scope="col" width="100px">예약자</th>
                                                        <th scope="col" width="430px" style="overflow: hidden;">예약목적</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${ !empty loginUser }">
                                                        <c:if test="${ pi1.listCount == 0 || searchPi1.listCount == 0 }">
                                                            <tr>
                                                                <td colspan="6" class="nothing">예약 내역이 존재하지 않습니다.</td>
                                                            </tr>
                                                        </c:if>
                                                        <!-- 1st 탭 목록 조회 : 검색 X (전체 목록 조회) -->
                                                        <c:if test="${ pi1.listCount > 0 }">
                                                            <c:url var="mrdetail1" value="mrdetail.mr">
                                                                <c:param name="rNo" value="${ mr1.rev_no }"/>
                                                                <c:param name="page1" value="${ pi1.currentPage }"/>
                                                            </c:url>
                                                            <a href="${ mrdetail1 }">${ mr1.rev_time }</a>
                                                            <c:forEach var="mr1" items="${ list1 }">
                                                                <tr>
                                                                    <td>${ mr1.rev_no }</td>
                                                                    <td>${ mr1.rev_time }</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${ mr1.rev_status eq 0 }">
                                                                                <span class="badge badge-success">예약 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ mr1.rev_status eq 1 }">
                                                                                <span class="badge badge-secondary">사용 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ mr1.rev_status eq 2 }">
                                                                                <span class="badge badge-warning">예약 취소</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${ mr1.meet_name }</td>
                                                                    <td>${ mr1.mName }</td>
                                                                    <td>${ mr1.rev_content }</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                        <!-- 1st 탭 목록 조회 : 검색 O (검색 키워드 기준 목록 조회) -->
                                                        <c:if test="${ searchPi1.listCount > 0 }">
                                                            <c:url var="mrdetail2" value="mrdetail.mr">
                                                                <c:param name="rNo" value="${ searchMr1.rev_no }"/>
                                                                <c:param name="page1" value="${ searchPi1.currentPage }"/>
                                                            </c:url>
                                                            <a href="${ mrdetail2 }">${ searchMr1.rev_time }</a>
                                                            <c:forEach var="searchMr1" items="${ searchList1 }">
                                                                <tr>
                                                                    <td>${ searchMr1.rev_no }</td>
                                                                    <td>${ searchMr1.rev_time }</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${ searchMr1.rev_status eq 0 }">
                                                                                <span class="badge badge-success">예약 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ searchMr1.rev_status eq 1 }">
                                                                                <span class="badge badge-secondary">사용 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ searchMr1.rev_status eq 2 }">
                                                                                <span class="badge badge-warning">예약 취소</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${ searchMr1.meet_name }</td>
                                                                    <td>${ searchMr1.mName }</td>
                                                                    <td>${ searchMr1.rev_content }</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:if>
                                                </tbody>
                                                
                                                <!-- 1st 탭 컨텐츠 페이징 시작 -->
                                                <tfoot>
                                                    <tr>
                                                        <td colspan="6">
                                                            <div class="d-flex justify-content-center">
                                                                <nav>
                                                                    <ul class="pagination pagination-sm pagination-gutter">
                                                                    <!-- 검색하지 않았을 때 -->
                                                                    <c:if test="${ pi1.currentPage > 0 }">
                                                                        <!-- 이전 -->
                                                                        <c:if test="${ pi1.currentPage <= 1 }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-left"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ pi1.currentPage > 1 }">
                                                                            <c:url var="before1" value="/Meet/list.kosmo">
                                                                                <c:param name="page1" value="${ pi1.currentPage - 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ before1 }">
                                                                                    <i class="icon-arrow-left"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                        
                                                                        <!-- 숫자 -->
                                                                        <c:forEach var="p1" begin="${ pi1.startPage }" end="${ pi1.endPage }">
                                                                            <c:if test="${ p1 eq pi1.currentPage }">
                                                                                <li class="page-item active">
                                                                                    <a class="page-link">${ p1 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                            <c:if test="${ p1 ne pi1.currentPage }">
                                                                                <c:url var="pagination1" value="/Meet/list.kosmo">
                                                                                    <c:param name="page1" value="${ p1 }"/>
                                                                                </c:url>
                                                                                <li class="page-item">
                                                                                    <a class="page-link" href="${ pagination1 }">${ p1 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        
                                                                        <!--  다음 -->
                                                                        <c:if test="${ pi1.currentPage >= pi1.maxPage }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-right"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ pi1.currentPage < pi1.maxPage }">
                                                                            <c:url var="after1" value="/Meet/list.kosmo">
                                                                                <c:param name="page1" value="${ pi1.currentPage + 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ after1 }">
                                                                                    <i class="icon-arrow-right"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                    </c:if>
                                                                    
                                                                    <!-- 검색 했을 때 -->
                                                                    <c:if test="${ searchPi1.currentPage > 0 }">
                                                                        <!-- 이전 -->
                                                                        <c:if test="${ searchPi1.currentPage <= 1 }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-left"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ searchPi1.currentPage > 1 }">
                                                                            <c:url var="before1" value="mrsearch.mr">
                                                                                <!-- 페이지 이동 시 검색 조건/키워드 넘겨주기 -->
                                                                                <c:if test="${ searchCondition ne null and searchKeyword ne null }">
                                                                                    <c:param name="searchCondition" value="${ searchCondition }"/>
                                                                                    <c:param name="searchKeyword" value="${ searchKeyword }"/>
                                                                                </c:if>
                                                                                <c:param name="page1" value="${ searchPi1.currentPage - 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ before1 }">
                                                                                    <i class="icon-arrow-left"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                        
                                                                        <!-- 숫자 -->
                                                                        <c:forEach var="p1" begin="${ searchPi1.startPage }" end="${ searchPi1.endPage }">
                                                                            <c:if test="${ p1 eq searchPi1.currentPage }">
                                                                                <li class="page-item active">
                                                                                    <a class="page-link">${ p1 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                            <c:if test="${ p1 ne searchPi1.currentPage }">
                                                                                <c:url var="pagination1" value="mrsearch.mr">
                                                                                    <!-- 페이지 이동 시 검색 조건/키워드 넘겨주기 -->
                                                                                    <c:if test="${ searchCondition ne null and searchKeyword ne null }">
                                                                                        <c:param name="searchCondition" value="${ searchCondition }"/>
                                                                                        <c:param name="searchKeyword" value="${ searchKeyword }"/>
                                                                                    </c:if>
                                                                                    <c:param name="page1" value="${ p1 }"/>
                                                                                </c:url>
                                                                                <li class="page-item">
                                                                                    <a class="page-link" href="${ pagination1 }">${ p1 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        
                                                                        <!-- 다음 -->
                                                                        <c:if test="${ searchPi1.currentPage >= searchPi1.maxPage }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-right"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ searchPi1.currentPage < searchPi1.maxPage }">
                                                                            <c:url var="after1" value="mrsearch.mr">
                                                                                <!-- 페이지 이동 시 검색 조건/키워드 넘겨주기 -->
                                                                                <c:if test="${ searchCondition ne null and searchKeyword ne null }">
                                                                                    <c:param name="searchCondition" value="${ searchCondition }"/>
                                                                                    <c:param name="searchKeyword" value="${ searchKeyword }"/>
                                                                                </c:if>
                                                                                <c:param name="page1" value="${ searchPi1.currentPage + 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ after1 }">
                                                                                    <i class="icon-arrow-right"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                    </c:if>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                                <!-- 1st 탭 컨텐츠 페이징 끝 -->
                                                
                                            </table>
                                        </div>
                                    </div>
                                    <!-- 1st 탭 컨텐츠 끝 -->
                                    
                                    
                                    <!-- 2nd 탭 컨텐츠 시작 -->
                                    <div id="navpills-2" class="tab-pane">
                                        <div class="table-responsive">
                                            <table class="table table-responsive-sm" id="tb2">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            <!-- 2st 탭 검색 시작 -->
                                                            <form action="mrsearch.mr">
                                                                <div class="row justify-content-end">
                                                                    <div class="col-px-0">
                                                                        <select class="form-control form-control-sm" id="searchCondition2" name="searchCondition" required>
                                                                            <option value="r_no" <c:if test="${searchCondition == 'r_no'}">selected</c:if>>예약번호</option>
                                                                            <option value="r_date" <c:if test="${searchCondition == 'r_date'}">selected</c:if>>예약날짜</option>
                                                                            <option value="r_status" <c:if test="${searchCondition == 'r_status'}">selected</c:if>>예약상태</option>
                                                                            <option value="r_meetName" <c:if test="${searchCondition == 'r_meetName'}">selected</c:if>>회의실 명</option>
                                                                            <option value="r_mName" <c:if test="${searchCondition == 'r_mName'}">selected</c:if>>예약자</option>
                                                                            <option value="r_content" <c:if test="${searchCondition == 'r_content'}">selected</c:if>>예약내용</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control form-control-sm" id="searchKeyword2" name="searchKeyword" value="<c:if test="${searchKeyword != ''}">${searchKeyword}</c:if>">
                                                                            <div class="input-group-prepend">
                                                                                <button class="btn btn-primary btn-xs">검색</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- 검색 창 placeholder 표시 -->
                                                                    <script>
                                                                        $('#searchCondition2').on('click change', function() {
                                                                            if($('#searchCondition2').val() == 'r_no')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '1'");
                                                                            else if($('#searchCondition2').val() == 'r_date')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '2022-01-26'");
                                                                            else if($('#searchCondition2').val() == 'r_status')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '예약 완료'");
                                                                            else if($('#searchCondition2').val() == 'r_meetName')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '회의실'");
                                                                            else if($('#searchCondition2').val() == 'r_mName')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '홍길동'");
                                                                            else if($('#searchCondition2').val() == 'r_content')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '회의'");
                                                                        });
                                                                        $('#searchKeyword2').on('click change', function() {
                                                                            if($('#searchCondition2').val() == 'r_no')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '1'");
                                                                            else if($('#searchCondition2').val() == 'r_date')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '2022-01-26'");
                                                                            else if($('#searchCondition2').val() == 'r_status')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '예약 완료'");
                                                                            else if($('#searchCondition2').val() == 'r_meetName')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '회의실'");
                                                                            else if($('#searchCondition2').val() == 'r_mName')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '홍길동'");
                                                                            else if($('#searchCondition2').val() == 'r_content')
                                                                                $('#searchKeyword2').prop('placeholder', "예시:  '회의'");
                                                                            
                                                                            $('#searchKeyword2').css({'background':'lavender'});
                                                                        }).focusout(function() {
                                                                            $('#searchKeyword2').css({'background':'white'});
                                                                        });
                                                                    </script>
                                                                </div>
                                                            </form>
                                                            <!-- 2st 탭 검색 끝 -->
                                                        </th>
                                                    </tr>
                                                    <tr>
                                                        <th scope="col" width="50px">예약번호</th>
                                                        <th scope="col" width="200px">예약날짜</th>
                                                        <th scope="col" width="100px">예약상태</th>
                                                        <th scope="col" width="120px">회의실 명</th>
                                                        <th scope="col" width="470px">예약목적</th>
                                                        <th scope="col" width="30px"><input type="checkbox" id="chkAll"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${ !empty loginUser }">
                                                        <c:if test="${ pi2.listCount == 0 || searchPi2.listCount == 0 }">
                                                            <tr>
                                                                <td colspan="6" class="nothing">예약 내역이 존재하지 않습니다.</td>
                                                            </tr>
                                                        </c:if>
                                                        <!-- 2nd 탭 목록 조회 : 검색 X (전체 목록 조회) -->
                                                        <c:if test="${ pi2.listCount > 0 }">
                                                            <c:url var="mrupdate1" value="mrupdateview.mr">
                                                                <c:param name="rNo" value="${ mr2.rev_no }"/>
                                                                <c:param name="page2" value="${ pi2.currentPage }"/>
                                                            </c:url>
                                                            <a href="${ mrupdate1 }">${ mr2.rev_time }</a>
                                                            <c:forEach var="mr2" items="${ list2 }">
                                                                <tr>
                                                                    <td>${ mr2.rev_no }</td>
                                                                    <td>${ mr2.rev_time }</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${ mr2.rev_status eq 0 }">
                                                                                <span class="badge badge-success">예약 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ mr2.rev_status eq 1 }">
                                                                                <span class="badge badge-secondary">사용 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ mr2.rev_status eq 2 }">
                                                                                <span class="badge badge-warning">예약 취소</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${ mr2.meet_name }</td>
                                                                    <td>${ mr2.rev_content }</td>
                                                                    <td><input type="checkbox" class="chk" name="rev_no" value="${ mr2.rev_no }"></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                        <!-- 2nd 탭 목록 조회 : 검색 O (검색 키워드 기준 목록 조회) -->
                                                        <c:if test="${ searchPi2.listCount > 0 }">
                                                            <c:url var="mrupdate2" value="mrupdateview.mr">
                                                                <c:param name="rNo" value="${ searchMr2.rev_no }"/>
                                                                <c:param name="page2" value="${ searchPi2.currentPage }"/>
                                                            </c:url>
                                                            <a href="${ mrupdate2 }">${ searchMr2.rev_time }</a>
                                                            <c:forEach var="searchMr2" items="${ searchList2 }">
                                                                <tr>
                                                                    <td>${ searchMr2.rev_no }</td>
                                                                    <td>${ searchMr2.rev_time }</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${ searchMr2.rev_status eq 0 }">
                                                                                <span class="badge badge-success">예약 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ searchMr2.rev_status eq 1 }">
                                                                                <span class="badge badge-secondary">사용 완료</span>
                                                                            </c:when>
                                                                            <c:when test="${ searchMr2.rev_status eq 2 }">
                                                                                <span class="badge badge-warning">예약 취소</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${ searchMr2.meet_name }</td>
                                                                    <td>${ searchMr2.rev_content }</td>
                                                                    <td><input type="checkbox" class="chk" name="rev_no" value="${ searchMr2.rev_no }"></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:if>
                                                </tbody>
                                                
                                                <!-- 2st 탭 컨텐츠 페이징 시작 -->
                                                <tfoot>
                                                    <tr>
                                                        <td colspan="6">
                                                            <div class="d-flex justify-content-center">
                                                                <nav>
                                                                    <ul class="pagination pagination-sm pagination-gutter">
                                                                    <!-- 검색하지 않았을 때 -->
                                                                    <c:if test="${ pi1.currentPage > 0 }">
                                                                        <!-- 이전 -->
                                                                        <c:if test="${ pi2.currentPage <= 1 }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-left"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ pi2.currentPage > 1 }">
                                                                            <c:url var="before2" value="/Meet/list.kosmo">
                                                                                <c:param name="page2" value="${ pi2.currentPage - 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ before2 }">
                                                                                    <i class="icon-arrow-left"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                        
                                                                        <!-- 숫자 -->
                                                                        <c:forEach var="p2" begin="${ pi2.startPage }" end="${ pi2.endPage }">
                                                                            <c:if test="${ p2 eq pi2.currentPage }">
                                                                                <li class="page-item active">
                                                                                    <a class="page-link">${ p2 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                            <c:if test="${ p2 ne pi2.currentPage }">
                                                                                <c:url var="pagination2" value="/Meet/list.kosmo">
                                                                                    <c:param name="page2" value="${ p2 }"/>
                                                                                </c:url>
                                                                                <li class="page-item">
                                                                                    <a class="page-link" href="${ pagination2 }">${ p2 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        
                                                                        <!--  다음 -->
                                                                        <c:if test="${ pi2.currentPage >= pi2.maxPage }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-right"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ pi2.currentPage < pi2.maxPage }">
                                                                            <c:url var="after2" value="/Meet/list.kosmo">
                                                                                <c:param name="page2" value="${ pi2.currentPage + 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ after2 }">
                                                                                    <i class="icon-arrow-right"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                    </c:if>
                                                                    
                                                                    <!-- 검색 했을 때 -->
                                                                    <c:if test="${ searchPi2.currentPage > 0 }">
                                                                        <!-- 이전 -->
                                                                        <c:if test="${ searchPi2.currentPage <= 1 }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-left"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ searchPi2.currentPage > 1 }">
                                                                            <c:url var="before2" value="mrsearch.mr">
                                                                                <!-- 페이지 이동 시 검색 조건/키워드 넘겨주기 -->
                                                                                <c:if test="${ searchCondition ne null and searchKeyword ne null }">
                                                                                    <c:param name="searchCondition" value="${ searchCondition }"/>
                                                                                    <c:param name="searchKeyword" value="${ searchKeyword }"/>
                                                                                </c:if>
                                                                                <c:param name="page2" value="${ searchPi2.currentPage - 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ before2 }">
                                                                                    <i class="icon-arrow-left"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                        
                                                                        <!-- 숫자 -->
                                                                        <c:forEach var="p2" begin="${ searchPi2.startPage }" end="${ searchPi2.endPage }">
                                                                            <c:if test="${ p2 eq searchPi2.currentPage }">
                                                                                <li class="page-item active">
                                                                                    <a class="page-link">${ p2 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                            <c:if test="${ p2 ne searchPi2.currentPage }">
                                                                                <c:url var="pagination2" value="mrsearch.mr">
                                                                                    <!-- 페이지 이동 시 검색 조건/키워드 넘겨주기 -->
                                                                                    <c:if test="${ searchCondition ne null and searchKeyword ne null }">
                                                                                        <c:param name="searchCondition" value="${ searchCondition }"/>
                                                                                        <c:param name="searchKeyword" value="${ searchKeyword }"/>
                                                                                    </c:if>
                                                                                    <c:param name="page2" value="${ p2 }"/>
                                                                                </c:url>
                                                                                <li class="page-item">
                                                                                    <a class="page-link" href="${ pagination2 }">${ p2 }</a>
                                                                                </li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        
                                                                        <!-- 다음 -->
                                                                        <c:if test="${ searchPi2.currentPage >= searchPi2.maxPage }">
                                                                            <li class="page-item page-indicator disabled">
                                                                                <a class="page-link"><i class="icon-arrow-right"></i></a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${ searchPi2.currentPage < searchPi2.maxPage }">
                                                                            <c:url var="after2" value="mrsearch.mr">
                                                                                <!-- 페이지 이동 시 검색 조건/키워드 넘겨주기 -->
                                                                                <c:if test="${ searchCondition ne null and searchKeyword ne null }">
                                                                                    <c:param name="searchCondition" value="${ searchCondition }"/>
                                                                                    <c:param name="searchKeyword" value="${ searchKeyword }"/>
                                                                                </c:if>
                                                                                <c:param name="page2" value="${ searchPi2.currentPage + 1 }"/>
                                                                            </c:url>
                                                                            <li class="page-item page-indicator">
                                                                                <a class="page-link" href="${ after2 }">
                                                                                    <i class="icon-arrow-right"></i>
                                                                                </a>
                                                                            </li>
                                                                        </c:if>
                                                                    </c:if>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <!-- 2st 탭 컨텐츠 페이징 끝 -->
                                                    <!-- 예약 관련 버튼 시작 -->
                                                    <tr>
                                                        <td colspan="6">
                                                            <c:if test="${ !empty loginUser }">
                                                            <div class="d-flex justify-content-end">
                                                                <button type="button" class="btn btn-primary btn-sm mr-2" onclick="location.href='/Meet/insertview.kosmo'">예약 신청</button>
                                                                <c:if test="${ !list2.isEmpty() and !searchList2.isEmpty() }">
                                                                    <button type="button" class="btn btn-primary btn-sm mr-2" id="mredit">예약 수정</button>
                                                                    <button type="button" class="btn btn-primary btn-sm mr-2" id="mrcomplete">사용 완료</button>
                                                                    <button type="button" class="btn btn-primary btn-sm" id="mrcancel">예약 취소</button>
                                                                </c:if>
                                                            </div>
                                                            </c:if>
                                                            <!-- 검색하지 않았을 때 버튼 기능 -->
                                                            <c:if test="${ pi1.listCount >= 0 and pi2.listCount >= 0 }">
                                                            <script>
                                                                $('#mredit').click(function() {
                                                                    var rNo = -1;
                                                                    var chkCount = $('.chk:checked').length > 1 ? -1 : 1;
                                                                    
                                                                    if(chkCount == 1 && $('.chk:checked').parent().parent().children().eq(2).children().text() == '예약 완료') {
                                                                        rNo = $('.chk:checked').val();
                                                                        
                                                                        location.href="mrupdateview.mr?rNo=" + rNo + "&page2=" + ${ pi2.currentPage } + "&cal=0";
                                                                    } else {
                                                                        Swal.fire({
                                                                            title: '예약 상태 수정 불가',
                                                                            html: '<b>수정 가능한 1개의 예약만 선택해주세요.</b><br><small>※ "예약 완료" 상태만 수정이 가능합니다.</small>',
                                                                            icon: 'warning',
                                                                            showConfirmButton: true,
                                                                            confirmButtonText: '예',
                                                                        });
                                                                    }
                                                                });
                                                            </script>
                                                            </c:if>
                                                            <!-- 검색했을 때 버튼 기능 -->
                                                            <c:if test="${ searchPi1.listCount >= 0 and searchPi2.listCount >= 0 }">
                                                            <script>
                                                                $('#mredit').click(function() {
                                                                    var rNo = -1;
                                                                    var chkCount = $('.chk:checked').length > 1 ? -1 : 1;
                                                                    
                                                                    if(chkCount == 1 && $('.chk:checked').parent().parent().children().eq(2).children().text() == '예약 완료') {
                                                                        rNo = $('.chk:checked').val();
                                                                        
                                                                        location.href="mrupdateview.mr?rNo=" + rNo + "&page2=" + ${ searchPi2.currentPage } + "&cal=0";
                                                                    } else {
                                                                        Swal.fire({
                                                                            title: '예약 상태 수정 불가',
                                                                            html: '<b>수정 가능한 1개의 예약만 선택해주세요.</b><br><small>※ "예약 완료" 상태만 수정이 가능합니다.</small>',
                                                                            icon: 'warning',
                                                                            showConfirmButton: true,
                                                                            confirmButtonText: '예',
                                                                        });
                                                                    }
                                                                });
                                                            </script>
                                                            </c:if>
                                                            <!-- 공통 버튼 기능 -->
                                                            <script>
                                                                $('#mrcomplete').click(function() {
                                                                    var rNo = -1;
                                                                    var chkCount = $('.chk:checked').length > 0 ? $('.chk:checked').length : -1;
                                                                    var comFlag = true;
                                                                    var dateFlag = true;
                                                                    var timeFlag = true;
                                                                    
                                                                    function getToday() {
                                                                        var date = new Date();
                                                                        return date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
                                                                    }
                                                                    
                                                                    function getTime() {
                                                                        var date = new Date();
                                                                        return ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2);
                                                                    }
                                                                    
                                                                    var today = getToday();
                                                                    var now = getTime();
                                                                    
                                                                    var chkArray = new Array();
                                                                    
                                                                    $('.chk:checked').each(function() {
                                                                        if(comFlag)
                                                                            comFlag = true;
                                                                        if(dateFlag)
                                                                            dateFlag = true;
                                                                        if(timeFlag)
                                                                            timeFlag = true;
                                                                        
                                                                        var inDay = $(this).parent().parent().children().eq(1).text().substr(0, 10);
                                                                        var inTime = $(this).parent().parent().children().eq(1).text().substr($(this).parent().parent().children().eq(1).text().indexOf(':') - 2, 5);
                                                                        
                                                                        chkArray.push(this.value);
                                                                        
                                                                        if($(this).parent().parent().children().eq(2).children().text() != '예약 완료')
                                                                            comFlag = false;
                                                                        if(inDay.substr(0, 10) != today)
                                                                            dateFlag = false;
                                                                        if(inTime.substr(0, 2) > now.substr(0, 2) || !(inTime.substr(0, 2) == now.substr(0, 2) && inTime.substr(4, 2) <= now.substr(4, 2)))
                                                                            timeFlag = false;
                                                                    });
                                                                    
                                                                    if(chkCount > 0 && comFlag && dateFlag) {
                                                                        Swal.fire({
                                                                            title: '사용 완료 확인',
                                                                            html: '<b>선택한 ' + chkCount + '개의 예약을 사용 완료로 변경하시겠습니까?</b><br><small>※ 예약상태 변경은 되돌릴 수 없습니다.</small>',
                                                                            icon: 'question',
                                                                            showConfirmButton: true,
                                                                            confirmButtonText: '예',
                                                                            showCancelButton: true,
                                                                            cancelButtonText: '아니오'
                                                                        }).then((result) => {
                                                                            if(result.isConfirmed) {
                                                                                $.ajax({
                                                                                    url: 'mrcompletes.mr',
                                                                                    type: 'post',
                                                                                    dataType: 'json',
                                                                                    data: {'chks':chkArray},
                                                                                    success: function(data) {
                                                                                        console.log(data);
                                                                                    },
                                                                                    error: function(data) {
                                                                                        console.log(data);
                                                                                    }
                                                                                });
                                                                                
                                                                                Swal.mixin({
                                                                                    toast: true,
                                                                                    position: 'top-end',
                                                                                    showConfirmButton: false,
                                                                                    timer: 2000,
                                                                                    timerProgressBar: true
                                                                                }).fire({
                                                                                    icon: 'success',
                                                                                    title: '성공적으로 변경되었습니다.',
                                                                                    width: '400px'
                                                                                });
                                                                                
                                                                                $(function() {
                                                                                    location.reload();
                                                                                });
                                                                            }
                                                                        });
                                                                    } else {
                                                                        Swal.fire({
                                                                            title: '예약 상태 수정 불가',
                                                                            html: '<b>수정 가능한 예약을 선택해주세요.</b><br><small>※ 예약 시간이 지나고, "예약 완료" 상태인 내역만 수정이 가능합니다.</small>',
                                                                            icon: 'warning',
                                                                            showConfirmButton: true,
                                                                            confirmButtonText: '예',
                                                                        });
                                                                    }
                                                                });
                                                                
                                                                $('#mrcancel').click(function() {
                                                                    var rNo = -1;
                                                                    var chkCount = $('.chk:checked').length > 0 ? $('.chk:checked').length : -1;
                                                                    var comFlag = true;
                                                                    
                                                                    var chkArray = new Array();
                                                                    
                                                                    $('.chk:checked').each(function() {
                                                                        if(comFlag)
                                                                            comFlag = true;
                                                                        chkArray.push(this.value);
                                                                        
                                                                        if($(this).parent().parent().children().eq(2).children().text() != '예약 완료')
                                                                            comFlag = false;
                                                                    });
                                                                    
                                                                    if(chkCount > 0 && comFlag) {
                                                                        Swal.fire({
                                                                            title: '예약 취소 확인',
                                                                            html: '<b>선택한 ' + chkCount + '개의 예약을 취소하시겠습니까?</b><br><small>※ 예약상태 변경은 되돌릴 수 없습니다.</small>',
                                                                            icon: 'question',
                                                                            showConfirmButton: true,
                                                                            confirmButtonText: '예',
                                                                            showCancelButton: true,
                                                                            cancelButtonText: '아니오'
                                                                        }).then((result) => {
                                                                            if(result.isConfirmed) {
                                                                                $.ajax({
                                                                                    url: 'mrcancels.mr',
                                                                                    type: 'post',
                                                                                    dataType: 'json',
                                                                                    data: {'chks':chkArray},
                                                                                    success: function(data) {
                                                                                        console.log(data);
                                                                                    },
                                                                                    error: function(data) {
                                                                                        console.log(data);
                                                                                    }
                                                                                });
                                                                                
                                                                                Swal.mixin({
                                                                                    toast: true,
                                                                                    position: 'top-end',
                                                                                    showConfirmButton: false,
                                                                                    timer: 2000,
                                                                                    timerProgressBar: true
                                                                                }).fire({
                                                                                    icon: 'success',
                                                                                    title: '성공적으로 취소되었습니다.',
                                                                                    width: '400px'
                                                                                });
                                                                                
                                                                                $(function() {
                                                                                    location.reload();
                                                                                });
                                                                            }
                                                                        });
                                                                    } else {
                                                                        Swal.fire({
                                                                            title: '예약 상태 수정 불가',
                                                                            html: '<b>수정 가능한 예약을 선택해주세요.</b><br><small>※ "예약 완료" 상태만 수정이 가능합니다.</small>',
                                                                            icon: 'warning',
                                                                            showConfirmButton: true,
                                                                            confirmButtonText: '예',
                                                                        });
                                                                    }
                                                                });
                                                            </script>
                                                        </td>
                                                    </tr>
                                                    <!-- 예약 관련 버튼 끝 -->
                                                </tfoot>
                                                
                                            </table>

                                        </div>
                                    </div>
                                    <!-- 2nd 탭 컨텐츠 끝 -->
                                    
                                </div>
                                <!-- 탭 컨텐츠 끝 -->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <!-- 검색하지 않은 목록 조회 시 -->
    <c:if test="${ pi1.listCount >= 0 and pi2.listCount >= 0 }">
        <script>
        // 예약정보 세부 조회 연결 기능
        $('#tb1 tbody td:not(".nothing")').mouseenter(function() {
            $(this).parent().css({'font-weight':'bold', 'cursor':'pointer', 'background':'lavender'});
        }).mouseout(function() {
            $(this).parent().css({'font-weight':'normal', 'background':'white'});
        }).click(function() {
            var rNo = $(this).parent().children().eq(0).text();
            location.href="mrdetail.mr?rNo=" + rNo + "&page1=" + ${ pi1.currentPage } + "&cal=0";
        });
        
        $('#tb2 tbody td:not(:has(input)):not(".nothing")').mouseenter(function() {
            $(this).parent().css({'font-weight':'bold', 'cursor':'pointer', 'background':'lavender'});
        }).mouseout(function() {
            $(this).parent().css({'font-weight':'normal', 'background':'white'});
        }).click(function() {
            var rNo = $(this).parent().children().eq(0).text();
            
            if($(this).parent().children().eq(2).children().text() != '예약 완료') {
                location.href="mrdetail.mr?rNo=" + rNo + "&page1=" + ${ pi1.currentPage } + "&cal=0";
            } else {
                location.href="mrupdateview.mr?rNo=" + rNo + "&page2=" + ${ pi2.currentPage } + "&cal=0";
            }
        });
        
        // 체크박스 기능
        $('#chkAll').click(function() {
            var chkAll = $(this).prop('checked');
            
            if(chkAll)
                $('.chk').prop('checked', true);
            else
                $('.chk').prop('checked', false);
        });
        
        $('.chk').click(function() {
            var chk = $('.chk');
            
            var chkAllSelect = true;
            for(var i in chk)
                if(chk[i].checked == false)
                    chkAllSelect = false;
            
            if(chkAllSelect)
                $('#chkAll').prop('checked', true);
            else
                $('#chkAll').prop('checked', false);
        });
        </script>
    </c:if>
    
    <!-- 검색한 목록 조회 시 -->
    <c:if test="${ searchPi1.listCount >= 0 and searchPi2.listCount >= 0 }">
        <script>
        // 예약정보 세부 조회 연결 기능
        $('#tb1 tbody td:not(".nothing")').mouseenter(function() {
            $(this).parent().css({'font-weight':'bold', 'cursor':'pointer', 'background':'lavender'});
        }).mouseout(function() {
            $(this).parent().css({'font-weight':'normal', 'background':'white'});
        }).click(function() {
            var rNo = $(this).parent().children().eq(0).text();
            location.href="mrdetail.mr?rNo=" + rNo + "&page1=" + ${ searchPi1.currentPage } + "&cal=0";
        });
        
        // 체크박스 활성화
        $('#tb2 tbody td:not(:has(input)):not(".nothing")').mouseenter(function() {
            $(this).parent().css({'font-weight':'bold', 'cursor':'pointer', 'background':'lavender'});
        }).mouseout(function() {
            $(this).parent().css({'font-weight':'normal', 'background':'white'});
        }).click(function() {
            var rNo = $(this).parent().children().eq(0).text();
            
            if($(this).parent().children().eq(2).children().text() != '예약 완료') {
                location.href="mrdetail.mr?rNo=" + rNo + "&page1=" + ${ searchPi1.currentPage } + "&cal=0";
            } else {
                location.href="mrupdateview.mr?rNo=" + rNo + "&page2=" + ${ searchPi2.currentPage } + "&cal=0";
            }
        });
        
        // 체크박스 기능
        $('#chkAll').click(function() {
            var chkAll = $(this).prop('checked');
            
            if(chkAll)
                $('.chk').prop('checked', true);
            else
                $('.chk').prop('checked', false);
        });
        
        $('.chk').click(function() {
            var chk = $('.chk');
            
            var chkAllSelect = true;
            for(var i in chk)
                if(chk[i].checked == false)
                    chkAllSelect = false;
            
            if(chkAllSelect)
                $('#chkAll').prop('checked', true);
            else
                $('#chkAll').prop('checked', false);
        });
        </script>
    </c:if>
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
	
	</div>
</div>
