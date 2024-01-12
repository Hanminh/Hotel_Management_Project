<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DAO.RoomDAO"%>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="UTF-8">
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

      
            <!-- Hiển thị danh sách phòng -->
            <div class="management-content-container list-room">
                <div class="title">Danh sách các phòng</div>
                <div class="management-content">
                    <div class="add-room">
                        <button class="btn-add-room" onclick="handleAddRoom()">
                            <i class="fa-solid fa-plus"></i>
                        Tạo mới
                        </button>
                    </div>
                    <div class="rooms">
                        <table style="width: 100%">	
                             <tr >
                                <th style="width: 5%">STT</th>
                                <th style="width: 5%">ID phòng</th>
                                <th style="width: 10%">Tên phòng</th>
                                <th style="width: 10%">Loại phòng</th>
                                <th style="width: 10%">Số lượng</th>
                                <th style="width: 20%">Thông tin</th>
                                <th style="width: 20%">Giá phòng</th>
                                <th style="width: 10%">Trạng thái</th>
                                <th style="width: 5%">Edit</th>
                                <th style="width: 5%">Delete</th>
                            </tr>
							<tr>
								<% RoomDAO roomDAO = new RoomDAO(); %>
                            <% ArrayList<Room> roomList = (ArrayList<Room>)roomDAO.selectAll();
                            int count = 1;
                            if (roomList != null){
                            	for(Room room : roomList){
                            %>
                            <tr class="room" data-room-index="${index}">
                            <td><%= count %></td>
                            <td><%= room.getRoomID() %></td>
                            <td><%= room.getRoomName()%></td>
                            <td><%= room.getRoomType()%></td>
                            <td><%= room.getRoomAmount()%></td>
                            <td><%= room.getRoomDescription()%></td>
                            <td><%= room.getRoomPrice()%></td>
                            <td><%= room.getRoomStatus()%></td>
                            <% out.print("<td>");
                        		out.print("<a href=" +request.getContextPath()+"/RoomController?action=edit&id="+room.getRoomID()+">");
                        		out.print("<button class=\"btn-edit-room\" style=\"width: 30px; height: 30px; background-color: #0076ff; color: white; border: none; border-radius: 4px;\">"); // Adjusted style
                        		out.print("<i class=\"fa-solid fa-pen\"></i>");
                        		out.print("</button>");
                        		out.print("</a>");
                        		out.print("</td>");
                        		out.print("<td>");
                        		out.print("<a href=" + request.getContextPath() + "/RoomController?action=delete&id="+room.getRoomID()+">");
                        		out.print("<button class=\"btn-delete-room\" style=\"width: 30px; height: 30px; background-color: #d13d3c; color: white; border: none; border-radius: 4px;\">"); // Add color: red
                        		out.print("<i class=\"fa-solid fa-trash\"></i>");
                        		out.print("</button>");
                        		out.print("</a>");
                        		out.print("</td>");
                        		out.print("</tr>");
                        		%>
                             <% 	count++;
                            	}
                             }else {
                            	 out.println("Danh sách rỗng");
                             }
                            %>		
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
           
            <!-- Chỉnh sửa thông tin phòng -->
            <%
            	Room r = new RoomDAO().selectById(request.getParameter("id"));
            %>
            <div class="edit-room-container" style="display: flex">
                <div class="edit-room-modal">
                    <form action="AddRoom" method="POST">
                    <a href="RoomController?action=listRoom"> <i class="fa-solid fa-xmark icon-close"></i></a>
                    <div class="title">Tạo phòng mới</div>
                    <div class="content">
                    
                    <div style="margin-top:5px;" class="room-id">
                        <label for="room-image">ID</label>
                        <h1></h1> <%= r.getRoomID() %>
                    </div>
                    
                    <div style="margin-top:5px;"  class="room-name">
                        <label for="room-name">Tên phòng</label>
                        <input type="text" id="room-name" name="room-name" value = "<%= r.getRoomName() %>" />
                    </div>
                  
                    <div style="margin-top:5px;"  class="room-amount">
                    	<div style="display: inline;" class="room-type">
	                        <label for="room-type">Loại phòng</label>
	                        <select style="width: 150px; height: 30px; border-radius: 4px;" id="roomType" name="roomType" >
	                        	<option value = "Executive" > Phòng Executive </option>
	                        	<option value = "Deluxe" > Phòng Deluxe </option>
	                        	<option value = "Standard" > Phòng Standard </option>
	                        	<option value = "Superior" > Phòng Superior </option>
	                        </select>
           				</div>
           				<div  style="display: inline;  margin-left:40px" class = "room-amount">
           					<label for="room-amount">Số lượng người</label>
                        	<select  style="width: 35px; height: 30px; border-radius: 4px;" id = "roomAmount" name = "roomAmount">
	                        	<option value = "1" > 1 </option>
	                        	<option value = "2" > 2 </option>
	                        	<option value = "3" > 3 </option>
	                        	<option value = "4" > 4 </option>
	                        </select>
           				</div>
           				<div  style="display: inline;  margin-left:40px" class = "room-amount">
           					<label for="room-amount">Trạng thái phòng</label>
                        	<select  style="width: 100px; height: 30px; border-radius: 4px;" id = "roomStatus" name = "roomStatus">
	                        	<option value = "Avaliable" > Còn trống </option>
	                        	<option value = "Unavaliable" > Đã đặt </option>
	                        </select>
           				</div>
                    </div> 
                    <div style="margin-top:5px;"  class="room-description">
                        <label for="room-description">Mô tả</label>
                        <input name="room-description" id="room-description" value ="<%= r.getRoomDescription()%>"/>
                        
                    </div>
                
                    <div style="margin-top:5px;"  class="room-price">
                        <label for="room-price">Giá</label>
                        <input type="text" name="room-price" id="room-price" value = "<%= r.getRoomPrice() %>" />
                    </div>
                    <button  type ="submit"> Update </button>
                    </div>
                </form>
                </div>
            </div>
         </div>
    <script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"></script>
    <script>
    document.querySelector(".account").addEventListener("click", function() {
        window.location.href = "homeController?action=admin";
    });
    </script>
  
      <script src="/NMCNPM/Manager1/js/management.js"></script>  </body>
</html>