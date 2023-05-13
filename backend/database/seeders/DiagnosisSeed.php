<?php


namespace Database\Seeders;

use App\Models\diagnosis;
use Illuminate\Database\Seeder;
use Box\Spout\Reader\Common\Creator\ReaderEntityFactory;


class DiagnosisSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $reader = ReaderEntityFactory::createXLSXReader();
        $reader->open('./database/seeders/diagnoses.xlsx');
        foreach ($reader->getSheetIterator() as $sheet) {
            foreach ($sheet->getRowIterator() as $row) {
                $data = $row->toArray();

                diagnosis::create([
                    'code' => $data[0],
                    'diagnosis' => $data[1],
                    // Add more columns as needed
                ]);
            }
        }
//        DB::table('diagnosiss')->truncate();
//        (new Excel, new LaravelExcelReader(), new LaravelExcelWriter())->load('./database/seeds/diagnoses.xlsx', new DiagnosisImport);
    }
}
