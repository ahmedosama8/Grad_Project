<?php


namespace Database\Seeders;

use App\Models\diagnosis;
use App\Models\Pharmacy;
use Illuminate\Database\Seeder;
use Box\Spout\Reader\Common\Creator\ReaderEntityFactory;


class EntitySeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $reader = ReaderEntityFactory::createXLSXReader();
        $reader->open('./database/seeders/Entities.xlsx');
        foreach ($reader->getSheetIterator() as $sheet) {
            foreach ($sheet->getRowIterator() as $row) {
                $data = $row->toArray();

                Pharmacy::create([
                    'name' => $data[1],
                    'type' => $data[2],
                    'phone' => $data[3],
                    'email' => $data[4],
                    'username' => $data[5],
                    'password' => $data[6],
                    'address' => $data[7],
                    // Add more columns as needed
                ]);
            }
        }
//        DB::table('diagnosiss')->truncate();
//        (new Excel, new LaravelExcelReader(), new LaravelExcelWriter())->load('./database/seeds/diagnoses.xlsx', new DiagnosisImport);
    }
}
