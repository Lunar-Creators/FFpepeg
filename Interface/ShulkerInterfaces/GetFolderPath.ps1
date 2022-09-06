[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

$foldername = New-Object System.Windows.Forms.FolderBrowserDialog
$foldername.Description = "Select output folder"
$foldername.rootfolder = "MyComputer"
$foldername.ShowDialog()
$encode = $foldername.SelectedPath
$encode -replace ' ','?'