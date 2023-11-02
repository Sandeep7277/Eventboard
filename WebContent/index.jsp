<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="mheader.jsp" flush="true"></jsp:include>
<div class="container-fluid p-0 m-0">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" style="height: 100vh;"
					src="images/Slide1.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Celebration of Gandhi Jayanti</h5>
					<p>Pondicherry University</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 100vh;"
					src="images/Slide2.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Annual Day Celebration</h5>
					<p>Pondicherry University</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 100vh;"
					src="images/Slide3.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Main Gate</h5>
					<p>Pondicherry University</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="height: 100vh;"
					src="images/Slide4.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Auditorium Event</h5>
					<p>Degree Distribution Event on Auditorium (Pondicherry
						University)</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>
<section class="jumbotron text-center mb-0 text-white rounded-0"
	id="about" style="height: 60vh; background-color: #255">
	<div class="container">
		<h1 class="jumbotron-heading">About Computer Science Department</h1>
		<p class="lead">The Department aims at imparting quality education
			in Computer Science & Engineering and Information Technology through
			various post-graduate programmes. It also offers an atmosphere
			conducive for research scholars for pursuing research in various
			advanced areas of Computer Science, Engineering and Information
			Technology. The Computer Science students’ association, PIXEL,
			provides opportunities to sharpen the skills of students by
			organizing lectures and students meet. The alumni of the department
			deliver lectures on latest topics periodically for updating the skill
			sets of the students.</p>
	</div>
</section>

<div class="container-fluid pt-2" id="event">
        <h3 class="text-center">Events</h3>
        <div class="row">
        <%
        	List<Map<String, String>> list = DbHelper.findrecords("events","status<>'canceled'");
                    for (Map<String, String> map : list) {
                        List<Map<String, String>> list2 = DbHelper.findrecords("category", "catid=" + Integer.parseInt(map.get("catid")));
                        Map<String, String> map2 = list2.get(0);
                        String cname = map2.get("catname");
        %>
        <div class="col-md-4">
            <div class="card mb-4 shadow">
                <img class="card-img-top" style="height:200px;" src="events/<%= map.get("photo")%>" data-holder-rendered="true">
                <div class="card-body">
                    <h5><%= cname%></h5>                    
                    <p class="my-0">Date : From <%= map.get("startdate")%> to <%= map.get("endate")%></p>
                    <p class="my-0">Time : From <%= map.get("starttime")%> to <%= map.get("endtime")%></p>
                    <p>Event Fees &#8377; <%= map.get("fees") %>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <a href="BookEvent?eventid=<%= map.get("eventid") %>" class="btn btn-sm btn-outline-primary">Register Event</a>                      
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
        <% }
        %>
    </div>
</div>


<div class="container-fluid text-white" id="contact" style="background-color: #030116;height:500px;">
    <h3 class="text-center py-3">Contact Us</h3>
    <div class="row justify-content-center">
        <div class="media-container-column col-lg-8 p-3" data-form-type="formoid">                   
            <form class="mbr-form" method="post" data-form-title="Mobirise Form"><input type="hidden" data-form-email="true" value="zdGVBcNRThcdWUUfI+3PsLnnLtHc8JIdEhub3sFJZu3mJPkE6oxv5FmU79KVvaLjKSmEfsOBbKYj1Cps8hm2o1hmKtkhiOdHe4oDrPZiHdR0Yvomv7W9ZOtj6J4piMeE">
                <div class="row row-sm-offset">
                    <div class="col-md-4 multi-horizontal" data-for="name">
                        <div class="form-group">
                            <label class="form-control-label mbr-fonts-style display-7" for="name-form1-2w">Name</label>
                            <input type="text" class="form-control" name="name" data-form-field="Name" required="" id="name-form1-2w">
                        </div>
                    </div>
                    <div class="col-md-4 multi-horizontal" data-for="email">
                        <div class="form-group">
                            <label class="form-control-label mbr-fonts-style display-7" for="email-form1-2w">Email</label>
                            <input type="email" class="form-control" name="email" data-form-field="Email" required="" id="email-form1-2w">
                        </div>
                    </div>
                    <div class="col-md-4 multi-horizontal" data-for="phone">
                        <div class="form-group">
                            <label class="form-control-label mbr-fonts-style display-7" for="phone-form1-2w">Phone</label>
                            <input type="tel" class="form-control" name="phone" data-form-field="Phone" id="phone-form1-2w">
                        </div>
                    </div>
                </div>
                <div class="form-group" data-for="message">
                    <label class="form-control-label mbr-fonts-style display-7" for="message-form1-2w">Message</label>
                    <textarea type="text" class="form-control" name="message" rows="7" data-form-field="Message" id="message-form1-2w"></textarea>
                </div>

                <span class="input-group-btn">
                    <button href="" type="submit" class="btn btn-primary btn-form display-4">Send Message</button>
                </span>
            </form>
        </div>
    </div>
</div>        
<jsp:include page="mfooter.jsp" flush="true"/>
