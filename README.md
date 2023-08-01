## 0. Install Python

We need Python 3.10 at least installed (it was tested with this version to say the least).

## 1. Build Demucs

First we need to build Demucs
We will create and a enter a new Python virtual environment in the `demucs\venv` folder.

Navigate to in the `demucs` sub folder, where you need to run these commands:
1. this will create and a enter a new Python virtual environment: `python -m venv venv`
2. enter this virtual environment with `venv\Scripts\activate`, it will now show `(venv) ` in front of the prompt
3. this will install Python requirements for CUDA support (only Windows and Linux) through pip: `pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 demucs SoundFile cx-Freeze`, alternative is CPU only `pip3 install torch torchvision torchaudio demucs SoundFile cx-Freeze`
4. this will build demucs (Windows & Linux): `cxfreeze main.py --target-dir=dist --target-name=demucs-cxfreeze --packages=torch --includes=demucs.htdemucs`
or without pip3 install torch torchvision torchaudio demucs SoundFile cx-Freeze
5. this will exit the virtual environment: `deactivate`

You find the `demucs` software now under `demucs\dist`

## 2. Copy _soundfile_data files

Copy the folder `demucs/venv/Lib/site-packages/_soundfile_data` to `demucs/dist/lib/_soundfile_data` (overwrite)

You can now remove the contents of the `demucs\venv` folder as it is no longer needed, about 1 GB

## 3. Bundle ffmpeg and ffprobe with demucs


First download the `ffmpeg` and `ffprobe` executables, e.g.:

Windows: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
MacOS: https://evermeet.cx/ffmpeg/ffmpeg-109428-g10a56363a7.zip and https://evermeet.cx/ffmpeg/ffprobe-109428-g10a56363a7.zip

Then copy them to `demuncs\dist`

## 4. Download models

Downloaded models and their corresponding YAML-file should be placed in a directory, and that directory should be passed to Demucs via the `-n` and `--repo` command line arguments.

Models for `htdemucs_ft`:

Download these:

    https://dl.fbaipublicfiles.com/demucs/hybrid_transformer/f7e0c4bc-ba3fe64a.th
    https://dl.fbaipublicfiles.com/demucs/hybrid_transformer/d12395a8-e57c48e6.th
    https://dl.fbaipublicfiles.com/demucs/hybrid_transformer/92cfc3b6-ef3bcb9c.th
    https://dl.fbaipublicfiles.com/demucs/hybrid_transformer/04573f0d-f3cf25b2.th
    https://raw.githubusercontent.com/facebookresearch/demucs/main/demucs/remote/htdemucs_ft.yaml

and place them in the `models\htdemucs_ft` folder

Note: List of all filenames (in case you need a model other than htdemucs_ft) https://raw.githubusercontent.com/facebookresearch/demucs/main/demucs/remote/files.txt

demucs-cxfreeze.exe -n htdemucs_ft --repo ..\..\models\htdemucs_ft


demucs-cxfreeze.exe -n htdemucs_ft --repos ..\..\models\htdemucs_ft -o ..\..\output --two-stems vocal INPUTFILE