# This is the SHA512 hash algorithm script. Please do not modify this script. If you
# identify any issues, please reach out to Taylor Nitschke (CTR).

# Keep this file in the 'Algorithms' directory co-located with CST_Hasher.ps1

$files = Get-ChildItem -Path $env:srcDir -Recurse -File

    $progress = 0
    $total = $files.Count
    $percentComplete = 0

    $results = foreach($file in $files){
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA512

        [PSCustomObject]@{
            "File Name" = $file.Name
            "SHA512"    = $hash.Hash
            }
        $progress++
        $percentComplete = $progress / $total * 100
        Write-Progress -Activity "Calculating hashes..." -Status "Processed $progress of $total files" -PercentComplete $percentComplete
        }

    $results | Export-Csv -Path $env:outDir -NoTypeInformation
# SIG # Begin signature block
# MIIFbQYJKoZIhvcNAQcCoIIFXjCCBVoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUn+AKA77AwaiZdfFlZSAF4J/c
# D8KgggMIMIIDBDCCAeygAwIBAgIQJElkqFfEXINKbwd2Su9fuTANBgkqhkiG9w0B
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
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQURyHmXD22
# 7aWZyf0scG9SSOqAbYcwDQYJKoZIhvcNAQEBBQAEggEAAIg1ciefFxKrUq9Jd05Y
# JierGEavBPpQRqaSMN4KUtKXhjf04+6n+85bAppL8VUeX5VAk/P0OXpqx5rAUm07
# BWMmp9DVTQPatFhbMeK+/BUx0YFBgIOcE9lWuLEvifWqjvldtN67SVVpoiYbGM7K
# 6VbN4bXp0c8mGGWoxCbUo4kkqzjnkh/WD6epg6VbJQ9w8Q+SbBEYBCWf+WVPYcCR
# TrAHmikHGR1n8Mn2XOfuWfVA40K81uamUynoa+wOWIunVc+AwbR9Qy7ePS1xQsgZ
# WBu9x/abo4xrGCHuDduS9nFaqqjX5VwjtqH45hBB1d8U9Cr0kfevRkpp/7pyo5ZY
# JA==
# SIG # End signature block
