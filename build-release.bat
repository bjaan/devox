pushd %~dp0
mkdir dist
copy devox.bat dist
mkdir dist\demucs
mkdir dist\demucs\dist
xcopy /s/e demucs\dist dist\demucs\dist
mkdir dist\models\htdemucs
xcopy /s/e models\htdemucs_ft\*.th dist\models\htdemucs_ft\
xcopy /s/e models\htdemucs_ft\*.yaml dist\models\htdemucs_ft\
popd