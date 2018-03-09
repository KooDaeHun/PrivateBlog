<%@ page contentType="text/html;charset=utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>resume</title>
	<link href="resources/css/devicons/css/devicons.css" rel="stylesheet" type="text/css">
	<link href="resources/css/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
<style>
a{
	text-decoration: none;
	color: black;	
}
.resumeName {
	width: 100%;
	height: 768px;
	text-align: center;
}

.name {
	width: 100%;
	height: 30%;
	text-align: center;
	font-weight: bolder;
	font-size: 50pt;
}

.resumeFirstName {
	color: #6CC0FF;
}

#myGitHub {
	font-size: 2rem;
	color: #4B4B4B;
	margin: 0;
}

#myGitHub:hover {
	color: #6CC0FF;
}

.resumeEmail {
	color: gray;
}

.resumeEmail:hover {
	color: #6CC0FF;
}

.resumeEducation {
	line-height: 45pt;
	font-size: 30pt;
	font-weight: bolder;
}

.resumeEduTerm {
	color: #6CC0FF;
}

.resumeSkils {
	line-height: 45pt;
	font-size: 30pt;
	font-weight: bolder;
}

.devicons {
	font-size: 2.45rem;
	margin: 0;
}

.devicons:hover {
	color: #6CC0FF;
}

.resumeInterest {
	line-height: 45pt;
	font-size: 30pt;
	font-weight: bolder;
}

.resumeAwards {
	line-height: 45pt;
	font-size: 30pt;
	font-weight: bolder;
}

.award {
	color: #ffc107 !important;
}

.award {
	-webkit-animation: blink 0.7s ease-in-out infinite alternate;
}
</style>
</head>
<body>
	<div class="resumeName">
		<span class="name resumeLastName" id="dayAndNightAdjColor">DAEHUN</span>
		<span class="name resumeFirstName">KOO</span><a
			href="https://github.com/"> <span
			class="devicons devicons-github" id="myGitHub"></span></a>

		<p class="resumeAddress">3542 Berry Street · Cheyenne Wells, CO
			80810 · (317) 585-8468</p>
		<a class="resumeEmail" href="https://www.google.com/gmail/">igoya93@gmail.com</a>
		<p class="resumeMe" id="dayAndNightAdjColor">I'd like to apply for
			the developer!</p>
		</br>

		<p class="resumeEducation">EDUCATION</p>
		<span class="resumeEduSummary" id="dayAndNightAdjColor">Computer
			Science Software at Daegu National University</span>
		<p class="resumeEduTerm">March 2012 - February 2018</p>
		</br>

		<p class="resumeSkils">SKILS</p>
		<span class="devicons devicons-html5" title="HTML5"></span> <span
			class="devicons devicons-css3" title="CSS"></span> <span
			class="devicons devicons-github" title="GitHub"></span> <span
			class="devicons devicons-javascript" title="JavaScript"></span> <span
			class="devicons devicons-bootstrap" title="BootStrap"></span> <span
			class="devicons devicons-java" title="Java"></span> <span
			class="devicons devicons-unity_small" title="Unity"></span> <span
			class="devicons devicons-eclipse" title="Eclipse"></span></br>
		</br>

		<p class="resumeAwards" id="dayAndNightAdjColor">Awards &amp;
			Certifications</p>
		<p>Computer utilization level 1</p>
		<span class="fa fa-trophy award"></span> <span>Award Winning
			Awards at Daegu University</span> <span class="fa fa-trophy award"></span></br>
		</br>

		<p class="resumeInterest">INTEREST</p>
		<p>I like the process where one small piece of work is collected
			and the result becomes a result.</p>
		<p>That's why we're looking for leather crafts, mechanical
			timepieces,</p>
		<p>The process of producing outcomes is enjoying a very tight
			taste.</p>
		<p>When the hand of a hand hand-knit itself and the result becomes
			the desired result.</p>
		<p>As a result, I felt the joy of the leather when it was
			finished.</p>
		<p>So I decided to develop a developer, and I enjoy developing
			them.</p>
	</div>
</body>
</html>