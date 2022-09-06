[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Video or Audio files|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.wmv;*.3gp;*.pcm;*.wav;*.flac;*.mp3;*.aac;*.ogg;*.alac;*.mka;*.m4a;*.oga;*.opus;*.wma;*.webm|Audio (*.pcm, *.wav, *.flac, *.mp3, *.aac, *.ogg, *.alac, *.mka, *.m4a, *.oga, *.opus, *.wma, *.webm)|*.pcm;*.wav;*.flac;*.mp3;*.aac;*.ogg;*.alac;*.mka;*.m4a;*.oga;*.opus;*.wma;*.webm|Videofile (*.avi, *.mp4, *.mkv, *.mov, *.vob, *.flv, *.webm, *.wmv, *.3gp)|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.webm;*.wmv;*.3gp|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'