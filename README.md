# PowerShell_Hasher
PowerShell tool used to calculate file hashes

# Usage
Execute Hasher_Main.ps1. Recommended users run Hasher_Main.ps1 in its own directory. Dependency .ps1 files (md5.ps1, sha1.ps1, etc) should be placed in a subdirectory labeled "Algorithms".
File structure should look like this:

- (dir) Hasher (or whatever name you choose)
  - Hasher_Main.ps1 (execute this)
  - (dir) Algorithms
    - md5.ps1
    - sha1.ps1
    - sha256.ps1
    - sha384.ps1
    - sha512.ps1  
