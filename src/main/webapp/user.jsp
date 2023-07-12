<%@page import="model.Appointment"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>medical</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- magnific popup CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- nice select CSS -->
<link rel="stylesheet" href="css/nice-select.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<%
	if (session.getAttribute("uname") == null) {
		out.print("Please login first");
		response.sendRedirect("index.jsp");
	}
	%>
	<!--::header part start::-->
	<header class="main_menu home_menu">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light"> <a
					class="navbar-brand" href="index.html"> <img src="img/logo.png"
					alt="logo">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div
					class="collapse navbar-collapse main-menu-item justify-content-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav align-items-center">
						<li class="nav-item active"><a class="nav-link" href="#home">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#about">about</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="appointmentlist.jsp">AppointList</a></li>


						<li class="nav-item"><a class="nav-link" href="#feature">Features</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
						</li>
					</ul>
				</div>
				<a class="btn_2 d-none d-lg-block" href="#">Welcome ,<%
				out.print(session.getAttribute("uname"));
				%></a> </nav>
			</div>
		</div>
	</div>
	</header>
	<!-- Header part end-->

	<!-- banner part start-->
	<section class="banner_part">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-5 col-xl-5">
				<div class="banner_text">
					<div class="banner_text_iner">
						<h5>We are here for your care</h5>
						<h1>Best Care & Better Doctor</h1>
						<p>"Our vision is to be the region's foremost healthcare
							provider with access to diverse clinical services focusing on
							consistency in ethical delivery of quality care, research and
							use of the best technology."</p>
						<a href="#regervation_part_iner" class="btn_2" >Make an
							appointment</a>
							<a href="NewFile.html" class="btn btn-success">Write a Feedback</a>

					</div>
				</div>
			</div>
			<div class="col-lg-7">
				<div class="banner_img">
					<img src="img/banner_img.png" alt="">
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- banner part start-->

	<%
	String id = request.getParameter("id");
	String driverName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "doctor";
	String userId = "root";
	String password = "0212";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	String s = (String) request.getAttribute("uname");
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>
	<div class="col-12 tm-block-col">
		<div
			class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
			<center>
				<h2 class="tm-block-title">My Appointments</h2>
			</center>
			<br> <br>
			<table class="table">
				<thead>
					<tr>

						<th scope="col">Name</th>
						<th scope="col">E-Mail</th>
						<th scope="col">Date</th>
						<th scope="col">Time</th>
						<th scope="col">Note</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
						<th scope="col">Add Your Medical Reports photo</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {

						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						statement = connection.createStatement();
						String sql = "SELECT * FROM appointment where usname='" + s + "'";

						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
					%>

					<tr>

						<td><%=resultSet.getString("aname")%></td>
						<td><b><%=resultSet.getString("aemail")%></b></td>
						<td><b><%=resultSet.getString("adate")%></b></td>
						<td><b><%=resultSet.getString("atime")%></b></td>
						<td><%=resultSet.getString("anote")%></td>
						<td><%=resultSet.getString("status")%></td>
						<td><a href="deleteapp?aid=<%=resultSet.getString("aid")%>"><input
								type="button" class="btn btn-primary" value="Delete"></a></td>

						<td><a href="addImage.jsp"><input type="button"
								class="btn btn-primary" value="AddFile"></a></td>

						<%
						}

						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	<!-- about us part start-->
	<section class="about_us padding_top" id="about">
	<div class="container">
		<div class="row justify-content-between align-items-center">
			<div class="col-md-6 col-lg-6">
				<div class="about_us_img">
					<!--  <img src="img/top_service.png" alt=""> -->
					<p>
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d242005.2234537977!2d73.60487378183765!3d18.60414838677503!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bbc313557353%3A0xd6e203ef53147b33!2sRuby%20Hall%20Clinic%2C%20Hinjawadi%2C%20Pune!5e0!3m2!1sen!2sin!4v1688734176370!5m2!1sen!2sin"
							width="600" height="450" style="border: 0;" allowfullscreen=""
							loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					</p>

				</div>
			</div>
			<div class="col-md-6 col-lg-5">
				<div class="about_us_text">
					<h2>About us</h2>
					<p>"We Add Care" by demonstrating our constant commitment
						towards the principles of ethics through:. Commitment to be a
						leader in healthcare with a human touch.Advancing a professional
						patient-centered approach and serving our community through
						outreach and social responsibility initiatives .Ensuring
						innovative approach and facilitating curative research initiatives</p>
					<a class="btn_2 " href="#">learn more</a>
					<div class="banner_item">
						<div class="single_item">
							<img src="img/icon/banner_1.svg" alt="">
							<h5>Emergency</h5>
						</div>
						<div class="single_item">
							<img src="img/a.PNG" alt="">
							<h5>Ambulance</h5>
							<h5>102</h5>
						</div>
						<div class="single_item">
							<img src="img/icon/banner_3.svg" alt="">
							<h5>Qualfied</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- about us part end-->

	<!-- feature_part start-->
	
	
	
	
	
	
	
	<section class="feature_part">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8">
				<div class="section_tittle text-center">
					<h2>Our services</h2>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		<div class="row justify-content-between align-items-center">
			<div class="col-lg-3 col-sm-12">
				<div class="single_feature">
					<div class="single_feature_part">
						<span class="single_feature_icon"><img
							src="img/icon/feature_1.svg" alt=""></span>
						<h4>Better Future</h4>
						<p>Darkness multiply rule Which from without life creature
							blessed give moveth moveth seas make day which divided our have.</p>
					</div>
				</div>
				
				
				
				<div class="single_feature">
					<div class="single_feature_part">
						<span class="single_feature_icon"><img
							src="img/icon/feature_2.svg" alt=""></span>
						<h4>Better Future</h4>
						<p>Darkness multiply rule Which from without life creature
							blessed give moveth moveth seas make day which divided our have.</p>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			<div class="col-lg-4 col-sm-12">
				<div class="single_feature_img">
					<img src="img/service.png" alt="">
				</div>
			</div>
			<div class="col-lg-3 col-sm-12">
				<div class="single_feature">
					<div class="single_feature_part">
						<span class="single_feature_icon"><img
							src="img/icon/feature_1.svg" alt=""></span>
						<h4>Better Future</h4>
						<p>Darkness multiply rule Which from without life creature
							blessed give moveth moveth seas make day which divided our have.</p>
					</div>
				</div>
				<div class="single_feature">
					<div class="single_feature_part">
						<span class="single_feature_icon"><img
							src="img/icon/feature_2.svg" alt=""></span>
						<h4>Better Future</h4>
						<p>Darkness multiply rule Which from without life creature
							blessed give moveth moveth seas make day which divided our have.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	</section>
	<!-- feature_part start-->

	<!-- our depertment part start-->
	<section class="our_depertment section_padding" id="feature">
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-xl-12">
				<div class="depertment_content">
					<div class="row justify-content-center">
						<div class="col-xl-8">
							<h2>Our Depertment</h2>
							<div class="row">
								<div class="col-lg-6 col-sm-6">
									<div class="single_our_depertment">
										<span class="our_depertment_icon"><img
											src="img/icon/feature_2.svg" alt=""></span>
										<h4>Better Future</h4>
										
										
										
										
										
										
										
										
										
										
										
										<p>Darkness multiply rule Which from without life creature
											blessed give moveth moveth seas make day which divided our
											have.</p>
									</div>
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="single_our_depertment">
										<span class="our_depertment_icon"><img
											src="img/icon/feature_2.svg" alt=""></span>
										<h4>Better Future</h4>
										<p>Darkness multiply rule Which from without life creature
											blessed give moveth moveth seas make day which divided our
											have.</p>
									</div>
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="single_our_depertment">
										<span class="our_depertment_icon"><img
											src="img/icon/feature_2.svg" alt=""></span>
										<h4>Better Future</h4>
										<p>Darkness multiply rule Which from without life creature
											blessed give moveth moveth seas make day which divided our
											have.</p>
									</div>
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="single_our_depertment">
										<span class="our_depertment_icon"><img
											src="img/icon/feature_2.svg" alt=""></span>
										<h4>Better Future</h4>
										<p>Darkness multiply rule Which from without life creature
											blessed give moveth moveth seas make day which divided our
											have.</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- our depertment part end-->

	<!--::doctor_part start::-->
	<section class="doctor_part section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8">
				<div class="section_tittle text-center">
					<h2>Experienced Doctors</h2>
					<p>Face replenish sea good winged bearing years air divide
						wasHave night male also</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-lg-3">
				<div class="single_blog_item">
					<div class="single_blog_img">
						<img src="img/doctor/doctor_1.png" alt="doctor">
						<div class="social_icon">
							<ul>
								<li><a href="#"> <i class="ti-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="ti-twitter-alt"></i>
								</a></li>
								<li><a href="#"> <i class="ti-instagram"></i>
								</a></li>
								<li><a href="#"> <i class="ti-skype"></i>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="single_text">
						<div class="single_blog_text">
							<h3>DR Adam Billiard</h3>
							<p>Heart specialist</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3">
				<div class="single_blog_item">
					<div class="single_blog_img">
						<img src="img/doctor/doctor_4.png" alt="doctor">
						<div class="social_icon">
							<ul>
								<li><a href="#"> <i class="ti-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="ti-twitter-alt"></i>
								</a></li>
								<li><a href="#"> <i class="ti-instagram"></i>
								</a></li>
								<li><a href="#"> <i class="ti-skype"></i>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="single_text">
						<div class="single_blog_text">
							<h3>DR Adam Billiard</h3>
							<p>Medicine specialist</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3">
				<div class="single_blog_item">
					<div class="single_blog_img">
						<img src="img/doctor/doctor_2.png" alt="doctor">
						<div class="social_icon">
							<ul>
								<li><a href="#"> <i class="ti-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="ti-twitter-alt"></i>
								</a></li>
								<li><a href="#"> <i class="ti-instagram"></i>
								</a></li>
								<li><a href="#"> <i class="ti-skype"></i>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="single_text">
						<div class="single_blog_text">
							<h3>DR Fred Macyard</h3>
							<p>CHeart specialist</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-lg-3">
				<div class="single_blog_item">
					<div class="single_blog_img">
						<img src="img/doctor/doctor_3.png" alt="doctor">
						<div class="social_icon">
							<ul>
								<li><a href="#"> <i class="ti-facebook"></i>
								</a></li>
								<li><a href="#"> <i class="ti-twitter-alt"></i>
								</a></li>
								<li><a href="#"> <i class="ti-instagram"></i>
								</a></li>
								<li><a href="#"> <i class="ti-skype"></i>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="single_text">
						<div class="single_blog_text">
							<h3>DR Justin Stuard</h3>
							<p>Heart specialist</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--::doctor_part end::-->

	<!--::regervation_part start::-->
	<section class="regervation_part section_padding">
	<div class="container" id="regervation_part_iner">
		<div class="row align-items-center regervation_content">
			<div class="col-lg-7">
				<div class="regervation_part_iner">
					<form method="post" action="addappointment">
						<h2>Make an Appointment</h2>
						
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<input type="name" class="form-control" id="aname" name="aname"
									placeholder="Patient Name">
							</div>

							<div class="form-group col-md-6">
								<input type="email" class="form-control" id="aemail"
									name="aemail" placeholder="Email address">
							</div>
							<div class="form-group col-md-6">
								<input type="date" class="form-control" id="adate" name="adate">
							</div>
							<div class="form-group time_icon col-md-6">
								<select class="form-control" id="time" name="atime">
									<option value="" selected>Time</option>
									<option value="8 AM TO 10AM">8 AM TO 10AM</option>
									<option value="10 AM TO 12PM">10 AM TO 12PM</option>
									<option value="12PM TO 2PM">12PM TO 2PM</option>
									<option value="2PM TO 4PM">2PM TO 4PM</option>
									<option value="4PM TO 6PM">4PM TO 6PM</option>
									<option value="6PM TO 8PM">6PM TO 8PM</option>
									<option value="4PM TO 10PM">4PM TO 10PM</option>
									<option value="10PM TO 12PM">10PM TO 12PM</option>
								</select>
							</div>
							<div class="form-group col-md-12">
								<textarea class="form-control" id="Textarea" name="anote"
									rows="4" placeholder="Your Note "></textarea>

							</div>
							<input type="hidden" name="usname"
								value="<%out.print(session.getAttribute("uname"));%>">
						</div>
						<input class="btn btn-outline-danger" type="submit"
							value="Make an Appointment">

					</form>
				</div>
			</div>
			<div class="col-lg-5 col-md-6">
				<div class="reservation_img">
					<img src="img/reservation.png" alt="" class="reservation_img_iner">
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--::regervation_part end::-->



	<!-- footer part start-->
	<footer class="footer-area">
	<div class="footer section_padding">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-xl-2 col-md-4 col-sm-6 single-footer-widget">
					<a href="#" class="footer_logo"> <img src="img/logo.png"
						alt="#">
					</a>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor</p>
					<div class="social_logo">
						<a href="#"><i class="ti-facebook"></i></a> <a href="#"> <i
							class="ti-twitter"></i>
						</a> <a href="#"><i class="ti-instagram"></i></a> <a href="#"><i
							class="ti-skype"></i></a>
					</div>
				</div>
				<div class="col-xl-2 col-sm-6 col-md-4 single-footer-widget">
					<h4>Quick Links</h4>
					<ul>
						<li><a href="#">About us</a></li>
						<li><a href="#">Department</a></li>
						<li><a href="#"> Online payment</a></li>
						<li><a href="#">Careers</a></li>
						<li><a href="#">Department</a></li>
					</ul>
				</div>
				<div class="col-xl-2 col-sm-6 col-md-4 single-footer-widget">
					<h4>Explore</h4>
					<ul>
						<li><a href="#">In the community</a></li>
						<li><a href="#">IU health foundation</a></li>
						<li><a href="#">Family support </a></li>
						<li><a href="#">Business solution</a></li>
						<li><a href="#">Community clinic</a></li>
					</ul>
				</div>
				<div class="col-xl-2 col-sm-6 col-md-6 single-footer-widget">
					<h4>Resources</h4>
					<ul>
						<li><a href="#">Lights were season</a></li>
						<li><a href="#"> Their is let wherein</a></li>
						<li><a href="#">which given over</a></li>
						<li><a href="#">Without given She</a></li>
						<li><a href="#">Isn two signs think</a></li>
					</ul>
				</div>
				<div class="col-xl-3 col-sm-6 col-md-6 single-footer-widget">
					<h4>Newsletter</h4>
					<p>Seed good winged wherein which night multiply midst does not
						fruitful</p>
					<div class="form-wrap" id="mc_embed_signup">
						<form target="_blank"
							action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							method="get" class="form-inline">
							<input class="form-control" name="EMAIL"
								placeholder="Your Email Address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Email Address '" required=""
								type="email">
							<button class="click-btn btn btn-default text-uppercase">
								<i class="ti-angle-right"></i>
							</button>
							<div style="position: absolute; left: -5000px;">
								<input name="b_36c4fd991d266f23781ded980_aefe40901a"
									tabindex="-1" value="" type="text">
							</div>

							<div class="info"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	</footer>

	<!-- footer part end-->

	

	<script src="js/jquery-1.12.1.min.js"></script>
	
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>