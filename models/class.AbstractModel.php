<?php
// Абстрактная модель - ее наследуют классы Event и Organization
//имеет методы для связи с базой данных.
abstract class AbstractModel
{
    protected static $table;
    protected static $class;
    
    public static function getAll() // выводит все
    {
        $db = new DB; // соединяемся с базой данных
        return $db->queryAll("SELECT * FROM ".static::$table, static::$class); //выполняем запрос, заполняя данными из него новые объекты( функция fetch_object)
    }
    
    public static function getOne($id) // выводит одно работает аналогично getAll
    {
        $db = new DB;
        return $db->queryOne("SELECT * FROM ".static::$table." WHERE id = {$id}", static::$class);
    }    
    public static function getSome($key,$value) // отбирает по указанному критерию 
    {
        $db = new DB;
        $ob= new static::$class;   // Создаем объект нужного сласса
        $q="SELECT * FROM ".static::$table." WHERE {$key} = '{$value}'"; //формируем запрос
            return $db->queryAll($q, static::$class); //аналогично getAll
    }
    
    
}
    
        
    

/*    public function __construct($name, $color, $size, $made, $price){
        $this->name = $name;
        $this->color = $color;
        $this->size = $size;
        $this->made = $made;
        $this->price = $price;
    }
    public function view(){
        echo $this->name,"<br>", $this->color,"<br>", $this->size,"<br>", $this->made,"<br>", $this->price," грн","<br>","<br>";
        //добавить фото
    }
    public function redactor($name, $color, $size, $made, $price){
        $this->name = $name;
        $this->color = $color;
        $this->size = $size;
        $this->made = $made;
        $this->price = $price;
    }
}
//$a = new Tovar("имя", "цвет", "размер", "сделан в","12");
//$a->view();*/
?>