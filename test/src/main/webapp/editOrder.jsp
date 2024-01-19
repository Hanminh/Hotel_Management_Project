<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import = "DAO.OrderDAO" %>
   <%@page import = "java.util.ArrayList" %>
   <%@page import = "model.Order" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản Trị Khách Sạn</title>
    <link rel="stylesheet" href="/NMCNPM/Manager1/css/management.css">
    <link rel="stylesheet" href="/NMCNPM/Manager1/fontawesome-free-6.5.1-web/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>
 <body>

    <div class="management-container">
      <div class="management-sidebar">
          <div style="cursor: pointer;" onclick="ToMenu()" class="management-sidebar-title">
              <i class="house-icon fa-solid fa-house fa-2x"></i>
              <span > Trang Quản Trị</span>
          </div>
          <div class="management-sidebar-content">
              <div class="management-sidebar-list">
                  <ul>
                      <li class="post">
                        
                          <i class="fa-brands fa-wpforms"></i>
                          <span>Bài Viết</span>
                      </li>

                      <li class="list-room">
                          <i class="fa-solid fa-bars"></i>
                          <span>Danh Sách Phòng</span>
                      </li>

                      <li class="list-book-room">
                          <i id="a1" class="fa-solid fa-cart-plus"></i>
                          <span>Các Phòng Đặt</span>
                      </li>

                      <li class="list-staff">
                          <i class="fa-solid fa-clipboard-user"></i>
                          <span>Nhân Viên</span>
                      </li>

                      <li class="account">
                          <i class="fa-solid fa-user-tie"></i>
                          <span>Tài Khoản</span>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
      <div class="management-side">
          <div class="management-sidebar-header">
              <div class="header-search">
              </div>
              <div class="header-search-icon" style="position: absolute; margin-left: 5%;">
                  <input type="text" placeholder="Tìm kiếm" style="border-radius: 17px; text-align: left;">
                  <i style="position: absolute; margin-left: -27px;color:cadetblue ; margin-top: 5.9px; cursor: pointer;" class="fa-solid fa-magnifying-glass"></i>
                  
              </div>
              <div class="notice">
                  <i class="fa-solid fa-bell"></i>
                  <i class="fa-regular fa-message"></i>
              </div>
              <div class="admin" id="adminInfoTrigger">
                  <div class="management-sidebar-avatar"></div>
                  <span id="a1">Admin</span>
                  <i class="fa-solid fa-caret-down"></i> 
                  <div class="admin-info">
                      <div class="admin-info-item" style="font-size: 20px; color:black ; ">
                          Vũ Trần Hoàng
                      </div>
                      <div class="admin-info-item" style="font-size: 20px; color:black ; ">
                          Hoangtop8
                      </div>
                      <div class="admin-info-item" style="font-size: 15px; color:black">
                          Hoang@gmail.com
                      </div>
                      <div class="admin-info-icons">
                          <i class="fa-brands fa-facebook"></i>
                          <i class="fa-brands fa-instagram"></i>
                          <i class="fa-solid fa-phone"></i>
                      </div>
                  </div>
                  
              </div>
          </div>
      </div>
      
      	<%
      		Order o = new OrderDAO().selectById(request.getParameter("id"));
      	%>
     
            <!-- Chỉnh sửa thông tin đặt phòng -->
            <div class="edit-book-room-container">
                <div class="edit-book-room-modal">
                    <form action="RoomOrderController?action=update" method="POST">
                    <a href="RoomOrderController?action=listOrder">  <i class="fa-solid fa-xmark icon-close"></i></a>
                       <input type="hidden" name = "id" value = "<%= o.getOrderID() %>" >
                        <div class="title">Chỉnh Sửa</div>
                        <div class="content">
                        <div>
                        	<h1 style=" diplay:inline; color: green; font-size: 20px; ">ID Order: <%= o.getOrderID() %> </h1>
                        </div>
                         <div class="edit-room-name">
                            <label for="edit-room-name">ID phòng</label>
                            <input type="text" id="edit-room-name" name="room-id" value = "<%= o.getRoomID()%>"/>
                        </div>
                         <div class="edit-room-name">
                            <label for="edit-room-name">Tên khách hàng</label>
                            <input type="text" id="edit-room-name" name="customer-name" value = "<%= o.getCustomerName() %>" />
                        </div>
                         <div class="edit-room-name">
                            <label for="edit-room-name">CCCD</label>
                            <input type="text" id="edit-room-name" name="cccd" value = "<%= o.getCustomerCitizenID() %>"/>
                        </div>
                         <div class="edit-room-name">
                            <label for="edit-room-name">Phone</label>
                            <input type="text" id="edit-room-name" name="phone" value = "<%= o.getCustomerPhoneNumber() %>" />
                        </div>
                        <div class="edit-room-name">
                            <label for="edit-room-name">Ngày nhận phòng</label>
                            <input type="date" id="edit-room-name" name="indate" value = "<%= o.getTimeStart() %>"/>
                        </div>
                          <div class="edit-room-name">
                            <label for="edit-room-name">Ngày trả phòng</label>
                            <input type="date" id="edit-room-name" name="outdate" value = "<%= o.getTimeEnd() %>" />
                        </div>
                         <div class="edit-room-name">
                            <label for="edit-room-name">Tổng tiền</label>
                            <input type="text" id="edit-room-name" name="price" value = "<%= o.getOrderPrice() %>"/>
                        </div>
                        <div style="display: inline;" class="room-type">
	                        <label for="room-type">Trạng thái</label>
	                        <select style="width: 150px; height: 30px; border-radius: 4px;" id="roomType" name="orderStatus" >
	                        	<option value = "Executive" > Pending</option>
	                        	<option value = "Deluxe" > Confirmed </option>
	                        	
	                        </select>
           				</div>
                        
                     
                        
                        <div  >
                             <input type="submit" value="Cập nhật"> 
                        </div>
                        </div>
                    </form>
                </div>
            </div>
      
     
       <!-- Danh sách đơn đặt phòng -->
        <div class="management-content-container list-book-room ">
            <div class="title">Danh sách đơn đặt phòng</div>
            <div class="search">
            <form action = "../FindOrder" method = "GET">
              <input
                type="text"
                id="search"
                name="search"
                placeholder="Nhập mã đặt phòng"
              />
              <button class="btn-search" type ="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
                Tìm kiếm
              </button>
              </form>
            </div>
            <div class="management-content">
              <div class="rooms">
                <table id="bb" style="width: 100%">
                  <tr>
                    <th style="width: 5%">STT</th>
                     <th style="width: 10%">Mã đặt phòng</th>
                    <th style="width: 10%">Tên phòng</th>
                    <th style="width: 25%">Tên khách hàng</th>
                    <th style="width: 30%">Thông tin phòng</th>
                   
                    <th style="width: 10%">Trạng thái</th>
                    <th style="width: 5%">Edit</th>
                    <th style="width: 5%">Delete</th>
                  </tr>
                  <%
           		int stt=1;
           		ArrayList<Order> list = new OrderDAO().selectAll();
           		if(list != null){
	           		for(Order od : list){%>
	           			<tr class="book-room">
	           			
	           			<td><%= stt %></td>
	           			<td><%= od.getOrderID()%></td>
	           			<td><%= od.getRoomID()%></td>
	           			
		           			<td style="text-align: left">
		           			<ul>
		           			<li><span>Tên:</span><%= od.getCustomerName()%></li>
		           			<li><span>CCCD:</span>><%= od.getCustomerCitizenID()%></li>
		           			<li><span>Phone:</span><%= od.getCustomerPhoneNumber() %></li>
		           			</ul>
			            	</td>
			            	
			            	<td style="text-align: left">
		           			<ul>
		           			<li><span>Ngày nhận phòng:</span><%= od.getTimeStart() %></li>
		           			<li><span>Ngày trả phòng:</span><%= od.getTimeEnd() %></li>
		           			<li><span>Tổng tiền:</span><%= od.getOrderPrice() %></li>
		           			</ul>
			            	</td>
			            	

			            	<td><%= od.getOrderStatus() %></td>
			            	
<!-- 			            	<td>
			                <button class="btn-edit-room" onclick="handleEditBookRoom()"> 
			                <i class="fa-solid fa-pen"></i>
			              	</button>
			              	<button class="btn-delete-room" >
			                <i class="fa-solid fa-trash" ></i>
			              	</button>
			            	</td> -->
			            	<% 
			            	out.print("<td>");
                        		out.print("<a href=" + request.getContextPath() + "/RoomOrderController?action=edit&id=" + od.getOrderID() + " class=\"btn-link\" onclick=\"handleEditRoom(" + od.getOrderID() + ")\">");
                        		out.print("<button class=\"btn-edit-room\" style=\"width: 30px; height: 30px; background-color: #0076ff; color: white; border: none; border-radius: 4px;\">"); // Adjusted style
                        		out.print("<i class=\"fa-solid fa-pen\"></i>");
                        		out.print("</button>");
                        		out.print("</a>");
                        		out.print("</td>");


                        		out.print("<td>");
                        		out.print("<a href=" + request.getContextPath() + "/RoomOrderController?action=delete&id=" + od.getOrderID() + " class=\"btn-link\" onclick=\"handleDeleteRoom(" + od.getOrderID() + ")\">");
                        		out.print("<button class=\"btn-delete-room\" style=\"width: 30px; height: 30px; background-color: #d13d3c; color: white; border: none; border-radius: 4px;\">"); // Add color: red
                        		out.print("<i class=\"fa-solid fa-trash\"></i>");
                        		out.print("</button>");
                        		out.print("</a>");
                        		out.print("</td>");

                        		out.print("</tr>");
                        		%>
	           			</tr>
	           			<% stt++; 
           			}
           		}
           %>
                </table>
             
              </div>
            </div>
        </div>
        
        
        
    </div>
    <script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"></script>
  
            <script src="/NMCNPM/Manager1/js/management.js"></script>
  </body>
</html>