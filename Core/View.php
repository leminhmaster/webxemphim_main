<?php
namespace Core;

class View
{
    public static function render($view, $args)
    {
        extract($args, EXTR_SKIP);
        $root = dirname(__DIR__);
        $file = $root."/App/Views/$view";
        if (is_readable($file)) {
            require $file;
        } else {
            echo "$file not found";
        }
    }
}
?>