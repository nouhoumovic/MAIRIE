<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    { DB::table('users')->insert(array(
        ['first_name'=>'Admin','last_name'=>'admin','phone'=>'12345679','email'=>'admin@admin.com','password'=>'1234','role_id'=>2,'state'=>1],


       /*  ['label'=>'admin','description'=>'Administrateur'],
        ['label'=>'producteur','description'=>'producteur'],
        ['label'=>'livreur','description'=>'livreur aux boutiques'], */
    ));
    }
}
