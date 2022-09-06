[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Picture (*.png, *.jpg, *.jpeg, *.bmp, *.webp, *.tiff, *.jp2, *.j2k, *.jpf, *.jpm, *.jpg2, *.j2c, *.jpc, *.jpx, *.jfif, *.mj2, *.tif, *.dib, *.avif, *.heif, *.heifs, *.heic, *.heics)|*.png;*.jpg;*.jpeg;*.bmp;*.webp;*.tiff;*.jp2;*.j2k;*.jpf;*.jpm;*.jpg2;*.j2c;*.jpc;*.jpx;*.mj2;*.jfif;*.tif;*.dib;*.avif;*.heif;*.heifs;*.heic;*.heics|GIF (Graphics Interchange Format)|*.gif|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'