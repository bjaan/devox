# DeVoX-Isolate
## Your Ultimate Audio Tool for Seamless Vocal and Voice-over Removal!

Are you tired of struggling to remove unwanted vocals and voice-overs from your audio files? Do you wish to create instrumental versions of your favorite songs or podcasts effortlessly? Look no further! DeVoX-Isolate is here to revolutionize your audio editing experience.

DeVoX-Isolate is a cutting-edge software designed to remove vocals and voice-overs from any audio file with unparalleled precision and ease. Developed by a team of audio experts and powered by advanced AI algorithms, this tool offers an innovative and efficient way to achieve professional-grade audio manipulation.

Key Features:

*    Seamless Vocal Removal: DeVoX-Isolate utilizes sophisticated deep learning technology to detect and isolate vocals and voice-overs from your audio tracks. By extracting vocals from background music, podcasts, or recordings, you can effortlessly obtain pristine instrumental versions for remixes or karaoke performances.

*    High-Fidelity Output: We understand the importance of preserving audio quality. With DeVoX-Isolate, you can rest assured that your audio will retain its original brilliance, even after removing the vocals. Our tool ensures minimal loss of audio quality during the process.

*    User-Friendly Interface: DeVoX-Isolate boasts a user-friendly interface that enables both novices and professionals to work with ease. Simply drag-and-drop your audio file on our application and the screen shows you status updates.

*    Multiple File Format Support: Whether it's MP3, WAV, FLAC, or any other popular audio format, DeVoX-Isolate accommodates a wide range of file types. This flexibility ensures that you can work with your preferred audio files without any hassle.

As this is a full-beta software, we do not provide a GUI yet, but you can already use our core functionality.

TODO :
*   De-ducking: Some audio mixes automatically reduce the audio level of other tracks when a vocal is present to put in the foreground, this results in a reduced level when the audio is removed by our process, we should automatically compensate for that

*	Batch Processing: Time is of the essence, and DeVoX-Isolate respects that. Our tool supports batch processing, allowing you to remove vocals from multiple audio files simultaneously, significantly reducing editing time.

*	Real-time Preview: Get a sneak peek of the final result before committing to the changes. DeVoX-Isolate provides a real-time preview, empowering you to select what vocals to cut/amplify/reduce and achieve the perfect audio output.

DeVoX-Isolate is a must-have tool for musicians, content creators, podcasters, and audio enthusiasts alike. Whether you're a professional sound engineer or an aspiring artist, this software caters to all your vocal removal needs.

Join the revolution of audio editing with DeVoX-Isolate and unlock a world of possibilities. Experience the power and convenience of this remarkable tool today!

# Usage

When you're on Windows you can download and use our release directly.

You can run the batch file `devox.bat` with just one parameter the input file, e.g. an mp3.

Or simply drag and drop it on the `devox.bat` file

Once the process is complete the files are available in the `output\htdemucs_ft` in a separate folder, as `no_vocals.wav`. The vocals are saved as `vocals.wav`

# Building

To build DeVoX-Isolate for yourself and your OS. First download this repository.

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
or without `pip3 install torch torchvision torchaudio demucs SoundFile cx-Freeze`
5. this will exit the virtual environment: `deactivate`

You find the `demucs` software now under `demucs\dist`

## 2. Copy _soundfile_data files

Copy the folder `demucs/venv/Lib/site-packages/_soundfile_data` to `demucs/dist/lib/_soundfile_data` (overwrite)

You can now remove the contents of the `demucs\venv` folder as it is no longer needed, about 1 GB

## 3. Bundle ffmpeg and ffprobe with demucs


First download the `ffmpeg` and `ffprobe` executables, e.g.:

Windows: https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip

MacOS: https://evermeet.cx/ffmpeg/ffmpeg-109428-g10a56363a7.zip and https://evermeet.cx/ffmpeg/ffprobe-109428-g10a56363a7.zip

Then copy them to the `demucs\dist` folder

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

## 5. Build Release

Run `build-release.bat` to copy all the required files to the `dist` folder

`devox.bat` is now available