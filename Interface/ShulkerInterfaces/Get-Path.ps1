param($fftype)
[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null
if ($fftype -eq 1) #Audiofiles
{
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Audio (*.pcm, *.wav, *.flac, *.mp3, *.aac, *.ogg, *.alac, *.mka, *.m4a, *.oga, *.opus, *.wma, *.webm)|*.pcm;*.wav;*.flac;*.mp3;*.aac;*.ogg;*.alac;*.mka;*.m4a;*.oga;*.opus;*.wma;*.webm|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'
}
if ($fftype -eq 2) #Video or Audio files
{
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Video or Audio files|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.wmv;*.3gp;*.pcm;*.wav;*.flac;*.mp3;*.aac;*.ogg;*.alac;*.mka;*.m4a;*.oga;*.opus;*.wma;*.webm|Audio (*.pcm, *.wav, *.flac, *.mp3, *.aac, *.ogg, *.alac, *.mka, *.m4a, *.oga, *.opus, *.wma, *.webm)|*.pcm;*.wav;*.flac;*.mp3;*.aac;*.ogg;*.alac;*.mka;*.m4a;*.oga;*.opus;*.wma;*.webm|Videofile (*.avi, *.mp4, *.mkv, *.mov, *.vob, *.flv, *.webm, *.wmv, *.3gp)|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.webm;*.wmv;*.3gp|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'
}
if ($fftype -eq 3) #Folder
{
$foldername = New-Object System.Windows.Forms.FolderBrowserDialog
$foldername.Description = "Select output folder"
$foldername.rootfolder = "MyComputer"
$foldername.ShowDialog()
$encode = $foldername.SelectedPath
$encode -replace ' ','?'
}
if ($fftype -eq 4) #Video, Images, GIF
{
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Videofile (*.avi, *.mp4, *.mkv, *.mov, *.vob, *.flv, *.webm, *.wmv, *.3gp)|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.webm;*.wmv;*.3gp|Picture (*.png, *.jpg, *.jpeg, *.psd, *.webp, *.bmp, *.tiff, *.jp2, *.j2k, *.jpf, *.jpm, *.jpg2, *.j2c, *.jpc, *.jpx, *.jfif, *.mj2, *.tif, *.dib, *.avif, *.heif, *.heifs, *.heic, *.heics)|*.png;*.jpg;*.jpeg;*.bmp;*.webp;*.tiff;*.jp2;*.j2k;*.jpf;*.jpm;*.jpg2;*.j2c;*.jpc;*.jpx;*.mj2;*.jfif;*.tif;*.dib;*.avif;*.heif;*.heifs;*.heic;*.heics;*.psd|GIF (Graphics Interchange Format)|*.gif|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.SafeFileName
$encode -replace ' ','?'
}
if ($fftype -eq 5) #Images
{
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Picture (*.png, *.jpg, *.jpeg, *.psd, *.webp, *.bmp, *.tiff, *.jp2, *.j2k, *.jpf, *.jpm, *.jpg2, *.j2c, *.jpc, *.jpx, *.jfif, *.mj2, *.tif, *.dib, *.avif, *.heif, *.heifs, *.heic, *.heics)|*.png;*.jpg;*.jpeg;*.bmp;*.webp;*.tiff;*.jp2;*.j2k;*.jpf;*.jpm;*.jpg2;*.j2c;*.jpc;*.jpx;*.mj2;*.jfif;*.tif;*.dib;*.avif;*.heif;*.heifs;*.heic;*.heics;*.psd|GIF (Graphics Interchange Format)|*.gif|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'
}
if ($fftype -eq 6) #Subtitles
{
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Subtitles (*.idx, *.sub, *.txt, *.srt, *.ssa, *.ass, *.dfxp, *.ttml, *.xml, *.mks)|*.idx;*.sub;*.txt;*.srt;*.ssa;*.ass;*.dfxp;*.ttml;*.xml;*.mks|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'
}
if ($fftype -eq 7) #Video and Image
{
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "All major Image and Video formats|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.wmv;*.3gp;*.png;*.jpg;*.jpeg;*.bmp;*.webp;*.tiff;*.jp2;*.j2k;*.jpf;*.jpm;*.jpg2;*.j2c;*.jpc;*.jpx;*.mj2;*.jfif;*.tif;*.dib;*.avif;*.heif;*.heifs;*.heic;*.heics;*.gif|Videofile (*.avi, *.mp4, *.mkv, *.mov, *.vob, *.flv, *.webm, *.wmv, *.3gp)|*.avi;*.mp4;*.mkv;*.mov;*.vob;*.flv;*.webm;*.wmv;*.3gp|Picture (*.png, *.jpg, *.jpeg, *.psd, *.webp, *.bmp, *.tiff, *.jp2, *.j2k, *.jpf, *.jpm, *.jpg2, *.j2c, *.jpc, *.jpx, *.jfif, *.mj2, *.tif, *.dib, *.avif, *.heif, *.heifs, *.heic, *.heics)|*.png;*.jpg;*.jpeg;*.bmp;*.webp;*.tiff;*.jp2;*.j2k;*.jpf;*.jpm;*.jpg2;*.j2c;*.jpc;*.jpx;*.mj2;*.jfif;*.tif;*.dib;*.avif;*.heif;*.heifs;*.heic;*.heics;*.psd|GIF (Graphics Interchange Format)|*.gif|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'
}
sleep 1