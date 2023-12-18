# This is the SHA256 hash algorithm script. Please do not modify this script. If you
# identify any issues, please reach out to Taylor Nitschke (CTR).

# Keep this file in the 'Algorithms' directory co-located with CST_Hasher.ps1

$files = Get-ChildItem -Path $env:srcDir -Recurse -File

    $progress = 0
    $total = $files.Count
    $percentComplete = 0

    $results = foreach($file in $files){
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256

        [PSCustomObject]@{
            "File Name" = $file.Name
            "SHA256"    = $hash.Hash
            }
        $progress++
        $percentComplete = $progress / $total * 100
        Write-Progress -Activity "Calculating hashes..." -Status "Processed $progress of $total files" -PercentComplete $percentComplete
        }

    $results | Export-Csv -Path $env:outDir -NoTypeInformation
# SIG # Begin signature block
# MIIFbQYJKoZIhvcNAQcCoIIFXjCCBVoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUYncZCJlh5ZNJha7RlPC7Q8Pk
# bRqgggMIMIIDBDCCAeygAwIBAgIQJElkqFfEXINKbwd2Su9fuTANBgkqhkiG9w0B
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
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUyxSHSUSe
# SPSznYORuPj+On6Pfo4wDQYJKoZIhvcNAQEBBQAEggEAixPyd1bHpSXEk2YXVolf
# khb67vzxNkIfvd1dxmpkFIlgKKfWoXp5I+C+4frcRBUJ89fd5vlvqsoc+4sHWuTi
# 9Urv/zIb8oMZIXH9oGMxzcgJpqZaDOfw77pCSFnI/spjVb4f7V2FxHIYgRmc5jKa
# JgiDng/VxK34JbJ3bx3s5C84nAo21eYSKBNHuU+cJ7s6LGWxFRuhgo1nMPxFp5Nr
# KfEUgWO5Ku6h0NufuxO/SHhbZZDbfOG+V6Y6p5orGOzIYkzXMancKZaJaMThPLek
# Smzpp01PdLdI4nBfqnScaGemD8QQ2KqQIvXr88vyafT1VRJmZAQDYP85/5KYGnkP
# bA==
# SIG # End signature block
