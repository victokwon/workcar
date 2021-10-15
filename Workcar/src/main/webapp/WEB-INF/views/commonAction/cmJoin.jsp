<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources\css\commonAction\cmemjoin.css" >
 <link rel="stylesheet" type="text/css" href="resources\css\commonAction\csch.css" >
 
<script type="text/javascript"
	src="resources\script\jquery\jquery-1.12.4.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="resources\script\commonAction\cmJoin.js"></script>
<script type="text/javascript" src="resources\script\commonAction\csch.js"></script> 
</head>
<body>
 <div class="pop-container">
        <div class="pop-out-container">
            <div class="pop-in-container">
                <div class="pop-text-header">
                    <h1>기업검색</h1>
                </div>

                <form class="pop-user" id="companyNm">
                    <div class="pop-input">
                        <input type="button" id="schBtn" value="검색">
                        <input type="text" placeholder="기업명">
                    </div>
                </form>

                <form action="#" id="companyDtl">
                    <!-- 여기서 form으로 데이터를 1차적으로 넣는다? -->
                    <input type="hidden" name="crno" id="crno" value=""> <!-- 법인등록번호 crno -->
                </form>

                <!-- 5개 리스트 -->
                <div class="company_wrap">
                    <table>
                        <thead>
                            <tr crno="1">
                                <th>기업명</th>
                                <th>법인번호</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- ㅇ -->
                            <tr>
                                <td>기업</td>
                                <td>번호</td>
                            </tr>
                            <!-- ㅇ -->
                        </tbody>
                    </table>
                </div>
                <div class="paging_wrap"></div>
                <hr>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="out-container">
            <div class="in-container">
                <div class="text-header">
                    <h1>회원가입</h1>
                </div>
                <form id="regiForm" class="user" method="get">
                    <input type="hidden" name="type" id="type">
                    <div class="input-member">
                        <input type="checkbox" name="iM" id="iM" readonly>
                        <label for="iM" id="iML">기업회원 세부입력</label>
                        <!-- <input type="checkbox" name="cM" id="cM"><label for="cM" id="cML">기업</label> -->
                    </div>
                    <div class="input">
                        <input type="button" id="cSch" value="기업검색">
                    </div>
                    <div class="dtl">
                        <div class="input">
                            <input type="text" placeholder="기업명" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="법인등록번호" readonly>
                        </div>

                        <div class="input">
                            <input type="text" placeholder="상장여부" readonly>
                        </div>
                        <div class="input">
                            <input type="text" placeholder="근로자수" readonly>
                        </div>
                    </div>
                    <div class="input">
                        <input type="text" placeholder="직책">
                    </div>
                    <div class="input">
                        <input type="button" onclick="execDaumPostcode()" value="주소검색" id="locationSchBtn">
                    </div>
                    <div class="dtl">
                        <div class="input">
                            <input type="text" name="postcode" id="postcode" placeholder="우편번호" value="" readonly>
                        </div>
                        <div class="input">
                            <input type="text" name="address" id="address" placeholder="주소" value="" readonly>
                        </div>
                    </div>
                    <div class="input">
                        <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="" readonly>
                    </div>
                    <input type="hidden" id="extraAddress">
                    
                    <!-- 회원가입 넘기기 -->
                    
                    <a href="#" id="regi">
                        회원가입
                    </a>
                </form>
                <hr>
            </div>
        </div>
    </div>
</body>
</html>