<%--
  ChangDae로 이름을 유지하는 이유는, 이미 기존에 사용자들에게 링크가 알려진 상태이기 때문입니다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ page import="dao.ChangDaeDAO"%>
<%@ page import="model.ChangDae"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <!-- 제이쿼리 자바스크립트 추가 -->
    <script src="./js/jquery.min.js"></script>
    <!--  자바스크립트 추가 -->
    <script src="./js/popper.js"></script>
    <!--  자바스크립트 추가 -->
    <script src="js/bootstrap.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width= device-width,initial-scale= 1 ,shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>창대교회 금요기도회</title>
    <style type="text/css">
        a, a:hover {
            color: #006400;
            text-decoration: none;
        }
    </style>

</head>
<body>


<%
    int pageNumber = 1;
    int pages = 1;
    ChangDaeDAO changDaeDAO = new ChangDaeDAO();
    pages = changDaeDAO.returnPages();
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<nav class="navbar navbar-inverse">
    <div class="navbar-header">
        <a class="navbar-brand" href="ChangDae.jsp"></a>
    </div>
</nav>
<!--  HEADER END -->
<div class="container col-xs-12 col-lg-12">
    <div class="jumbotron">
        <div class="container">
            <h1>
                <span style="font-size: 100px;">금요<span style="font-size: 130px; color:#9932cc  ">✟</span>기도회</span>
            </h1>
            <p style="font-size: 25px;">
                <a class="btn icon-btn btn-info" data-toggle="modal" href="#InfoModal">공지사항</a>
            </p>
        </div>


    </div>

</div>
<!-- Info Modal -->
<div class="modal fade" id="InfoModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <span class="modal-title" id="modal" style="text-align: center; font-size: 60px;"><strong>공지사항
					</strong></span>
            </div>
            <div class="modal-body">
                창대교회 금요기도회 사이트에 오신 여러분들을 모두 환영합니다! 이곳은 금요기도회에서 기도하게 될 기도제목을 쉽게, 그리고 미리 받기 위한 목적으로 만들어졌습니다. 아래에 있는 "<span class='text-primary'>글쓰기</span>" 버튼을 누르시면
                <mark>기도제목</mark>
                을 작성하실 수 있습니다. <br>
                <br>
                <p style="font-size: 28px;">
                    <span class="text-danger">꼭!!</span><span class="text-info">작성양식</span>에 맞춰주세요!!
                </p>
                <br>
                <p>
                    #<strong class="" style="font-size: 25px;">작성자</strong>는 <em><u>본인이름</u></em>으로!
                <p>
                    #<strong style="font-size: 25px;">작성내용</strong>은
                </p>
                <p>1.~~~~~~~~~~~~~~~~~~</p>
                <p>2.~~~~~~~~~~~~~~~~~~</p>
                <p>3.~~~~~~~~~~~~~~~~~~</p>
                <p>
                    이 형식으로 <em><u>작성</u></em>해주세요!
                </p>
                <p>
                    감사합니다<span class="text-danger">❤</span>
                <p>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-danger pull-right" data-dismiss="modal">닫기</button>
                    <a href="cwrite.jsp" class="btn btn-primary pull-right">글쓰기</a>

                </div>
            </div>

        </div>
    </div>
