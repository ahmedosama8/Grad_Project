<?php


namespace Database\Seeders;

use DB;
use Excel;
use Illuminate\Database\Seeder;
use App\Imports\DiagnosisDescImport;

class DiagnosisSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('diagnosis')->truncate();
        Excel::import(new DiagnosisImport, './database/seeds/diagnoses.xlsx');
    }
}
