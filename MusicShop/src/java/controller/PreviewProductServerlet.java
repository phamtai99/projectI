/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author LUC UY
 */
public class PreviewProductServerlet extends HttpServlet {

   
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* TODO output your page here. You may use following sample code. */
      String name =request.getParameter("tenSanPham");
//        Product product;
//        product = new Product(
//                new Date().getTime(),
//                Long.parseLong(request.getParameter("maloai")),
//              ,
//                Long.parseLong(request.getParameter("mathuonghieu")),
//                request.getParameter("daidien"),
//                request.getParameter("mattruoc"),
//                request.getParameter("matsau"),
//                Long.parseLong(request.getParameter("gia")),
//                request.getParameter("mota")
//        );
        HttpSession session = request.getSession();
//        session.setAttribute("previewProduct", product);
        response.sendRedirect("/admin/preview_product.jsp");

    }


}
