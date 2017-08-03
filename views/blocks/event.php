<div id="event">
    <div class="container event">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                    <img src="upload/<?= $values["event"]->pictures[0]->picture_url ?>" alt="stack photo"
                         class="img-card">
                </div>
                <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                    <div class="container" name="title">
                        <h2><?= $values["event"]->title; ?></h2>
                    </div>
                    <hr>
                    <ul class="container details">
                        <li><p><span class="glyphicon glyphicon glyphicon-calendar one" name="date-start"
                                     style="width:50px;"></span><?= $values["event"]->date_start; ?></p></li>
                        <li><p><span class="glyphicon glyphicon glyphicon-calendar one" name="date-end"
                                     style="width:50px;"></span><?= $values["event"]->date_end; ?></p></li>
                        <li><p><span class="glyphicon glyphicon glyphicon-pushpin one" name="category"
                                     style="width:50px;"></span><?= $values["event"]->category_name->category_name; ?>
                            </p></li>
                        <li><p><span class="glyphicon glyphicon-map-marker one" name="place" style="width:50px;"></span><?=$values["event"]->place->city . ", " . $values["event"]->place->street . ", " . $values["event"]->place->house; ?>
                            </p></li>
                        <li><p><span class="glyphicon glyphicon glyphicon-user one" name="company"
                                     style="width:50px;"></span><a
                                        href="index.php?ctrl=company&act=one&id=<?= $values["event"]->company_id; ?>"><?= $values["event"]->company_name->fullname; ?></a>
                            </p>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-info">
            <div class="col-md-6">
                <h2 class="text-center">О мероприятии</h2>
                <div class="container-about" name="description">
                    <p><?= $values["event"]->description; ?></div>
            </div>
            <div class="container-gallery">
                <div class="col-md-6">
                    <h2 class="text-center">Галерея</h2>
                    <div class="carousel slide-event article-slide" id="article-photo-carousel">

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner cont-slider">

                            <?php 
                            $countImage=0;
                            
                            foreach ($values["event"]->pictures as $picture): 
                            {    
                                if($countImage==0)
                                { ?>
                                    <div class="item active">
                                <img alt="" title=""
                                     src="upload/<?= $picture->picture_url ?> ">
                                    </div>
                                <?php 
                                }
                                else
                                { ?>
                                    <div class="item">
                                        <img alt="" title="" src="upload/<?=$picture->picture_url; ?>">
                                </div>
                                <?php }
                                $countImage=1;
                            }
                            endforeach;
                            ?>

                        </div>
                        <!-- Indicators -->


                        <ol class="carousel-indicators">
                            <?php 
                            $countImage=0;
                            
                            foreach ($values["event"]->pictures as $picture): 
                            {    
                                if($countImage==0)
                                { ?>
                                    <li class="active" data-slide-to="<?=$countImage; ?>" data-target="#article-photo-carousel">
                                <img alt="" src="upload/<?=$picture->picture_url; ?>">
                                </li>
                                <?php 
                                }
                                else
                                { ?>
                                    <li class="" data-slide-to="<?=$countImage; ?>" data-target="#article-photo-carousel">
                                    <img alt="" src="upload/<?=$picture->picture_url; ?>">
                                    </li>
                            <?php }
                                $countImage=$countImage+1;
                            }
                            endforeach;
                            ?>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <h2>Событие на карте</h2>
                <!-- Карта -->
                <input type="hidden" id="latitude"
                       value="<?php echo($values["event"]->place->latitude); ?>">
                <input type="hidden" id="longitude"
                       value="<?php echo($values["event"]->place->longitude); ?>">
                <div id="map">
                    <noscript>
                        <div class="warning">
                            <noindex>Внимание! В вашем браузере отключен <b>JavaScript</b>. Для работы с сайтом, <b>включите
                                    его</b>.
                            </noindex>
                        </div>
                    </noscript>
                </div>
                <!-- /.Карта -->
            </div>
        </div>
        <div class="container-events">
        </div>
    </div>
</div>

<!-- Скрипты для карты -->
<script src="js/map.js"></script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACS3ox5WFRZn2y4xKy-PMm4JgcKsh1wRQ&callback=initMap"
        type="text/javascript"></script>
