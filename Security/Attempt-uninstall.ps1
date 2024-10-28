$SoftwareName="Desired Software to Uninstall"
(gwmi Win32_Product | ? Name -eq $SoftwareName).uninstall()