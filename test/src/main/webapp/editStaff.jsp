<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page import="Minh.Config.DatabaseConfig"%>
<%@page import="Minh.Model.EmployeeModel"%>
<%@page import="Minh.Model.RoomModel"%>

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
    
    
        <style>
.edit-staff-container {
  display: flex;
  
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 2;
  justify-content: center;
  align-items: center;
}
.edit-staff-container .edit-staff-modal {
  width: 50%;
  height: 83%;
  background-color: white;
  color: black;
  padding: 4px 20px;
  border-radius: 4px;
  position: relative;
  animation: fadeIn ease 0.5s;
}
    </style>
    
</head>
<body>

    <div class="management-container">
      <div class="management-sidebar">
          <div style="cursor: pointer;" onclick="ToMenu()" class="management-sidebar-title">
              <i class="house-icon fa-solid fa-house fa-2x"></i>
              <span >Trang Quản Trị</span>
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
                <form action="${pageContext.request.servletContext.contextPath}/listStaffController?action=searchStaff" method="post">
                  <input type="text" placeholder="Tìm kiếm" name ="searchInput" style="border-radius: 17px; text-align: left;">
                  <i id = "search-icon" style="position: absolute; margin-left: -27px;color:cadetblue ; margin-top: 5.9px; cursor: pointer;" class="fa-solid fa-magnifying-glass"></i>
                  <input type=submit value="submit"> 
               </form>
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

            <!--thêm nhân viên-->
           
           <%
           		List<Employee> ls = (List)request.getAttribute("list");
           		Employee e = ls.get(0);
           %>
           
            <!-- Chỉnh sửa thông tin nhân viên -->
            <div class="edit-staff-container" >
                <div class="edit-staff-modal">
                <form action="listStaffController?action=edit" method="POST">
                    <a href ="homeController?action=listStaff"><i class="fa-solid fa-xmark icon-close"></i></a>
                    <div class="title">Chỉnh sửa thông tin</div>
                    <div class="content">
                    <div class="edit-staff-name">
                        <label for="edit-staff-name">Họ Tên</label>
                        <input type="text" id="edit-staff-name" name="edit-staff-name" value="<%= e.getEmployeeName() %>" />
                    </div>
        			<input type="hidden" name = "employeeId" value = "<%= e.getEmployeeID() %>"/>
                    <div class="edit-staff-gender">
                        <label for="edit-staff-gender">Giới Tính</label>
                        <input type="text" id="edit-staff-gender" name="edit-staff-gender" value="<%= e.getEmployeeGender() %>" />
                    </div>
                    <div class="edit-staff-date">
                        <label for="edit-staff-date">Ngày Sinh</label>
                        <input type ="number" name="edit-staff-date" id="edit-staff-date" value = "<%= e.getEmployeeAge() %>" />
                    </div>
                    <div class="edit-staff-address">
                        <label for="edit-staff-position">Địa chỉ</label>
                        <input type="text" name="edit-staff-address" id="edit-staff-address" value = "<%= e.getEmployeeAddress() %>"/>
                    </div>
                    <div class="edit-staff-phone">
                   		<label for="edit-staff-Phone">Số điện thoại</label>
                    	<input type ="text" name = "edit-staff-phone" id = "edit-staff-phone" value = "<%= e.getEmployeePhoneNumber()%>"/>
                    </div>
                    <div class="edit-staff-email">
                   		<label for="edit-staff-email">Email</label>
                    	<input type ="email" name = "edit-staff-email" id = "edit-staff-email" value = "<%= e.getEmployeeEmail()%>"/>
                    </div>
                    <input type="submit" value="Edit"/>
                    </div>
                </form>
                </div>
            </div>

            <!--Nhân viên-->
           
    </div>
    <script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"></script>
  
      <script src="/NMCNPM/Manager1/js/management.js"></script>
  </body>
</html>

