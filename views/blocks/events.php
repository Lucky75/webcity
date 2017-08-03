<!-- Contents events -->

 <div id="events">
   <div class="main-text-body">
    <h2><?=$values["title"];?> в Краматорске</h2>
  </div>
  <div class="container-fluid ">
    <div class="content">
      <div class="row">
          
          <?php
    foreach($values["events"] as $itemx):?>
          
        <div class="col-xs-6 col-sm-4 col-md-3">
          <div class="thumbnail">
            <div class="caption">
              <div class="event-title">
                <h2><?= $itemx->title; ?></h2>
              </div>
              <div class="event-description">
               <?= $itemx->category_name->category_name; ?>
              </div>
              <div class="event-date">
                <h3><?= $itemx->date_start; ?></h3>
              </div>
              <p><a href="?ctrl=event&act=one&id=<?= $itemx->id; ?>" class="label label-default">Узнать больше</a></p>
            </div>
            <div class="event-picture">
              <div class="event-picture-wrap" style="background-image: url('upload/<?= $itemx->pictures[0]->picture_url ?>');background-size: cover;"><img src='upload/<?= $itemx->pictures[0]->picture_url ?>' alt="" title=""></div>
              </div>
          </div>
        </div>
<?php endforeach
          
          ?>
          </div>
  <div class="container"> 
    <nav aria-label="pagination">
    <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#">6</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
        </div>
       </div>
       </div> 