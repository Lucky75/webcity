<script>$(document).ready(function () {
        $('#media').carousel({
            pause: true,
            interval: 100,
        });
    });
</script>

<div class="container">
  <div class="row">
    <a href="?ctrl=company&act=all" style="text-align:center;border-bottom:solid 1px #eee;color:blue;"><h2> Организации Краматорска </h2> </a>
  </div>
  <div class="row">
   
      
      <div class="col-md-12">
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
            <div class="item  active">
            <div class="row">  
               
                <?php
                $rowcount=0;
    foreach($values["companies"] as $itemx):
        if ($rowcount%3==0 and $rowcount!=0)
                { ?>
                </div> 
                </div>
                <div class="item">
                <div class="row">
                <?php }
            $rowcount=$rowcount+1;
                ?>
            <div class="col-md-4">
                <div class="company-picture">
                    <a class="thumbnail-com" href="?ctrl=company&act=one&id=<?= $itemx->id; ?>"><img class="img-responsive img-circle" alt="" src="upload/<?= $itemx->picture_url ?>" ></a>
                    </div> 
                    <div class="company-fullname">
                        <h2><?= $itemx->fullname; ?></h2>
                        </div>
                        <div class="company-www">
                         <p><?= $itemx->www; ?></p>
                        </div> 
                       </div>
                <?php endforeach ?>    
        </div>
          </div>
        </div>
        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
        <a data-slide="next" href="#media" class="right carousel-control">›</a>
      </div>                          
    </div>
  </div>
</div>
