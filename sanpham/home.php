<div class="header1">
    <div class="small-container">

        <div class="row row-2">
            <h2>Tất cả sản phẩm</h2>
            <select>
                <option>Mặc định</option>
                <option>Giá cao-->thấp</option>
                <option>Giá thấp-->cao</option>
                <option>Phổ biến</option>
                <option>Bán chạy nhất</option>
            </select>
        </div>

        <div class="row">
            <?php
            $i = 0;
            foreach ($spneww as $sp) {
                extract($sp);
                $linksp = "index.php?act=sanphamct&idsp=" . $id;
                $img = $img_path . $img;
                if (($i == 3) || ($i == 7) || ($i == 11) || ($i == 15)) {
                    $mr = "";
                } else {
                    $mr = "mr";
                }

                echo '<div class="col-4 ' . $mr . '">
                           <a  href="' . $linksp . '"><img src="' . $img . '" style="height:200px;"></a>
                           <a href="' . $linksp . '">' . $namesp . '</a>
                           <div class="rating">
                               <i class="fa fa-star"></i>
                               <i class="fa fa-star"></i>
                               <i class="fa fa-star"></i>
                               <i class="fa fa-star"></i>
                               <i class="fa fa-star-o"></i>
                            </div>
                            <p>$' . $price . ' Vnd</p>
                            
                            
                           <div class="row btnaddtocart">
                               <form action="index.php?act=addtocart" method="post">
                                  <input type="hidden" name="id" value="' . $id . '">
                                  <input type="hidden" name="name" value="' . $namesp . '">
                                  <input type="hidden" name="img" value="' . $img . '">
                                  <input type="hidden" name="price" value="' . $price . '">
                                  <input type="submit" class="btn btn-success" name="addtocart" value="Thêm vào giỏ hàng">
                                </form>
                           </div>
                          </div>';
                $i += 1;
            }
            ?>
        </div>
    </div>