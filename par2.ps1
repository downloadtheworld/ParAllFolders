$mediafolders = "D:\Media\TV\","F:\Media\TV\","G:\Media\TV\","D:\Media\Films\","D:\Media\Stand Up"
$par2base = "P:\par2\"
foreach($mediafolder in $mediafolders){
    $folders = Get-ChildItem $mediafolder -Directory
    foreach ($folder in $folders){
        $folder.name
        $folder.FullName
        $par2typefolder = $par2base + $folder.Parent.Name + "\"
        $par2folder = $par2typefolder + $folder.Name
        $par2txt = $folder.FullName + "\" + "par2.txt"
        $par2file = $par2folder + "\" + $folder.name
        $sourcewildcard = $folder.FullName + "\*"
        if(!(Test-Path $par2txt)){
            Out-File -InputObject $par2folder $par2txt
            if(Test-Path $par2folder){
                Remove-Item $par2folder -Force -Recurse
            }
            if(!(Test-Path $par2folder)){
                New-Item $par2typefolder -Name $folder.Name -ItemType Directory
            }
        $par2file
        $sourcewildcard
        . "C:\Program Files (x86)\MultiPar\par2j64.exe" c /sm2048 /rr10 /rd2 $par2file $sourcewildcard
        }
    }
}