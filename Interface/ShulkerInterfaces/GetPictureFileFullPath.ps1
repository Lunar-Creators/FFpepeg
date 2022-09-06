[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Picture (*.png, *.jpg, *.jpeg, *.bmp, *.webp)|*.png;*.jpg;*.jpeg;*.bmp;*.webp|GIF (Graphics Interchange Format)|*.gif|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'