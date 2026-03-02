![QuantumROM Logo](QuantumROM/logo/QuantumROM.jpg)

# 📌 Overview:
- This Custom ROM is built by combining and refining features from multiple projects, including UNICA, Legacy-UI, and AstroRom.
- The goal of this ROM is to provide a clean, optimized, and stable One UI experience with enhanced usability and performance.

# Tools features.
- Download firmware directly from samsung server.
- File config and file contexts generate.
- Extract and img build ( erofs and ext4 supported).

# ✨ Key Features:
- System Optimization.
- Heavy debloated system (removed unnecessary apps & services).
- Improved performance and smoother UI experience.
- Optimized background processes.
- Better battery efficiency.
- Enhanced Functionality.
- Screenshot anywhere (enabled globally).
- Built-in Screen Recorder.
- More floating features enabled.
- Edge features fully working.
- Stock device conig always be added.
- Extra brightness support.
- Object, shadow and reflection remover support.
- Multi user support.
- Camera privacy toggle support
- [BluetoothLibraryPatcher](https://github.com/3arthur6/BluetoothLibraryPatcher) integrated
- [KnoxPatch](https://github.com/salvogiangri/KnoxPatch) integrated

# 🔐 Security & Privacy:
- Secure Folder support.
- Essential security components retained.
- Stable and safe daily-driver experience.

# 📱 One UI Experience:
- Full One UI apps included.
- Important system apps preserved.
- China Smart Manager support.
- AI features enabled.

# 🎯 Project Goal
- To deliver a lightweight yet fully featured Samsung One UI ROM that balances.
- Performance.
- Stability.
- Essential Features.
- Clean User Experience.

# How to Use:
1. Fork the Repository
- Give a ⭐ star to the repository.
- Fork the repository to your GitHub account.

2. Run the Workflow:
- Open your forked repository.
- Go to the Actions tab.
- Select QuantumROM Tools.
- Click Run workflow.

3. Set Your Device Model:
- Update your device model in the STOCK_DEVICE_MODEL option.
- If your model is available in /QuantumROM/Device folder of this repository, the tool will work for your device.
-If your model is not present, set STOCK_DEVICE_MODEL to None.

4. Kernel BPF Version Option:
- Set this option to True if your kernel BPF version is 5.4 (lower than 5.10).
- Otherwise, set it to False.

5. Set Target Device Information:
- Configure the following options:
- TARGET_DEVICE_MODEL
- The device model from which you want to port the ROM.

- TARGET_DEVICE_CSC
- The country/region code used to download the target device firmware.

- TARGET_DEVICE_IMEI
- Required to download the target device firmware from the Samsung server.
- Change the IMEI if you want to change the target device.

6. OUTPUT_FILESYSTEM (erofs / ext4)
- My tool can build images in two formats:
- erofs
- Recommended if your device partition size is small.
- Saves storage space.
- Your kernel must support EROFS.
-
- ext4
- Use this if your kernel does not support EROFS.
- The generated image will be larger in size.

7. Compress IMG to XZ (True / False)
- If set to True:
The generated image will be compressed to .xz format.
- This reduces file size before uploading.

If set to False:
- The image will remain in its original format without compression.


You said:
Fix grammar and make standard and add missing 

# How to use:
1: Give a star and fork the repo.
2: In your forked repo, go to action and select QuantumROM Tools and press Run Workflow.
3: Update your own device model in >STOCK_DEVICE_MODEL
   If your model present in my repo /QuantumROM/Device folder then this repo will work for your device. Otherwise set None in STOCK_DEVICE_MODEL option.

4: Second option:
   Set True if your kernel BPF version is 5.4 (lower than 5.10).

5: Set target device info:
    TARGET_DEVICE_MODEL > From which device rom you want to port.
    TARGET_DEVICE_CSC > This is for download target device model specific country firmware.
    TARGET_DEVICE_IMEI > Need imei For Download target Devicd Firmware From Samsung Server. Imei Need To Be Change if You Want To Change Your Target device.

6: OUTPUT_FILESYSTEM. e.g erofs / ext4
   My Tool Can Build Img In 2 Format.
   erofs > Set Erofs If YouR Device partition size Is Too Low Or You Want To Save Size. You Must Have Erofs Support On Your Kernel.
   Otherwise set Ext4. Ext4 Will BuilD Big Size Img
   
7: Compress IMG to XZ (True/False):
   If You Set Is True Then ....
   Else ....
   
8: In You Forked Repo /Settings/Secret and VariableS/Action option > New repository secret Make A New secret and Set NamE GIT_TOKEN and add git token.
   Search in YouTube how to make github secret token.
   If you don't add token in secret, your Build rom will not upload in your repo release Center.
   
9: How To Get Img From Splited File:
   Github Doesnt allow Single File UploaD MOre Than 2 Gb
   Thats Why Any Img Larger img Than 2 Gb Will SplittEd
   From release center Download All Files.
   If You Set Compress IMG to XZ Then First img Will Compress to Xz Format to Save File Size.
   If Xz Format Then First Need Make SinGle Img From SpliTed File.
   Split files Will Like:
   system.img.xz.part000
   system.img.xz.part001
   You Need TO Make Single Xz File FrOm SplittEd Files
   With Linux Fo Termux.
   Here Cmd
   After That Extract all Xz Fils To Get Original Img

ChatGPT said:
Here is your corrected and standardized version with missing parts properly completed:

How to Use
1. Fork the Repository
Give a ⭐ star to the repository.

Fork the repository to your GitHub account.

2. Run the Workflow
Open your forked repository.

Go to the Actions tab.

Select QuantumROM Tools.

Click Run workflow.

3. Set Your Device Model
Update your device model in the STOCK_DEVICE_MODEL option.

If your model is available in /QuantumROM/Device folder of this repository, the tool will work for your device.

If your model is not present, set STOCK_DEVICE_MODEL to None.

4. Kernel BPF Version Option
Set this option to True if your kernel BPF version is 5.4 (lower than 5.10).

Otherwise, set it to False.

5. Set Target Device Information
Configure the following options:

TARGET_DEVICE_MODEL
→ The device model from which you want to port the ROM.

TARGET_DEVICE_CSC
→ The country/region code used to download the target device firmware.

TARGET_DEVICE_IMEI
→ Required to download the target device firmware from the Samsung server.
→ Change the IMEI if you want to change the target device.

6. OUTPUT_FILESYSTEM (erofs / ext4)
My tool can build images in two formats:
erofs
Recommended if your device partition size is small.
Saves storage space.
Your kernel must support EROFS.
ext4
Use this if your kernel does not support EROFS.
The generated image will be larger in size.

7. Compress IMG to XZ (True / False)
If set to True:
- The generated image will be compressed to .xz format.
- This reduces file size before uploading.

If set to False:
- The image will remain in its original format without compression.

8. Add GitHub Token (Required for Upload)
To upload the built ROM to your repository release section:

Go to your forked repository.

Open Settings → Secrets and variables → Actions.

Click New repository secret.

Create a new secret:

Name: GIT_TOKEN

Value: Your GitHub Personal Access Token.

Save it.

You can search on YouTube for tutorials on how to create a GitHub Personal Access Token.

⚠️ If you do not add the GIT_TOKEN, the built ROM will not be uploaded to your repository release section.

## Licensing
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.
- **[android-tools](https://github.com/nmeum/android-tools)** - Licensed under Apache License 2.0
- **[apktool](https://github.com/iBotPeaches/Apktool)** - Licensed under Apache License 2.0  
- **[erofs-utils](https://github.com/sekaiacg/erofs-utils)** - Dual licensed (GPL-2.0, Apache-2.0)
- **[platform_build](https://android.googlesource.com/platform/build)** - Licensed under Apache License 2.0
- **[e2fsprogs](https://github.com/tytso/e2fsprogs)** - Licensed under GPL-2.0 / LGPL-2.1