</div>
<!-- MODAL END -->
<!-- COPY Modal -->
<div class="modal fade" id="CopyModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <span class="modal-title" id="modal" style="text-align: center; font-size: 60px;"><strong>FOR&nbsp;COPY </strong></span>
            </div>
            <div class="modal-body">
                <p>
                    <mark>목사님</mark>
                    께서 저희들의 기도제목을 읽어주실 때, 편의를 위해서 만든 기능입니다.
                </p>
                <p>
                    선택하신
                    <mark>기간</mark>
                    에 올려진 기도제목을 모두 모아서 출력합니다.
                </p>
                <p>
                    <span class="text-danger" style="font-size: 25px;">TIP!</span>
                    <mark>pc</mark>
                    의 경우 일일이 선택하실 필요없이,'선택하세요' 클릭후, 원하는 값을 자판에서 숫자로 치고 'Enter'를 치면 훨씬 빠르게 선택가능합니다.
                </p>
                <form action="./cviewAll.jsp" method="post">
                    <div class="form-group col-xs-12 col-lg-12">
                        <p class="text-info">언제부터</p>
                        <label>년</label><select name="year" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="2019">2019년</option>
                        <option value="2020">2020년</option>
                        <option value="2021">2021년</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <label>월</label><select name="month" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <label>일</label><select name="day" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="01">1일</option>
                        <option value="02">2일</option>
                        <option value="03">3일</option>
                        <option value="04">4일</option>
                        <option value="05">5일</option>
                        <option value="06">6일</option>
                        <option value="07">7일</option>
                        <option value="08">8일</option>
                        <option value="09">9일</option>
                        <option value="10">10일</option>
                        <option value="11">11일</option>
                        <option value="12">12일</option>
                        <option value="13">13일</option>
                        <option value="14">14일</option>
                        <option value="15">15일</option>
                        <option value="16">16일</option>
                        <option value="17">17일</option>
                        <option value="18">18일</option>
                        <option value="19">19일</option>
                        <option value="20">20일</option>
                        <option value="21">21일</option>
                        <option value="22">22일</option>
                        <option value="23">23일</option>
                        <option value="24">24일</option>
                        <option value="25">25일</option>
                        <option value="26">26일</option>
                        <option value="27">27일</option>
                        <option value="28">28일</option>
                        <option value="29">29일</option>
                        <option value="30">30일</option>
                        <option value="31">31일</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <p class="text-info">언제까지</p>
                        <label>년</label><select name="year2" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="2019">2019년</option>
                        <option value="2020">2020년</option>
                        <option value="2021">2021년</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <label>월</label><select name="month2" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <label>일</label><select name="day2" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="01">1일</option>
                        <option value="02">2일</option>
                        <option value="03">3일</option>
                        <option value="04">4일</option>
                        <option value="05">5일</option>
                        <option value="06">6일</option>
                        <option value="07">7일</option>
                        <option value="08">8일</option>
                        <option value="09">9일</option>
                        <option value="10">10일</option>
                        <option value="11">11일</option>
                        <option value="12">12일</option>
                        <option value="13">13일</option>
                        <option value="14">14일</option>
                        <option value="15">15일</option>
                        <option value="16">16일</option>
                        <option value="17">17일</option>
                        <option value="18">18일</option>
                        <option value="19">19일</option>
                        <option value="20">20일</option>
                        <option value="21">21일</option>
                        <option value="22">22일</option>
                        <option value="23">23일</option>
                        <option value="24">24일</option>
                        <option value="25">25일</option>
                        <option value="26">26일</option>
                        <option value="27">27일</option>
                        <option value="28">28일</option>
                        <option value="29">29일</option>
                        <option value="30">30일</option>
                        <option value="31">31일</option>
                    </select>
                    </div>
                    <div class="modal-footer">
                        <div class="form-row">
                            <button type="submit" class="btn btn-primary">모으기</button>
                            <button type="button" class="btn btn-secondary btn-danger pull-right" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- MODAL END -->



<!-- MANAGER Modal -->
<div class="modal fade" id="ManagerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <span class="modal-title" id="modal" style="text-align: center; font-size: 60px;"><strong>CHANG<span style="font-size: 30px;"><span style="color: purple;">✞</span></span>DAE
					</strong></span>
            </div>
            <div class="modal-body">
                이곳은 창대교회 금요기도회 사이트
                <mark>관리자</mark>
                창입니다.

                <p class="text-danger" style="font-size: 40px;">후에 필요한 기능이 생길 때, 개발하겠습니다.</p>


                <form action="./ChangDae.jsp" method="post">
                    <div class="form-group col-xs-12 col-lg-12">
                        <p class="text-info">수정하실 날짜</p>
                        <label>년</label><select name="modifyYaer" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="2019">2019년</option>
                        <option value="2020">2020년</option>
                        <option value="2021">2021년</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <label>월</label><select name="modifyMonth" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    </div>
                    <div class="form-group col-xs-12 col-lg-12">
                        <label>일</label><select name="modifyDay" class="form-control">
                        <option selected>선택하세요</option>
                        <option value="01">1일</option>
                        <option value="02">2일</option>
                        <option value="03">3일</option>
                        <option value="04">4일</option>
                        <option value="05">5일</option>
                        <option value="06">6일</option>
                        <option value="07">7일</option>
                        <option value="08">8일</option>
                        <option value="09">9일</option>
                        <option value="10">10일</option>
                        <option value="11">11일</option>
                        <option value="12">12일</option>
                        <option value="13">13일</option>
                        <option value="14">14일</option>
                        <option value="15">15일</option>
                        <option value="16">16일</option>
                        <option value="17">17일</option>
                        <option value="18">18일</option>
                        <option value="19">19일</option>
                        <option value="20">20일</option>
                        <option value="21">21일</option>
                        <option value="22">22일</option>
                        <option value="23">23일</option>
                        <option value="24">24일</option>
                        <option value="25">25일</option>
                        <option value="26">26일</option>
                        <option value="27">27일</option>
                        <option value="28">28일</option>
                        <option value="29">29일</option>
                        <option value="30">30일</option>
                        <option value="31">31일</option>
                    </select>
                    </div>
                    <div class="form-group col-sm-12">
                        <p>암호</p>
                        <input type="password" class="form-control" placeholder="비밀번호" name="modifyPassword" maxlength="4">
                    </div>

                    <div class="modal-footer">
                        <div class="form-row">
                            <button type="submit" class="btn btn-primary">변경하기</button>
                            <button type="button" class="btn btn-secondary btn-danger pull-right" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- MODAL END -->
