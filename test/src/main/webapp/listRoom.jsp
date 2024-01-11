<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản Trị Khách Sạn</title>
    <link rel="stylesheet" href="/NMCNPM/Manager/css/management.css">
    <link rel="stylesheet" href="/NMCNPM/Manager/fontawesome-free-6.5.1-web/css/all.min.css">
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
                                <th style="width: 10%">ID Phòng</th>
                                <th style="width: 10%">Tên phòng</th>
                                <th style="width: 10%">Loại phòng</th>
                                <th style="width: 5%">Số lượng</th>
                                <th style="width: 25%">Thông tin</th>
                                <th style="width: 25%">Giá phòng</th>
                                <th style="width: 5%">Trạng thái</th>
                                <th style="width: 5%">Hành động</th>
                            </tr>
                            <<tr class="room" data-room-index="${index}">
                                    <button class="btn-edit-room" onclick="handleEditRoom(${index})">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <button class="btn-delete-room" onclick="handleDeleteRoom(${index})">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
           
           

            
            <!-- Thêm Phòng Mới -->
            <div class="add-room-container">
                <div class="add-room-modal">
                <form action="" method="POST">
                    <i class="fa-solid fa-xmark icon-close" onclick="closeAddRoomModal()"></i>
                    <div class="title">Tạo phòng mới</div>
                    <div class="content">
                    <div class="room-name">
                        <label for="room-name">Tên phòng</label>
                        <input type="text" id="room-name" name="room-name" />
                    </div>
                    <div class="room-image">
                        <label for="room-image">Link hình ảnh</label>
                        <input type="text" id="room-image" name="room-image" />
                    </div>
                    <div class="room-type">
                        <label for="room-type">Loại phòng</label>
                        <input type="text" id="room-type" name="room-type" />
                    </div>
                    <div class="room-description">
                        <label for="room-description">Mô tả</label>
                        <textarea name="room-description" id="room-description">
                        </textarea>
                    </div>
                    <div class="room-price">
                        <label for="room-price">Giá</label>
                        <input type="text" name="room-price" id="room-price" />
                    </div>
                    <div class="btn-submit btn btn-primary" onclick="AddRoom()">Tạo mới</div>
                    </div>
                </form>
                </div>
            </div>

            <!-- Chỉnh sửa thông tin phòng -->
            <div class="edit-room-container">
                <div class="edit-room-modal">
                    <form action="" method="POST">
                        <i class="fa-solid fa-xmark icon-close"></i>
                        <div class="title">Chỉnh Sửa</div>
                        <div class="content">
                        <div class="edit-room-name">
                            <label for="edit-room-name">Tên phòng</label>
                            <input type="text" id="edit-room-name" name="edit-room-name" />
                        </div>
                        <div class="edit-room-image">
                            <label for="edit-room-image">Link hình ảnh</label>
                            <input type="text" id="edit-room-image" name="edit-room-image" />
                        </div>
                        <div class="edit-room-type">
                            <label for="edit-room-type">Loại phòng</label>
                            <input type="text" id="edit-room-type" name="edit-room-type" />
                        </div>
                        <div class="edit-room-description">
                            <label for="edit-room-description">Mô tả</label>
                            <textarea name="edit-room-description" id="edit-room-description">
                            </textarea>
                        </div>
                        <div class="edit-room-price">
                            <label for="edit-room-price">Giá</label>
                            <input type="text" name="edit-room-price" id="edit-room-price" />
                        </div>
                        <div class="btn-submit btn btn-primary" >Cập Nhập</div>
                        </div>
                    </form>
                </div>
            </div>
    </div>
    <script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"></script>
  
      <script src="/NMCNPM/Manager/js/management.js"></script>  </body>
</html>