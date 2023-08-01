#  create a virtual environment:
Write-Host "** Building virtual environment for Python (venv)"
Push-Location demucs
python -m venv venv
Push-Location .\venv
Write-Host "** In the following prompt, run first:"
Write-Host " .\install-requirements.bat"
Write-Host " then"
Write-Host " .\build.bat"
Write-Host " and finally"
Write-Host " deactivate"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\Scripts\activate.ps1
Pop-Location