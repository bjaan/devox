pushd %~dp0\demucs\dist
demucs-cxfreeze.exe -n htdemucs_ft --repo ..\..\models\htdemucs_ft -o ..\..\output --two-stems vocals ""%1""
popd