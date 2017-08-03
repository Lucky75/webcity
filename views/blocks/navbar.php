<div id="navbar">
    <nav class="navbar navbar-inverse navbar-fixed-top">
     <div class="container-fluid">
          <!-- Классы navbar и navbar-default (базовые классы меню) -->
      <nav class="navbar navbar-inverse">
            <!-- Контейнер (определяет ширину Navbar) -->
          <div class="container-fluid">
              <!-- Заголовок -->
              <div class="navbar-header">
                <!-- Кнопка «Гамбургер» отображается только в мобильном виде (предназначена для открытия основного содержимого Navbar) -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-main" aria-expanded="false">
                  <span class=sr-only>Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <!-- Бренд или название сайта (отображается в левой части меню) -->
                <div class="col-md-6">
                  <a class="navbar-brand" href="index.php">            
                  <img src="img/logo.png" class="img-responsive" alt="">
                  </a>
                </div>
              </div>
            <div class="collapse navbar-collapse" id="navbar-main">
                <!-- Содержимое основной части -->
                <ol class="nav navbar-nav">         
                  <div class="col-xs-6 col-md-4"> 
                     <div class="form-group">   
                       <div class="btn-group">
                            <button type="button" class="btn btn-default">
                                <?php
                                if(isset($_GET["value"]))
                                {
                                    $id = $_GET["value"];
                                    foreach ($values["categories"]as $categories)
                                    {
                                        if($categories->id ===$id)
                                        {
                                            echo($categories->category_name);
                                            break;
                                        }
                                    }
                                }else{
                                    echo("Категории");
                                }
                                ?>
                            </button>
                            <button type="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
                              <ul class="dropdown-menu">
                                  <li><a href="?ctrl=event&act=all">Все категории</a></li>
                                  <?php
                                  foreach ($values["categories"]as $categories)
                                  {
                                      echo("<li><a href=\"");
                                      echo("?ctrl=event&act=some&key=category_id&value=");
                                      echo($categories->id);
                                      echo("\">");
                                      echo($categories->category_name);
                                      echo("</a></li>\n");
                                  }
                                  ?>
                              </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-6 col-md-4">
                    <div class="form-group date">
                      <div class="input-group date" id="datetimepicker">
                        <input type="text" class="form-control" readonly="readonly">
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-6 col-md-4">
                    <div class="form-group date">
                      <div class="input-group date" id="search-text" >
                        <input type="text" class="form-control" placeholder="Поиск по названию">
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-ok"></span>
                        </span>
                      </div>
                    </div>
                  </div>
                </ol>
                <ol class="nav navbar-nav navbar-right">
                  <div class="button-nav">
                    <button type="button" class="btn btn-success btn-lg" aria-label="Поиск">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                  </div>                 
                    <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-lg" aria-label="Вход"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></button>
                     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                       <div class="modal-content">
                         <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title" id="myModalLabel">Авторизация на сайте</h4>
                         </div>
                         <div class="modal-body">
                           <?php include("../views/blocks/login.php");?>
                         </div>
                         <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                         </div>
                       </div>
                      </div>
                     </div>
                </ol>
            </div>                     
          </div>
      </nav>
     </div>
    </nav>
</div>
<!--Скрипт выбора категории
    нужен только для сглаживания перехода между категориями-->
<script>$(function(){

        $(".dropdown-menu li a").click(function(){

            $(".btn:first-child").text($(this).text());
            $(".btn:first-child").val($(this).text());
        });
    });</script>
