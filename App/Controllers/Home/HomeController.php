<?php
namespace App\Controllers\Home;

use \Core\View;

class HomeController extends \Core\Controller
{
    public function indexAction()
    {
        //echo "Hello from index of Home Controller";
        
        View::render("home.html ",[
            'name'=>'model se dua dl vao day',
            'colours'=>['red','green','blue']
        ]);


    }

    protected function after()
    {
        echo "(after)";
    }

    protected function before()
    {
        echo "(before)";
    }
}

?>