[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Videofile (*.avi, *.mp4, *.mkv, *.mov, *.vob, *.flv, *.webm, *.wmv, *.3gp)|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.webm;*.wmv;*.3gp|Picture (*.png, *.jpg, *.jpeg, *.bmp, *.webp)|*.png;*.jpg;*.jpeg;*.bmp;*.webp|GIF (Graphics Interchange Format)|*.gif|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.SafeFileName
$encode -replace ' ','?'