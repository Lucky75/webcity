<div id="company">
    <div class="container card-company">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                    <img src="upload/<?= $values["company"]->picture_url; ?>"
                         alt="upload/<?= $values["company"]->picture_url; ?>" class="img-card">
                </div>
                <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                    <div class="container" name="name">
                        <h2><?= $values["company"]->fullname; ?></h2>
                    </div>
                    <hr>
                    <ul class="container details">
                        <li><p><span class="glyphicon glyphicon-earphone one" name="tel" style="width:50px;"></span><?php $telephones = $values["company"]->telephones;
                        foreach ($telephones as $telephone):{
                            echo ($telephone->telephone."  ");
                        }
                            endforeach;
                            ?></p></li>
                        <li><p><span class="glyphicon glyphicon-envelope one" name="mail"
                                     style="width:50px;"></span><?= $values["company"]->email; ?></p></li>
                        <li><p><span class="glyphicon glyphicon-map-marker one" name="address"
                                     style="width:50px;"></span><?= $values["company"]->place->city . ", " . $values["company"]->place->street . ", " . $values["company"]->place->house; ?>
                            </p></li>
                        <li><p><span class="glyphicon glyphicon-new-window one" name="www" style="width:50px;"></span><a
                                        href="#"><?= $values["company"]->www; ?></a></p>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-info">
            <div class="col-md-6">
                <h2 class="text-center">О компании</h2>
                <div class="container-about" name="description">
                    <p><?= $values["company"]->description; ?></p>
                </div>
            </div>
            <div class="col-md-6">
                <h2>Компания на карте</h2>
                <!-- Карта -->
                <input type="hidden" id="latitude" value="<?php echo($values["company"]->place->latitude); ?>">
                <input type="hidden" id="longitude" value="<?php echo($values["company"]->place->longitude); ?>">
                <div id="map"></div>
                <!-- /.Карта -->
            </div>
        </div>
        <div class="container-events">
            <h2 class="text-center">Все события компании</h2>
            <div class="container-fluid ">
                <div class="content">
                    <div class="row">
                        <?php $events = $values["company"]->events;
                        foreach ($events as $itemx):?>

                            <div class="col-xs-6 col-sm-4 col-md-3">
                                <div class="thumbnail">
                                    <div class="caption">
                                        <div class="event-title">
                                            <h2><?= $itemx->title; ?></h2>
                                        </div>
                                        <div class="event-description">
                                            <p><?= $itemx->category_name->category_name; ?></p>
                                        </div>
                                        <div class="event-date">
                                            <h3><?= $itemx->date_start; ?></h3>
                                        </div>
                                        <p><a href="?ctrl=event&act=one&id=<?= $itemx->id; ?>"
                                              class="label label-default">Узнать больше</a></p>

                                    </div>
                                    <div class="event-picture">
                                        <div class="event-picture-wrap"
                                             style="background-image: url('upload/<?= $itemx->pictures[0]->picture_url ?>');background-size: cover;">
                                            <img src='upload/<?= $itemx->pictures[0]->picture_url ?>' alt="" title="">
                                        </div>
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

    </div>
</div>

<!-- Скрипты для карты -->
<script src="js/map.js"></script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACS3ox5WFRZn2y4xKy-PMm4JgcKsh1wRQ&callback=initMap"
        type="text/javascript"></script>
