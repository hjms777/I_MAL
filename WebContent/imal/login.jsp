<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="ko">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>IMAL</title>
<link rel="icon" type="image/x-icon" href="<%=cp %>/imal/data/logo/itmal.png" />
<link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="<%=cp%>/imal/data/main.css" />
<link rel="stylesheet" href="<%=cp%>/imal/data//media.css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- GSAP & ScrollToPlugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js" integrity="sha512-VEBjfxWUOyzl0bAwh4gdLEaQyDYPvLrZql3pw1ifgb6fhEvZl9iDDehwHZ+dsMzA0Jfww8Xt7COSZuJ/slxc4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/ScrollToPlugin.min.js" integrity="sha512-lZACdYsy0W98dOcn+QRNHDxFuhm62lfs8qK5+wPp7X358CN3f+ml49HpnwzTiXFzETs4++fADePDI+L2zwlm7Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- SWIPER -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- ScrollMagic -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- AOS.js -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script defer src="<%=cp%>/imal/data/main.js"></script>
  
  
<script type="text/javascript">
  
	function sendIt() {
		
		var f = document.myForm;
		
			str = f.userId.value;
			str = str.trim();
			if (!str) {
				alert("아이디를 입력하세요");
				f.userId.focus();
				return;
			}
			f.userId.value =str;
			
			str = f.userPwd.value;
			str = str.trim();
			if (!str) {
				alert("비밀번호를 입력하세요");
				f.userPwd.focus();
				return;
			}
			f.userPwd.value =str;
			
		
			f.action = "<%=cp%>/itmall/login_ok.do";
			f.submit();
		}
	
	function join() {
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/itmall/created.do";
		
		
	}
	
	function parseType(type) {
		   
		  var f2 = document.myForm2;
		  var str = f2.searchValue.value;
		  
		  switch (type) {

		   case 1:
			   type = '워치'

				   break;
		   case 2:
			   type = '모자'
	   
				   break;
		   case 3:
			   type = '재킷'
		  
				   break;
		   case 4:
			   type = '지갑'
				   
				   break;   
		   case 5:
			   type = '벨트'
				
				   break;   
		   default:
			   
		   }
		   
		 f2.searchValue.value = type;

	  }
	  
	  function sendIt2() {
		  
		  var f2 = document.myForm2;
		  
		  f2.action = "<%=cp %>/itmall/goodslist2.do";
		  
		  f2.submit();
		
	}
	
	
	
	
	  
</script>
  
  
</head>

<body>
  

  <header id="high">

    <div class="inner">
      <a href="javascript:void(0)" id="gnbOpen"><img src="https://casa.co.kr/images/common/btn_m_list.png" alt="내비게이션 열기" /></a>
      <h1>
        <a href="<%=cp%>/itmall/main.do"/><img src="<%=cp %>/imal/data/logo/imal_logo.png" alt="itwillmall"/></a>
      </h1>
      <ul class="gnb-sub">
        <li id="search-btn"><a href="javascript:void(0)"><img src="<%=cp %>/imal/data/image_main/btn_top_search.png" alt="상품검색" /></a></li>
       
    
        <li style="margin-right: 15px;">
        
	        <c:choose>
	        
		        <c:when test="${empty sessionScope.customInfo.userId }">
			        <a href="<%=cp%>/itmall/login.do">
			        	<img src="<%=cp %>/imal/data/image_main/btn_top_loginkey.png" alt="로그인" />
			        </a>
		        </c:when>
		        
		        <c:otherwise>
		        
			        <a href="<%=cp%>/itmall/mypage.do">
			        	<img src="<%=cp %>/imal/data/image_main/btn_top_login.png" alt="회원정보수정" />
			        </a>
		        	
		        	<!-- 로그아웃사진 -->
				       <li id="search-btn" style="margin-right: 15px;"> 
					       <a href="<%=cp%>/itmall/logout.do">
					       <img src="<%=cp %>/imal/data/image_main/btn_top_logout.png" alt="로그아웃" />
					       </a>
				       </li>
				       
				        <li>
				        	<a href="javascript:location.href='<%=cp%>/itmall/mybag.do'"><img src="<%=cp %>/imal/data/image_main/btn_top_order.png" alt="장바구니" />
							</a>
				        </li>
		        	
		        </c:otherwise>
		        
	        </c:choose>
        
        </li>
        
       
      </ul>
    </div>

    <nav>
      <div id="gnb">
        <div class="inner">
          <ul>
            <li><a href="javascript:void(0)" id="gnbCLose"><span class="ico_bg"></span><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_48px-128.png" alt="내비게이션 닫기" /></a></li>
            <li class="mobile-only"><a href="javascript:void(0)"><img src="https://casa.co.kr/images/common/logo_new.gif" alt="casaliving" /></a></li>
            <li class="mobile-only"><a href="javascript:void(0)"><span class="ico_bg"></span><img src="https://casa.co.kr/images/common/btn_top_login.png" alt="로그인" class="mobile-only"/></a></li>
          </ul>
          <ul>
            <li><a class="hash-btn" href="javascript:void(0)">&#35; BEST</a></li>
            <li><a class="hash-btn" href="javascript:void(0)">&#35; NEW</a></li>
          </ul>
          <div>
          
            <ul class="gnb-1">
              <li>
                <h3 class="menu">CLOTHES</h3>
                <ul class="snb">
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=jacket">자켓</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=top">상의</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=bottom">하의</a></li>
                </ul>
              </li>
              <li>
                <h3 class="menu"><a href="<%=cp%>/itmall/goodslist.do?cate=bag">BAG</a></h3>
              </li>
              <li>
                <h3 class="menu"><a href="<%=cp%>/itmall/goodslist.do?cate=shoes">SHOES</a></h3>
              </li>
              <li>
                <h3 class="menu">ACC</h3>
                <ul class="snb">
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=watch">시계</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=cap">모자</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=socks">양말</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=wallet">지갑</a></li>
                  <li><a href="<%=cp%>/itmall/goodslist.do?cate=belt">벨트</a></li>
                </ul>
              </li>
            </ul>
            
            <!-- 
            <ul class="gnb-2">
              <li><h3 class="menu"><a href="javascript:void(0)">magazine</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">event</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">notice</a></h3></li>
              <li><h3 class="menu"><a href="javascript:void(0)">qna</a></h3></li>
            </ul>
            -->
            <div class="gnb-image"><a href="javascript:void(0)"><img src="<%=cp%>/imal/data/image_main/celine_1.jpg" alt="베르판" /></a></div>      
          </div>    
        </div>
      </div>
    </nav>
 <!-- 검색창 -->
    <form action="<%=cp %>/itmall/goodslist2.do" method="post" name="myForm2">
    <div class="search-container">

      <div class="search-wrapper">
        <div id="searchClose">
          <img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_clear_48px-128.png" alt="검색창 닫기" style="width: 28px; height=25px;" >
        </div>
        <div class="search-zone">

          <input type="text" placeholder="검색어를 입력해주세요" id="input_txt" name="searchValue" value=""/>
         
          <img src="https://casa.co.kr/images/common/btn_top_search.png" alt="검색" 
          onclick="sendIt2();"/>
          
          <input type="submit" value="검색" style="display: none;"/>
         
        </div>
        <span class="sub-tit">추천 검색어</span>
        <ul class="keyword-zone">
          <li value="1"  onclick="parseType(1);"><a href="javascript:void(0)" class="keyword">&#35;워치</a></li>
          <li value="2"  onclick="parseType(2);"><a href="javascript:void(0)" class="keyword">&#35;모자</a></li>
          <li value="3"  onclick="parseType(3);"><a href="javascript:void(0)" class="keyword">&#35;재킷</a></li>
          <li value="4"  onclick="parseType(4);"><a href="javascript:void(0)" class="keyword">&#35;지갑</a></li>
          <li value="5"  onclick="parseType(5);"><a href="javascript:void(0)" class="keyword">&#35;벨트</a></li>
        </ul>
      </div>
    </div>
