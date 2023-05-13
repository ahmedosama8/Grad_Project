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
        $diagnosis->diagnosis = $row[1];
        $diagnosis->code = $row[0];
        $diagnosis->save();
    }
    $i++;

}
}
}
