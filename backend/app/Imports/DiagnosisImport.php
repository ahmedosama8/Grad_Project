<?php

namespace App\Imports;

use App\Models\diagnosis;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;


class DiagnosisImport implements ToCollection
{
public function collection(Collection $rows)
{
$i = 1;
foreach($rows as $row) {
    if($i <> 1) {
        $diagnosis = new Diagnosis();
        $diagnosis->diagnosis = (isset($row[1]))? $row[1] : '';
        $diagnosis->code = (isset($row[0]))? $row[0] : '';
        $diagnosis->save();
    }
    $i++;

}
}
}
