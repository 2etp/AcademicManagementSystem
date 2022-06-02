<!-- <link rel="stylesheet" href="main_view_list.css"> -->


<div class="lst db">
            <ul>
                <?php 
                    if($view){
                      $sql = "SELECT * FROM g5_write_0101 WHERE wr_is_comment = 0  and wr_1 like '%".$view."%' order by wr_id desc limit 8 ";
                      $result = sql_query($sql);
                    }else{
//                      $sql = "SELECT * FROM g5_write_0101 WHERE wr_is_comment = 0 order by rand() limit 8 ";
//                      $result = sql_query($sql);
                      $sql = "SELECT * FROM g5_write_0101 WHERE wr_is_comment = 0  and wr_1 like '%".$lst['wr_1']."%' order by wr_id desc limit 8  ";
                      $result = sql_query($sql);
                    }
                    { 
                        ?>
                        <?php 
                        
                            for($i=0; $row=sql_fetch_array($result); $i++){                 
                        ?>
                        <?php 
                          $write = get_thumbnail_find_cache('0101', $row['wr_id'], 'content');
                          $edt = true;
                          
                          // get_editor_image : 에디터상에서 입력한 이미지 가져오기 함수
                          // DHTML편집기로 작성된 wr_content를 넘겨주면 정규식을 이용해서 img 소스를 추출해 줌
                          // 두번째 인수를 false로 하면 url만, true로 하면 img tag 자체를 리턴해 줌
                          if( $matches = get_editor_image($write['wr_content'], false) ){
                              for($i=0; $i<count($matches[1]); $i++)
                              {
                                  // 이미지 path 구함
                                  // strops : 문자열이 처음 나타나는 위치를 찾는 함수
                                  $p = parse_url($matches[1][$i]);
                                  if(strpos($p['path'], '/'.G5_DATA_DIR.'/') != 0)
                                      $data_path = preg_replace('/^\/.*\/'.G5_DATA_DIR.'/', '/'.G5_DATA_DIR, $p['path']);
                                  else
                                      $data_path = $p['path'];
                  
                                  $srcfile = G5_PATH.$data_path;
                  
                                  if(preg_match("/\.({$config['cf_image_extension']})$/i", $srcfile) && is_file($srcfile)) {
                                      $size = @getimagesize($srcfile);
                                      if(empty($size))
                                          continue;
                  
                                      $filename = basename($srcfile);
                                      $filepath = dirname($srcfile);
                  
                                      preg_match("/alt=[\"\']?([^\"\']*)[\"\']?/", $matches[0][$i], $malt);
                                      $alt = isset($malt[1]) ? get_text($malt[1]) : '';
                  
                                      break;
                                  }
                  
                                  $filename = run_replace('get_editor_filename', $filename, $p);
                              }   //end for
                          } 
                          $thumb = get_list_thumbnail('0101', $row['wr_id'], '400', '400', false, true);
                        ?>
                            <?php 
                                $qry = "select * from follow where mem_id = '".$member['mb_id']."' and target_mem_id='".$row['mb_id']."' ";
                                $check = sql_fetch($qry);

                                $sql_member = " SELECT * FROM g5_member WHERE mb_id = '".$row['mb_id']."' ";
                                $row_member = sql_fetch($sql_member);
                            ?>
                            <li class="v_slide <?php if(count($matches[1])>1) echo "lot_ico" ?>">
                                <div class="bd_lst_profile">
                                    <div class="img">
                                        <!-- 와꾸 이미지 불러오기 -->
                                        <form action="<?=G5_SHOP_URL?>/feed.php" method="post">
                                            <input type="hidden" name="user_name" value="<?=$row_member['mb_nick']?>">
                                            <input type="hidden" name="user_id" value="<?=$row_member['mb_id']?>">
                                            <button type="submit" onclick="javascript: form.action='<?=G5_SHOP_URL?>/feed.php';"><?php echo get_member_profile_img($row_member['mb_id']); ?></button>
                                        </form>
                                        <!-- <a class="pc_pro_btn js_pro_btn_user"></a> -->
                                    </div>
                                    <div class="txt_box">
                                        <div class="name_line">
                                            
                                            <a href="/bbs/board.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" class="t1 tov"><?php echo $row_member['mb_nick'] ?></a>
                                            <!-- 팔로우 -->
                                            <button type="button" class="js_test lst_f" onclick="go_flow('<?=$row['mb_id']?>',<?=$i?>);" id="js_test_<?=$i?>" name="js_test_<?=$i?>" style="<?if(!$check['fol_id']){?>color:#ff4a4a<?}else{?><?}?>"><?if(!$check['fol_id']){?>팔로우<?}else{?>팔로잉<?}?></button>
                                            <!-- act클래스 추가 -->
                                        </div>
                                        <p class="t2 tov"><?=$row_member['mb_profile']?></p>
                                    </div>
                                </div>
                                <div class="bg">
                                    <!-- 이미지 링크 클릭 기능 -->
                                    <a href="/bbs/board.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" class="wrap">

                                        <div id="show">
                                            <div class="img">
                                                <?php 

                                                    $thumb = get_list_thumbnail('0101', $row['wr_id'], '400', '400', false, true);

                                                    if($thumb['src']) {
                                                        $img_content = '<img src="'.$thumb['src'].'" alt="'.$thumb['alt'].'" >';
                                                    } else {
                                                        $img_content = '<span class="no_image abs"></span>';
                                                    }
                                                    // 이미지 display
                                                    // run_replace : 변경 내용 적용 함수
                                                    echo run_replace('thumb_image_tag', $img_content, $thumb);
                                                    
                                                ?>
                                            </div>
                                        </div>
                                    </a>
                                        
                                        <!-- 이미지 모달창 띄우기 -->
                                        <div class="background">
                                            <div class="window">
                                                <div class="popup">
                                                    <div class="modal_size">
                                                        <button id="close">팝업닫기</button>
                                                        <?php
                                                            
                                                                echo $write['wr_content'];
                                                                echo $write['wr_3'];
                                                                echo $write['wr_name'];
                                                                                                       
                                                        ?>
                                                        
                                                    </div>
                                                </div>                                             
                                            </div>
                                        </div>

                                <div class="gall_ico_line cb">
                                        <!-- 좋아요 체크 -->
                                    
                                        <?php 
                                            $qry2 = " select * from g5_board_good where wr_id = '".$row['wr_id']."' and bo_table = '0101' and mb_id = '".$member['mb_id']."' ";
                                            $row2 = sql_fetch($qry2);
                                            {
                                        ?>

                                        <button type="button" class="js_good_<?=$row['wr_id']?> fl" onclick="go_good('<?=$member['mb_id']?>','<?=$row['wr_id']?>','0101','<?=$row['wr_id']?>','<?=$row['wr_good']?>');" id="js_good_<?=$i?>" name="js_good_<?=$i?>"><span class="heart fl txt <?php if(count($row2)>= 1 and $row2['mb_id'] == $member['mb_id']) echo "act"?>"> <span class="num"><?=$row['wr_good']?></span></span></button>

                                        <!-- 좋아요 버튼 -->
                                            <script>
                                                function go_good(mb_id , wr_id, bd ,i,good){
                                                    <?php if(!$member['mb_id']){ ?>
                                                        alert('로그인 후 이용 바랍니다.');
                                                    <?}else{?>
                                                            var str = good;
                                                            str = parseInt(good);
                                                            str_p = str + 1;
                                                            str_d = str_p - 1;

                                                            $.ajax({
                                                                url:'/bbs/ajax.good.php',
                                                                data : {
                                                                    'mb_id':mb_id , 
                                                                    'wr_id':wr_id , 
                                                                    'bd':bd,
                                                                    },
                                                                type:'POST',
                                                                dataType:'json',
                                                                success:function(data){
                                                                    if(data == 1){
                                                                        $(".js_good_"+i).find(".num").text(str_p);
                                                                        $(".js_good_"+i).find("span").addClass('act');

                                                                    }else if(data == 2){
                                                                        $(".js_good_"+i).find(".num").text(str_d);
                                                                        $(".js_good_"+i).find("span").removeClass('act');
                                                                        location.reload();
                                                                    }
                                                                },error:function(request,status,error){
                                    //                                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                                                }
                                                            });

                                                    <?}?>
                                                }

                                            </script>

                                        <?php } ?>
                                        <!-- 좋아요 체크 끝 -->

                                        <a href="/bbs/board.php?bo_table=0101&wr_id=<?=$row['wr_id']?>"><span class="comment fl txt"><?=$row['wr_comment']?><?php if($row['wr_comment'] > 9999) echo "+" ?></span></a>
                                        <?php
                                        //스크랩 sql

                                        $sql3 = " select count(*) as cnt from {$g5['scrap_table']}
                                        where mb_id = '{$member['mb_id']}'
                                        and bo_table = '0101'
                                        and wr_id = '{$row['wr_id']}' ";
                                            $row3 = sql_fetch($sql3);
                                            {
                                            if ($row3['cnt']) {
                                            
                                        ?>
                                        <a href="<?=G5_BBS_URL?>/scrap_popin.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" target="_blank" onclick="win_scrap(this.href); return false;" class="cut fr txt <?php if ($row3['cnt']) echo "act" ?> "></a>
                                            <?php }else{ ?>
                                        <a href="<?=G5_BBS_URL?>/scrap_popin.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" target="_blank" onclick="win_scrap(this.href); return false;" class="cut fr txt "></a>
                                            <?php } ?>
                                        <?php } ?>
                                   </div>

                                   <div class="gall_text_href">
                                        
                                        <p class="tov3"><?php echo utf8_strcut(strip_tags($row['wr_content']), 78, '..'); ?><?php if($row['wr_3']) echo $row['wr_3'] ?></p>
                                    </div>
                              
                            </li>
                        <?php } ?>
                <?php } ?>
            </ul>
            <a href="/bbs/board.php?bo_table=0101" class="main_more">더보기</a>
        </div>



        <script>
					function go_flow(mb_id , i){
						<?php if(!$member['mb_id']){ ?>
							alert('로그인 후 이용 바랍니다.');
						<?}else{?>
//							alert(mb_id);
							if(mb_id == "<?=$member['mb_id']?>"){
								alert('자기 자신은 팔로우 할수 없습니다.');
							}else{
								$.ajax({
									url:'/bbs/ajax.follow.php',
									data : {
										'mb_id':mb_id , 
										},
									type:'POST',
									dataType:'json',
									success:function(data){
										if(data == 1){
											alert("팔로우되었습니다");
											$("#js_test_"+i).text('팔로잉');
										}else if(data == 2){
											alert("팔로우 가 취소 되었습니다");
											$("#js_test_"+i).text('팔로우');
										}
									},error:function(request,status,error){
		//                                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									}
								});
							}
						<?}?>
					}

                    // 밑의 소스들은 이미지 리스트 클릭 시, 모달창 띄우는 기능임
                    const modalopen = document.querySelectorAll(".wrap");
                    const modal = document.querySelector(".background");
                    const modalclose = document.querySelector("close");

                    for(let i = 0; i <modalopen.length; ++i) {
                        modalopen[i].addEventListener("click", show);
                    }

                    function show (event) {
                        event.preventDefault();
                        document.querySelector(".background").className = "background show";
                        }

                    function close(event) {
                        event.preventDefault();
                        document.querySelector(".background").className = "background";
                        
                        }

                    //document.querySelector("#show").addEventListener("click", show);
                    document.querySelector("#close").addEventListener("click", close);

                    // const modalopen = document.querySelectorAll(".wrap");
                    // const modal = document.querySelector(".background");
                    // const modalclose = document.querySelector("close");

                    // for(let i=0; i < modalopen.length; i++){
                    //     modalopen[i].addEventListener("click", openmodal);
                    // }


                    // function openmodal(event){
                    // event.preventDefault();
                    // modal.classList.remove("inactive");
                    // modalclose.addEventListener("click", closemodal);
                    // };



                    // function closemodal(event){
                    // event.preventDefault();
                    // modal.classList.add("inactive");
                    // }
         </script>