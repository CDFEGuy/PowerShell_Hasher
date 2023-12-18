cls
while($true){

    while($true){
    $caseName = Read-Host "Please enter your case's number or name"
    echo " "
    if([string]::IsNullOrEmpty($caseName)){
        Write-Warning "Case name or number cannot be blank."
        echo " "
        continue
        }
    else{break}
    }


    while($true){
    $env:srcDir = Read-Host "Please enter the directory or file you want to hash"
    echo " "
    if([string]::IsNullOrEmpty($env:srcDir)){
        Write-Warning "Directory entry was either null or empty. Please try again."
        echo " "
        continue
        }
    elseif((Test-Path $env:srcDir) -ne $true){
        Write-Warning "Directory provided does not exist. Please try again."
        echo " "
        continue
        }
    else{break}
    }

    $env:outDir = Read-Host "Please enter the directory you would like the CSV exported to."
    echo " "
    if(-not(Test-Path -Path $env:outDir -PathType Container)){
        New-Item -ItemType Directory -Path $env:outDir | Out-Null
        }
    break
}

$env:outDir = Join-Path $env:outDir "$caseName-hashes.csv"

$hashConfirm = Read-Host "By default, this tool calculates MD5 and SHA1. Do you want to continue with the default hashes? (y/n)"
echo " "
if($hashConfirm -ieq "n"){
    $hashChoice = Read-Host "What algorithm do you want to use? (MD5, SHA1, SHA256, SHA384, SHA512)"
    if($hashChoice -ieq "md5"){
        . .\algorithms\cst_md5.ps1
        }
    elseif($hashChoice -ieq "sha1"){
        . .\algorithms\cst_sha1.ps1
        }
    elseif($hashChoice -ieq "sha256"){
        . .\algorithms\cst_sha256.ps1
        }
    elseif($hashChoice -ieq "sha384"){
        . .\algorithms\cst_sha384.ps1
        }
    elseif($hashChoice -ieq "sha512"){
        . .\algorithms\cst_sha512.ps1
        }
    elseif([string]::IsNullOrEmpty($hashChoice)){
        Write-Warning "Nothing was detected. Please try again."
        }
    else{Write-Warning "Unrecognized input. Please try again."}
    }
elseif($hashConfirm -ieq "y"){
    $files = Get-ChildItem -Path $env:srcDir -Recurse -File

    $progress = 0
    $total = $files.Count
    $percentComplete = 0

    $results = foreach($file in $files){
        $md5 = Get-FileHash -Path $file.FullName -Algorithm MD5
        $sha1 = Get-FileHash -Path $file.FullName -Algorithm SHA1

        [PSCustomObject]@{
            "File Name" = $file.Name
            "MD5"       = $md5.Hash
            "SHA1"      = $sha1.Hash
            }
        $progress++
        $percentComplete = $progress / $total * 100
        Write-Progress -Activity "Calculating hashes..." -Status "Processed $progress of $total files" -PercentComplete $percentComplete
        }

    $results | Export-Csv -Path $env:outDir -NoTypeInformation
    }

# SIG # Begin signature block
# MIIFbQYJKoZIhvcNAQcCoIIFXjCCBVoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUgvaYzM4tt8Fhc/cNGH6O/rQd
# gjegggMIMIIDBDCCAeygAwIBAgIQJElkqFfEXINKbwd2Su9fuTANBgkqhkiG9w0B
# AQsFADAaMRgwFgYDVQQDDA9UYXlsb3JfTml0c2Noa2UwHhcNMjMwNDE4MjMzODQx
# WhcNMjQwNDE4MjM1ODQxWjAaMRgwFgYDVQQDDA9UYXlsb3JfTml0c2Noa2UwggEi
# MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAIsCBiFYYGLV/9lGHEt7DHZ/1
# ayYt28jhY5pcI5xG+aRFycpKaZDFnlpFUapoXH03rIA/dYFIb3wj9LvE+liJeCGC
# OYe/Hb4onB0drB8PPcFhOPd5j12c+/xUuO88Yqc6lk1P6XCEp67zEiruxA4gVYH7
# VlPPT6aWNCols4M0GTOOdpoDzIvvPdNNG6xZF7qZlG6lIAsR07jquwC/rfbl6XHw
# Z3t87tDlYzbTTiqM/CH6x7SHdFrypJMLrkKH3McLf2Bu1FFKeFNS/+0ab8VDDlSH
# dbaSIqo2b08q32zxMa9PKDE+plLDM9KJl1X8oSSiwZSzOH7QStMRU471ucW1AgMB
# AAGjRjBEMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNV
# HQ4EFgQUU7XzkzkFxxWUd4FkcOhEWTOQ95cwDQYJKoZIhvcNAQELBQADggEBABCG
# /WlHx80kuIrg1P8G4DAhJRny0WxbXD70g8o69RBkTTZbyb8rrT55Bempxp0IaBUk
# VEiDkJkKl0qAMvH6KzRhgR/5DXiGXBekYyH1TWJILV5za7NogI8x6IbMKV6Ut1Y4
# SdXGe/Yn5jMhTD+RkqSzXo68NcJ2J+8s+xb3wfze556EaDEouOzWEk93r6OeBbX3
# wyAmM16vbYw1TScphYy7a4+hU4iX16QsdRjiB7jN37K1dUJM/P0iF+jbOldGjbpD
# QhJBebMik1awZvGlS7QZAELHg/ICPu1Z6Wq7kqEb4hRe05cRBSWmWqXEMXe1WMGK
# vYN8FJOvNebzgdF+tZIxggHPMIIBywIBATAuMBoxGDAWBgNVBAMMD1RheWxvcl9O
# aXRzY2hrZQIQJElkqFfEXINKbwd2Su9fuTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGC
# NwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUPL3E5X2v
# TzV6huZ4f5Z/ttD2oRAwDQYJKoZIhvcNAQEBBQAEggEAsZAq07EjGWOYtfnfzCje
# XRG2Xmfqjqeq8ydBPeWBj9LVX2qgefLR6u5IIiQHdKihT6Y9lJy4ByJW13SCrQ8v
# awX6DiF+DgJiXVOQJcc1JWJjIn1FQsCQPbvRSpjpNrlf2XG4MEB/jSw6XGZk22f1
# y8qes4cX40hscIgne1mrPOcGClJnspH1UT3xJo4qd+tL03k7ehvOvZvOZtZw4fpn
# 6DqvyTHqRLDIBOYgGC1cwa2sU3dNzta1Ff1dmABSdwKw7TnUMx9+RLfgZUkq74KS
# k8IPiNWmnRMUNj3XahxpE7DE+DvrAfTDG5bbEigRxERq7JD66qnh4RxhV+GZIgxV
# QA==
# SIG # End signature block