<!-- UpdateNote Modal -->
<div class="modal fade" id="UpdateNoteModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <span class="modal-title" id="modal" style="text-align: center; font-size: 60px;"><strong>개발일지 </strong></span>
            </div>
            <div class="modal-body">
                <p><mark>010-4288-3243</mark> 류동훈</p>


                <div class="jumbotron">
                    <div class="container">
                        <h3 class="text-info">
                            <span style="font-size: 30px; color:#eecdd1;">✿</span><span style="font-size: 35px;">19.01.24</span>
                        </h3>
                        <p>연락을 받고, 개발함.</p>
                        <p>전반적인 틀을 잡고, 삭제 기능 이외의 기능들을 구현. db와 연결.</p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="container">
                        <h3 class="text-info">
                            <span style="font-size: 30px; color:#eecdd1;">✿</span><span style="font-size: 35px;">19.01.25</span>
                        </h3>
                        <p>삭제 기능 구현.</p>
                        <p>전반적인 디자인을 함.</p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="container">
                        <h3 class="text-info">
                            <span style="font-size: 30px; color:#eecdd1;">✿</span><span style="font-size: 35px;">19.02.15</span>
                        </h3>
                        <p>한번에 다 출력할 수 있는 기능 <a class="btn icon-btn btn-info" data-toggle="modal" href="#">한번에&nbsp;복사</a>기능을 구현.</p>
                        <p>공지사항 수정, 기록을 남기기 위해 <a class="btn icon-btn btn-warning" data-toggle="modal" href="#">개발일지</a>기능을 구현.</p>
                        <img src="images/copy.png" style="height:200px; weight:200px;"><img src="images/develop.png" style="height:200px; weight:200px;">
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="container">
                        <h3 class="text-info">
                            <span style="font-size: 30px; color:#eecdd1;">✿</span><span style="font-size: 35px;">19.02.20</span>
                        </h3>
                        <p>게시글이 중첩되는 버그 해결.</p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="container">
                        <h3 class="text-info">
                            <span style="font-size: 30px; color:#eecdd1;">✿</span><span style="font-size: 35px;">19.02.21</span>
                        </h3>
                        <p>게시글 없어지는 버그 해결.</p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="container">
                        <h3 class="text-info">
                            <span style="font-size: 30px; color:#eecdd1;">✿</span><span style="font-size: 35px;">19.04.05</span>
                        </h3>
                        <p>디자인 수정.</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <p style="font-size: 10px; color: #6E6E6E;">ⓒ 2019. Dong Hoon Ryu all rights reserved. </p>
                    <div class="form-row">
                        <button type="button" class="btn btn-secondary btn-danger pull-right" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- MODAL END -->
<div class="container">
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
            </tr>

            </thead>
            <tbody id="ajaxTable">
            <%
                ArrayList<ChangDae> list = changDaeDAO.getList(pageNumber);
                for (int i = 0; i < list.size(); i++) {
                    String t = "33";
                    if (t.equals(list.get(i).getBbsDate().substring(8, 10))) {
            %>
            <tr style="background-color: #e5f4fc;">
                <td><a href="cview.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                        .replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
                <td><%=list.get(i).getUserID()%></td>
                <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13)
                        + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>

            </tr>
            <%
            } else {
            %>
            <tr>
                <td><a href="cview.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
                        .replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
                <td><%=list.get(i).getUserID()%></td>
                <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13)
                        + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>

            </tr>
            <%
                    }
                }
            %>


            </tbody>
        </table>
        <nav aria-label="Page navigation example" style="text-align: center;">
            <ul class="pagination">
                <%
                    if (pageNumber != 1) {
                %>
                <li class="page-item"><a class="page-link" href="ChangDae.jsp?pageNumber=<%=pageNumber - 1%>">이전</a></li>
                <%
                } else {
                %>
                <li class="page-item disabled"><a class="page-link">이전</a></li>
                <%
                    }
                %>
                <%
                    int temp = 1;
                    while (temp <= pages) {
                        if (temp == pageNumber) {	//현재 페이지가 temp면 active하다고 설정해준다.
                %>
                <li class="page-item active"><a class="page-link" href="ChangDae.jsp?pageNumber=<%=temp%>"><%=temp%></a></li>
                <%
                } else {
                %>
                <li class="page-item"><a class="page-link" href="ChangDae.jsp?pageNumber=<%=temp%>"><%=temp%></a></li>

                <%
                        }
                        temp = temp + 1;
                    }
                %>
                <%
                    if (changDaeDAO.nextPage(pageNumber + 1)) {	//다음 페이지가 존재할경우 '다음'칸을 활성화 시킨다.
                %>
                <li class="page-item"><a class="page-link" href="ChangDae.jsp?pageNumber=<%=pageNumber + 1%>">다음</a></li>
                <%
                } else {
                %>

                <li class="page-item disabled"><a class="page-link">다음</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <a class="btn icon-btn btn-warning" data-toggle="modal" href="#UpdateNoteModal">개발일지</a> <a class="btn icon-btn btn-danger" data-toggle="modal" href="#ManagerModal">관리자</a> <a class="btn icon-btn btn-info" data-toggle="modal" href="#CopyModal">한번에&nbsp;복사</a> <a href="cwrite.jsp" class="btn btn-primary pull-right">글쓰기</a>


        <hr>
        <p style="text-align:center; font-size: 10px; color: #6E6E6E;">Copyright 2021. Dong Hoon Ryu all rights reserved.</p>

    </div>

</div>




</body>
</html>