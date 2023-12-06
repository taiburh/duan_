
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HTQ-BOOK</title>
  <link rel="stylesheet" href="view/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    
    .dropdown {
      position: relative;
      display: inline-block;
      text-align: center;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f1f1f1;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      z-index: 1;
      text-align: center;
    }

    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
      text-align: center;

    }

    .dropdown-content a:hover {
      background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    .avatar {
      vertical-align: middle;
      width: 50px;
      height: 50px;
      border-radius: 50%;
    }

    .container1 {
      display: flex;
      width: 100%;
    }

    .left-section {
      flex: 70%;
    }

    .right-section {
      flex: 30%;
    }
  </style>
</head>

<body>
  <div class="header">
    <div class="container">
      <div class="navbar">
        <div class="logo">
          <a href="index.php"><img src="view/images/logo.png" width="125px"></a>
        </div>
        <nav>
          <ul>
            <li><a href="index.php">Trang chủ</a></li>
            <li><a href="iindex.php">Sản phẩm</a></li>
            <div class="dropdown">
              <li><a href="">Danh mục</a></li>
              <div class="dropdown-content">
                <ul>
                  <?php
                  foreach ($dsdm as $dm) {
                    extract($dm);
                    $linkdm = "index.php?act=sanpham&iddm=" . $id;
                    echo '<li>
                                            <a href="' . $linkdm . '">' . $name . '</a>
                                         </li>';
                  }
                  ?>
                </ul>
                <form action="index.php?act=sanpham" method="post">
                  <input type="text" name="kyw" id="">
                  <button type="submit" name="timkiem">Tìm kiếm</button>
                </form>
              </div>
            </div>
            <li><a href="contact.php">Liên hệ</a></li>
            

            <?php
            if (isset($_SESSION['user'])) {
              extract($_SESSION['user']);
            ?>
            <li><a href="index.php?act=mybill">Đơn hàng của tôi</a></li>
              <li class="dropdown"><img src="view/images/user.svg" height="27px" width="27px" class="Avatar" alt="avatar">
                <ul class="dropdown-content">
                  <?php if ($role == 2) { ?>
                    <li><a href="admin/index.php">Đăng nhập Admin</a></li>
                  <?php } ?>
                  <li><a href="index.php?act=capnhattaikhoan">Cập nhật tài khoản</a></li>
                  <li><a href="index.php?act=thoat">Thoát</a></li>
                </ul>
              </li>
            <?php
            } else {
            ?>
              <li><a href="index.php?act=dangnhap">Đăng nhập</a></li>
            <?php } ?>

          </ul>
        </nav>
        <a href="index.php?act=addtocart"><img src="view/images/cart.png" width="30px" height="30px"></a>
        <img src="view/images/menu.png" class="menu-icon" onclick="menutoggle()">
      </div>