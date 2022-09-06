[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Audio (*.pcm, *.wav, *.flac, *.mp3, *.aac, *.ogg, *.alac, *.mka, *.m4a, *.oga, *.opus, *.wma, *.webm)|*.pcm;*.wav;*.flac;*.mp3;*.aac;*.ogg;*.alac;*.mka;*.m4a;*.oga;*.opus;*.wma;*.webm|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'