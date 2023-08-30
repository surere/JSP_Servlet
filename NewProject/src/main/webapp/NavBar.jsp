<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

:root {
  --text-color: #f0f4f5;
  --background-color: #263343;
  --accent-color: orange;
  --icons-color: rgb(152, 187, 201);
  --bodybackground-color: lightgray;
}

body { 
  margin: 0;
  background-color: var(--bodybackground-color);
  font-family: 'STIX Two Math';
}

a {
  text-decoration: none;
  color: var(--text-color);
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: var(--background-color);
  padding: 8px 12px;
  font-family: 'STIX Two Math';
}

.navbar__logo i {
  color: var(--accent-color);
  padding-left: 0;
}

 /* 버튼 배경 보여주기 
 li:hover 마우스 커서가 위에 올라갔을 때의 동작 변화를 보여줌 
 background-color 마우스 커서가 올라갔을 때 색이 바뀌도록 지정
 border-radius 배경색 모양 버튼의 모서리가 둥글게 될 수 있도록 함. */
 
.navbar__menu li:hover {
  background-color: var(--accent-color);
  border-radius: 3px;
}

.navbar__menu {
  list-style: none;
  display: flex;
  margin: 0;
  padding-left: 0;
}

.navbar__menu li {
  padding: 8px 30px;
}

.navbar__icons {
  list-style: none;
  display: flex;
  color: var(--icons-color);
  margin: 0;
  padding-left: 0;
}

.navbar__icons li {
  padding: 8px 12px;
  margin: 0;
}

/*@media를 사용해 반응형으로 바꿔준다. 
screen의 너비가 최대 크기 700px 까지는 { } 안에 있는 css 코드를 사용한다는 의미*/

@media screen and (max-width: 700px) {
}
/* navbar를 이용해 아이템들의 배치를 변경 */
 .navbar {
    flex-direction: column;
    align-items: flex-start;
    margin: 0;
  }
  
 /* flex-direction: column; 은 navbar 박스 내부의 박스들을 column 형태로
 정렬하는 것을 의미한다. 즉, main axis는 열이된다.(가운데 중간으로 들어감)
 aling-items: flex-start; 는 내부 박스들을 왼쪽에서 시작할 수 있도록 한다.
 로고 부분을 왼쪽에 두어야 하기 때문에 이 속성값을 사용한다.
 margin: 0; margin을 0으로 두어 공백이 생기지 않도록 한다. */


/*flex-direction: column; 으로 지정하면 main axis가 열 모양으로 바뀐다*/

/* .navbar__menu { */
/*     flex-direction: column; */
/*     align-items: center; */
/*     width: 100%; */
/*   } */
  
   /* .navbar_menu li { } .navbar_menu 내부에 있는 <li> 태그를 수정
   width를 100%로 하고 text를 가운데에 정렬시켜주면 주황색 반응박스가
   가로 전체를 차지함. */ 
/*   .navbar__menu li { */
/*     width: 100%; */
/*     text-align: center; */
/*   } */

/*  .navbar__icons { */
/*     display: none; */
/*     justify-content: center; */
/*     width: 100%; */
/*   } */

</style>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/kit_code.js" crossorigin="anonymous">
    </script>
    
    <title>Nav Bar</title>
    
  </head>

<body>

	<div class="dg-hd-mo hidden-lg">
          <h1 class="dg-hd-mo-logo-area">
            <a href="/">로고</a>
          </h1>
          <!--메뉴전체 -->
          <nav class="dg-hd-mo-menu-panel">
            <b class="dg-hd-mo-menu-btn" title="menu"><span></span></b>
              <div class="mo-menu-title">
                <a href="#" class="dg-white">로그인</a><!--로그아웃-->
                <a href="#" class="dg-white">회원가입</a><!--마이페이지-->
              </div>
              <ul>
                <li class="menu-label menu-arrow-active-li">
                  <a href="#" class="dg-point">브랜드이야기</a>
                  <span class="dg-hd-mo-menu-arrow menu-arrow-active"></span>
                  <ul class="sub-menu sub-menu-on">
                    <li><a href="#">브랜드소개</a></li>
                    <li><a href="#">CI</a></li>
                    <li><a href="#">찾아오시는 길</a></li>
                  </ul>
                </li>
                <li class="menu-label menu-arrow-active-li-next-li">
                  <a href="#" >메뉴</a>
                  <span class="dg-hd-mo-menu-arrow"></span>
                  <ul class="sub-menu">
                    <li><a href="#">단물곤물메뉴</a></li>
                  </ul>
                </li>
                <li class="menu-label">
                  <a href="#" >창업안내</a>
                  <span class="dg-hd-mo-menu-arrow"></span>
                  <ul class="sub-menu">
                    <li><a href="#">성공전략</a></li>
                    <li><a href="#">창업절차</a></li>
                    <li><a href="#">가맹점 개설비용</a></li>
                  </ul>
                </li>
                <li class="menu-label">
                  <a href="#" >가맹점안내</a>
                  <span class="dg-hd-mo-menu-arrow"></span>
                  <ul class="sub-menu">
                    <li><a href="#">오픈예정점</a></li>
                    <li><a href="#">가맹점</a></li>
                  </ul>
                </li>
                <li class="menu-label">
                  <a href="#" >가맹점안내</a>
                  <span class="dg-hd-mo-menu-arrow"></span>
                  <ul class="sub-menu">
                    <li><a href="#">오픈예정점</a></li>
                    <li><a href="#">가맹점</a></li>
                  </ul>
                </li>
                <li class="menu-label">
                  <a href="#">고객지원</a>
                  <span class="dg-hd-mo-menu-arrow"></span>
                  <ul class="sub-menu">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자주하는질문</a></li>
                    <li><a href="#">Q&amp;A</a></li>
                    <li><a href="#">개설문의</a></li>
                  </ul>
                </li>
              </ul>
          </nav>
          <!--어두워지는 부분-->
          <div class="dg-hd-mo-menu-panel-overlay"></div>
        </div>
	
<!-- 	 <nav class="navbar"> -->

<!--       <div class="navbar__logo"> -->
<!--         <i class="fas fa-blog"></i> -->
<!--         <a href="">AXCE Coding</a> -->
<!--       </div> -->

<!--       <ul class="navbar__menu"> -->
<!--         <li><a href="#">Home</a></li> -->
<!--         <li><a href="#">Gallery</a></li> -->
<!--         <li><a href="#">자유게시판</a></li> -->
<!--         <li><a href="#">FAQ</a></li> -->
       
<!--       </ul> -->

<!--       <ul class="navbar__icons"> -->
<!--         <li><i class="fab fa-google"></i></li> -->
<!--         <li><i class="fab fa-slack"></i></li> -->
<!--       </ul> -->
      
<!--     </nav> -->
</body>
</html>

