<?php
namespace App\Controllers\Admin;

use \Core\View;

class AdminhomeController extends \Core\Controller{

    public function indexAction(){
        View::render("Admin/HomeAdmin.html ",[
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