<%-- 
    Document   : footer
    Created on : 28-Feb-2017, 22:24:46
    Author     : NguyenDang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>footer</title>
    </head>
    <body>
        <div class="footer">
		<div class="container">
		<div class="footer-top">
		<div class="col-md-9 footer-top1">
		<h4>Hợp tác kinh doanh cùng BK ACOUSTIC SHOP </h4>
		<p>Nếu bạn muốn trở thành một trong chuỗi hệ thống BK ACOUSTIC SHOP trong việc kinh doanh các nhạc cụ hoặc dạy học thì hãy liên hệ với chúng tôi ngay để được hỗ trợ.</p>
		</div>
		<div class="col-md-3 footer-top2">
		<a href="contact.jsp">Liên hệ chúng tôi</a>
		</div>
		<div class="clearfix"> </div>
		</div>
			<div class="footer-grids">
				<div class="col-md-4 footer-grid animated wow fadeInLeft" data-wow-delay=".5s">
					<h3>Giới Thiệu</h3>
					<p>Five Fixer là một nhóm fix code hàng đầu VN 
<span>Chúng tôi là nhà Phân phối Chính thức hầu hết những phầm mềm hàng đầu trên thế giới.</span></p>
				</div>
				<div class="col-md-4 footer-grid animated wow fadeInLeft" data-wow-delay=".6s">
					<h3>Thông Tin Liên Hệ</h3>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" ></i>Số 1 Đại Cồ Việt <span>Q.Hai Bà Trưng, TP. Hà Nội.</span></li>
						<li class="foot-mid"><i class="glyphicon glyphicon-envelope" ></i><a href="mailto:contact@sis.hust.du.vn">contact@sis.hust.edu.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" ></i>0123456789 (Group FF)</li>
					</ul>
				</div>
				<div class="col-md-4 footer-grid animated wow fadeInLeft" data-wow-delay=".7s">
				<h3>Đăng ký theo dõi qua Email </h3>
                                <form action="NewsletterServlet" method="post">
					<input type="text" placeholder="Hãy nhập Email của bạn" name="email" required="">
                                        <input type="hidden" name="command" value="insert">
					<input type="submit" value="Gửi">
				</form>
			
				</div>
			
				<div class="clearfix"> </div>
			</div>
			
			<div class="copy-right animated wow fadeInUp" data-wow-delay=".5s">
				<p>&copy 2019 Five Fixer(HHLTT) </p>
			</div>
		</div>
	</div>
    </body>
</html>
