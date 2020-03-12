

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="get.ProductGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ProductGet productGet = new ProductGet();
            String category_id_1 = "2";
            String category_id_6 = "3";
            String category_id_4 = "1";
            String category_id_5 = "4";
            if (request.getParameter("category") != null) {
                category_id_1 = request.getParameter("category");
                category_id_6 = request.getParameter("category");
                category_id_4 = request.getParameter("category");
                category_id_5 = request.getParameter("category");
            }
            DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>
        
        
        
   


        <!--banner quản cáo--> 

        <div class="container">
            <div class="promotebanner b1">
                <a aria-label="slide" data-cate="0" data-place="1197" href="https://www.thegioididong.com/flashsale" onclick="jQuery.ajax({url: 'https://www.thegioididong.com/bannertracking?bid=31089&amp;r=' + (new Date).getTime(), async: true, cache: false});">
                    <img style="cursor:pointer" src="https://cdn.tgdd.vn/2019/12/banner/1200-75-1200x75.png" alt="Giảm Sốc Online[break]Giảm Đến 49%" width="1200" height="75">
                </a>    
            </div>

        </div>
        <br/>
        <br/>
        <div class="container">
            <div class="owl-item active" style="width: 1024px;">
                <div style="padding:0px 0px 18px 0px;">
                    <a href="guitar.jsp" target="_blank">
                        <img src="https://images.fpt.shop/unsafe/fit-in/1200x80/filters:quality(90):fill(white)/cdn.fptshop.com.vn/Uploads/Originals/2019/12/13/637118477258101322_H5.png">
                    </a>
                </div>
            </div>
        </div>

        <br/> <br/>  
        
        
        
        
      
        
       

        
        
        
        
        
        
      
    
        
        
        
        
        
        
        
        
        
 

        <!--Phone--> 





        <div class="container">
            <div class="col-md-3 col-2">
                <a href="guitar.jsp"><img src="image/iphonexsmax.png" class="img-responsive" alt="">
                </a></div>
            <div class="col-md-3 col-p">
                <h5>Phone </h5>
                <p>Chúng tôi có rất nhiều những sản phẩm nổi tiếng từ các hãng lớn như Apple,SamSung...</p>
                <a href="guitar.jsp" class="shop" data-hover="Xem Ngay">Xem Ngay</a>
            </div>


            <div class="col-md-6 col-m2 animated wow fadeInRight" data-wow-delay=".1s">

                <link href="css/owl.carousel.css" rel="stylesheet">
                <script src="js/owl.carousel.js"></script>
                <script>
                    $(document).ready(function () {
                        $("#owl-demo").owlCarousel({
                            items: 2,
                            lazyLoad: false,
                            autoPlay: true,
                            navigation: true,
                            navigationText: true,
                            pagination: false,
                        });
                    });
                </script>
                <div id="owl-demo" class="owl-carousel">
                    <%
                        for (Product p : productGet.getListProductByCategory(Long.parseLong(category_id_4))) {
                    %>
                    <div class="item">					                	 

                        <a href="single.jsp?productID=<%=p.getProductID()%>"><img class="img-responsive" src="<%=p.getProductImageForward()%>" alt="" /></a>  
                        <a href="single.jsp?productID=<%=p.getProductID()%>" class="shop-2" >Xem Ngay</a>

                    </div>
                    <% } %>

                </div>
            </div>
            <div class="clearfix"></div>
        </div>	

        <br/>
        <hr/> 


        <!--banner quản cáo--> 

        <div class="container" style="display:flex ">

            <a aria-label="slide" data-cate="522" data-place="1210" href="guitar.jsp" onclick="jQuery.ajax({url: 'https://www.thegioididong.com/bannertracking?bid=32100&amp;r=' + (new Date).getTime(), async: true, cache: false});">
                <img style="cursor:pointer" src="https://cdn.tgdd.vn/2019/11/banner/sticky-galaxy-tab-a8-390x80-(1).png" alt="tab" width="390" height="80">
            </a>
            <a aria-label="slide" data-cate="522" data-place="1210" href="guitar.jsp" onclick="jQuery.ajax({url: 'https://www.thegioididong.com/bannertracking?bid=31869&amp;r=' + (new Date).getTime(), async: true, cache: false});">
                <img style="cursor:pointer" src="https://cdn.tgdd.vn/2019/11/banner/390-80-390x80-(7).png" alt="iphone" width="390" height="80">
            </a>
            <a target="_blank" href="guitar.jsp" title="Samsung H2">
                <img class="" style="height:80px" src="https://images.fpt.shop/unsafe/fit-in/385x88/filters:quality(90):fill(white)/cdn.fptshop.com.vn/Uploads/Originals/2019/12/13/637118333539143182_Banner-S10e-H2-2X.png" alt="Samsung H2">
            </a>
        </div>
        <br/> <br/>      

          <!--Tablet-->
          
          
          
        <div class="container">
            <div class="col-md-4 col-2" >
                <div   style="margin-top: 60px" >
                    <a href="guitar.jsp"><img style="height: 250px;width: 250;" src="image/iPadMini4(3).png" class="img-responsive" alt=""></a>
                </div>
                <br/>
                <br/>
                <div>
                    <h2 style="font-weight: 600">Tablet</h2>
                </div>
                <div>
                    <p > Máy tính bảng là vật dụng cần có của mỗi bạn trẻ năng động để phục vụ học tập, công việc và giải trí.</p>
                    <br/>

                    <a href="guitar.jsp" class="shop" data-hover="Xem Ngay">Xem Ngay</a>
                </div>
            </div>

            <div class="col-md-8 col-md2 animated wow fadeInRight" data-wow-delay=".1s">
                <%
                    for (Product p : productGet.getList3ProductByCategory(Long.parseLong(category_id_5))) {
                %>

                <div class="col-sm-4 item-grid simpleCart_shelfItem">
                    <div class="grid-pro">
                        <div  class=" grid-product " >
                            <figure>		
                                <a href="single.jsp?productID=<%=p.getProductID()%>">
                                    <div class="grid-img">
                                        <img  src="<%=p.getProductImageBack()%>" class="img-responsive" alt="">
                                    </div>
                                    <div class="grid-img">
                                        <img  src="<%=p.getProductImageForward()%>"  alt="" width="132%" height="180" class="img-responsive">
                                    </div>			
                                </a>		
                            </figure>	
                        </div>
                        <div class="women">
                            <h6><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h6>
                            <p><em class="item_price"><%=formatter.format(p.getProductPrice())%> VNĐ</em></p>
                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" data-text="Add Cart" class="but-hover1 item_add">Add Cart</a>
                        </div>
                    </div>
                </div>

                <%  } %>
                <div class="clearfix"></div>
            </div>
        </div>


        <!--banner quản cáo--> 



        <div class="container">
            <a aria-label="slide" data-cate="44" data-place="1210" href="https://www.thegioididong.com/laptop?g=laptop-gaming" onclick="jQuery.ajax({url: 'https://www.thegioididong.com/bannertracking?bid=32168&amp;r=' + (new Date).getTime(), async: true, cache: false});">
                <img style="cursor:pointer" src="https://cdn.tgdd.vn/2019/11/banner/390-80-390x80-(16).png" alt="laptop" width="390" height="80">
            </a>
            <a aria-label="slide" href="https://www.thegioididong.com/windows-ban-quyen#banquyen" onclick="jQuery.ajax({url: 'https://www.thegioididong.com/bannertracking?bid=31601&amp;r=' + (new Date).getTime(), async: true, cache: false});">
                <img style="cursor:pointer" src="//cdn.tgdd.vn/qcao/31_12_2018_19_01_50_sticky-390-80.png" alt="2018 - DE - Sticky Laptop" width="390" height="80">
            </a>
            <a target="_blank" href="https://fptshop.com.vn/ctkmhot/samsung" title="Samsung H2">
                <img class="" style="height:80px" src="https://images.fpt.shop/unsafe/fit-in/385x88/filters:quality(90):fill(white)/cdn.fptshop.com.vn/Uploads/Originals/2019/12/13/637118333539143182_Banner-S10e-H2-2X.png" alt="Samsung H2">
            </a>
        </div>



        <!--laptop-->


        <div class="container">
            <div class="col-md-8 col-md2 animated wow fadeInRight" data-wow-delay=".1s">
                <%
                    for (Product p : productGet.getList3ProductByCategory(Long.parseLong(category_id_1))) {
                %>
                <div class="col-sm-4 item-grid simpleCart_shelfItem">
                    <div class="grid-pro">
                        <div  class=" grid-product " >
                            <figure>		
                                <a href="single.jsp?productID=<%=p.getProductID()%>">
                                    <div class="grid-img">
                                        <img  src="<%=p.getProductImageBack()%>" class="img-responsive" alt="">
                                    </div>
                                    <div class="grid-img">
                                        <img  src="<%=p.getProductImageForward()%>"  alt="" width="132%" height="180" class="img-responsive">
                                    </div>			
                                </a>		
                            </figure>	
                        </div>
                        <div class="women">
                            <h6><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h6>
                            <p><em class="item_price"><%=formatter.format(p.getProductPrice())%> VNĐ</em></p>
                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" data-text="Add Cart" class="but-hover1 item_add">Add Cart</a>
                        </div>
                    </div>
                </div>

                <%  } %>
                <div class="clearfix"></div>
            </div>

            <div class="col-md-4 col-2" style="margin-top: 60px" >
                <div>
                    <a href="guitar.jsp"><img  style="height: 270px;width: 250;" src="image/zmv1531535477.png" class="img-responsive" alt=""></a>
                </div>
                <div> 
                    <h2 style="font-weight: 600">Laptop</h2>
                </div>
                <div>
                    <p >Chúng tôi có  những sản phẩm từ các hãng lớn như Apple,SamSung...</p>
                    <br/>
                    <a href="guitar.jsp" class="shop" data-hover="Xem Ngay">Xem Ngay</a>
                </div>
            </div>

        </div>



        <!--banner quản cáo--> 

        <div class="container" style="display: flex ">

            <a href="https://mediamart.vn/tivi/?chon=su-kien-1" target="_blank" rel="nofollow" onclick="jQuery.ajax({url: '/Gallery/Track?bannerid=4856', type: 'POST'});">
                <img alt="" src="https://cdn.mediamart.vn/Banner/kmss-mua-tv-to-gia-tv-nho-k2rR59-vq.jpg">

                <span style="display: none;" class="ad_esw_view_banner">Click: 283</span>
            </a>
            <a href="https://mediamart.vn/sony/" target="_blank" rel="nofollow" onclick="jQuery.ajax({url: '/Gallery/Track?bannerid=4432', type: 'POST'});">
                <img alt="" src="https://cdn.mediamart.vn/Banner/sony2-WnpA99-vq.png">

                <span style="display: none;" class="ad_esw_view_banner">Click: 1.153</span>
            </a>
            <a href="https://mediamart.vn/tivi/?chon=su-kien-1" target="_blank" rel="nofollow" onclick="jQuery.ajax({url: '/Gallery/Track?bannerid=4853', type: 'POST'});">
                <img alt="" src="https://cdn.mediamart.vn/Banner/ctkm-mua-tv-to-gia-tv-nho-bb0An6-vq.png">

                <span style="display: none;" class="ad_esw_view_banner">Click: 674</span>
            </a>

        </div>
        <br/> <br/>      





        <!--TV-->

        <div class="container">
            <div class="col-md-4 col-2" style="margin-top: -10px">
                <div>
                    <a href="guitar.jsp"><img src="image/sony-40w660e.jpg" class="img-responsive" alt=""></a>
                </div>
                <div>
                    <h2 style="font-weight: 600">TELEVISION</h2>
                </div>
                <div>
                    <p style="text-align: initial">Chúng tôi có  những sản phẩm từ các hãng lớn như Apple,SamSung...</p>
                    <br/>
                    <a href="guitar.jsp" class="shop" data-hover="Xem Ngay">Xem Ngay</a>
                </div>
            </div>


            <div class="col-md-8 col-md2 animated wow fadeInRight" data-wow-delay=".1s">
                <%
                    for (Product p : productGet.getList3ProductByCategory(Long.parseLong(category_id_6))) {
                %>

                <div class="col-sm-4 item-grid simpleCart_shelfItem" >
                    <div class="grid-pro">
                        <div  class=" grid-product " >
                            <figure >		
                                <a href="single.jsp?productID=<%=p.getProductID()%>">
                                    <div class="grid-img">
                                        <img  src="<%=p.getProductImageBack()%>" class="img-responsive" alt="">
                                    </div>
                                    <div class="grid-img">
                                        <img  src="<%=p.getProductImageForward()%>"  alt="" width="132%" height="180" class="img-responsive">
                                    </div>			
                                </a>		
                            </figure>	
                        </div>
                        <div class="women">

                            <h6><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h6>
                            <p><em class="item_price"><%=formatter.format(p.getProductPrice())%> VNĐ</em></p>
                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" data-text="Add Cart" class="but-hover1 item_add">Add Cart</a>
                        </div>
                    </div>
                </div>

                <%  }%>
                <div class="clearfix"></div>
            </div>

        </div>

    </body>
</html>
