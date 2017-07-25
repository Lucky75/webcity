<div id = "event">    
       <div class="container event">
               <div class="jumbotron">
                  <div class="row">
                      <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                          <img src="img/page3-img9.jpg" alt="stack photo" class="img-card">
                      </div>
                      <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                          <div class="container" name = "title">
                            <h2><?= $item->title; ?></h2>
                          </div>
                            <hr>
                          <ul class="container details">
                            <li><p><span class="glyphicon glyphicon glyphicon-calendar one" name = "date-start" style="width:50px;"></span><?= $item->date_start; ?></p></li>
                            <li><p><span class="glyphicon glyphicon glyphicon-calendar one" name = "date-end" style="width:50px;"></span><?= $item->date_end; ?></p></li>
                            <li><p><span class="glyphicon glyphicon glyphicon-pushpin one" name = "category" style="width:50px;"></span><?= $item->category_id; ?></p></li>
                            <li><p><span class="glyphicon glyphicon-map-marker one" name = "place" style="width:50px;"></span>ул. Парковая, 40</p></li>
                            <li><p><span class="glyphicon glyphicon glyphicon-user one" name = "company" style="width:50px;"></span><a href="index.php?ctrl=company&act=one&id=<?= $item->company_id; ?>"><?= $item->company_id; ?></a></p>
                          </ul>
                      </div>
                  </div>
                  </div>
             <div class="container-info">
                            <div class="col-md-6">
                               <h2 class="text-center">О мероприятии</h2>
                                <div class="container-about" name = "description">
                            <p><?= $item->description; ?>                             </div>
                        </div>
          <div class="container-gallery"> 
                 <div class="col-md-6"> 
                      <h2 class="text-center">Галерея</h2>
                 <div class="carousel slide-event article-slide" id="article-photo-carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner cont-slider">

    <div class="item active">
      <img alt="" title="" src="img/page3-img9.jpg">
    </div>
    <div class="item">
      <img alt="" title="" src="img/page3-img4.jpg">
    </div>
    <div class="item">
      <img alt="" title="" src="img/page3-img4.jpg">
    </div>
    <div class="item">
      <img alt="" title="" src="img/page3-img4.jpg">
    </div>
  </div>
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li class="active" data-slide-to="0" data-target="#article-photo-carousel">
      <img alt="" src="img/page3-img9.jpg">
    </li>
    <li class="" data-slide-to="1" data-target="#article-photo-carousel">
      <img alt="" src="img/page3-img4.jpg">
    </li>
    <li class="" data-slide-to="2" data-target="#article-photo-carousel">
      <img alt="" src="img/page3-img4.jpg">
    </li>
    <li class="" data-slide-to="3" data-target="#article-photo-carousel">
      <img alt="" src="img/page3-img4.jpg">
    </li>
  </ol>
</div>
             </div> 
              </div>                                
                        <div class="col-md-12">
                             <h2>Событие на карте</h2>
                              <!-- Карта --><div id="map"></div><!-- /.Карта -->
                        </div>
         </div>
         <div class="container-events">         
    </div>
    </div>
</div>
</div>