</form>


  </header>
  
  <main>
 
 <form action="" method="post" name="myForm" > 
 

  <article class="login">
  
    <h2 align="center">Login</h2>

    <div class="content-box">

      <div>
        통합 아이디로 로그인 하실 수 있습니다.
      </div>

      <div>
        <input type="text" placeholder="아이디를 입력해주세요." name="userId">
      </div>

      <div>
        <input type="password" placeholder="비밀번호를 입력해주세요." name="userPwd">
      </div>

      <div style="font-size: 15px; width: 100%;">
        <label>
          <input type="hidden">
        </label>
        <div style="display: inline-flex;  font-size: 10pt; width:30%; clear:both; margin-right: 1px; margin-top: 5px;">
          <a href="<%=cp %>/itmall/searchId.do">아이디 찾기</a>
          <a href="<%=cp %>/itmall/searchPwd.do">비밀번호 찾기</a>
        </div>
      </div>

      <button class="black-btn" onclick= "sendIt();">로그인</button><br/>
      <button class="white-btn" onclick="join();">회원가입</button>

      <hr />
	
	 <c:if test="${!empty message }">
	 <table style="margin: auto;">
		 <tr>
			 <td>
			  ${message }
			 </td>
		 </tr>
	 
	 </table>
	 </c:if>
	
    </div>
	
  </article>
  
  
</form>

</main>

<!-- 하단 -->
  <div class="links">
    <ul>
      <li><a href="javascript:void(0)"><img src="https://www.sulwhasoo.com/kr/ko/resource/img/a/instaLogo.png" alt="인스타그램" /></a></li>
      <li><a href="javascript:void(0)"><img src="https://www.sulwhasoo.com/kr/ko/resource/img/a/youtubeLogo.png" alt="유튜브" /></a></li>
      <li><a href="javascript:void(0)"><img src="https://www.sulwhasoo.com/kr/ko/resource/img/a/kakaoChannelLogo.png" alt="카카오톡채널" /></a></li>
    </ul>
  </div>

  <footer>

    <div class="inner">
      <ul class="fnb">
        <li><a href="javascript:void(0)">아이몰 소개</a></li>
        <li><a href="javascript:void(0)">개인정보취급방침</a></li>
        <li><a href="javascript:void(0)">이용약관</a></li>
      </ul>
      <div>
        <ul class="low">
          <li><a href="javascript:void(0)">(주)아이몰</a></li>
          <li><a href="javascript:void(0)">대표자 : 강민성, 권지은, 박진혁, 양설희, 홍지혁</a></li>
          <li><a href="javascript:void(0)">개인정보책임자 : cs@imal.co.kr</a></li>
          <li><a href="javascript:void(0)">사업자번호 : 111-22-33333</a></li>
          <li><a href="javascript:void(0)">통신판매업신고 제2001-서울서초-00591호</a></li>
          <li><a href="javascript:void(0)">사업자정보확인</a></li>
        </ul>
        <ul class="customer">
          <li><strong>CS CENTER</strong></li>
          <li><a href="javascript:void(0)"><strong>1644-0406</strong></a></li>
          <li>09:00~16:30 <strong>MON-FRI</strong></li>
          <li>12:00~13:10 <strong>LUNCH TIME</strong></li>
          <li>WEEKEND / HOLIDAY <strong>OFF</strong></li>
        </ul>
      </div> 
    </div>
  </footer>


  <div id="to-top">
    <span class="material-symbols-outlined">arrow_upward</span>
  </div>



</body>


</html>
  
  
  
  
  