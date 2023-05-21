<?php


namespace Database\Seeders;

use App\Models\diagnosis;
use App\Models\Pharmacy;
use Illuminate\Database\Seeder;
use Box\Spout\Reader\Common\Creator\ReaderEntityFactory;


class PharmacySeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $reader = ReaderEntityFactory::createXLSXReader();
        $reader->open('./database/seeders/PHARM.xlsx');
        foreach ($reader->getSheetIterator() as $sheet) {
            foreach ($sheet->getRowIterator() as $row) {
                $data = $row->toArray();

                Pharmacy::create([
                    'name' => $data[1],
                    'price' => $data[5],
                    // Add more columns as needed
                ]);
            }
        }
//        DB::table('diagnosiss')->truncate();
//        (new Excel, new LaravelExcelReader(), new LaravelExcelWriter())->load('./database/seeds/diagnoses.xlsx', new DiagnosisImport);
    }
}
