[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | out-null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.initialDirectory = "C:\Users"
$OpenFileDialog.filter = "Subtitles (*.idx, *.sub, *.txt, *.srt, *.ssa, *.ass, *.dfxp, *.ttml, *.xml, *.mks)|*.idx;*.sub;*.txt;*.srt;*.ssa;*.ass;*.dfxp;*.ttml;*.xml;*.mks|All Files (*.*)|*.*"
$OpenFileDialog.ShowDialog()
$encode = $OpenFileDialog.filename 
$encode -replace ' ','?'