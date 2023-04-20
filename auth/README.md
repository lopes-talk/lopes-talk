# lopes_talk

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Things I have learned

## Getting the SHA1 key is a real pain

First run flutter doctor and ensure that everything is kosher

    flutter doctor -v

Second CD into your Andriod Studio Bin. Running Flutter Doctor -v will show you where yours is located. Example of mine below

    cd "C:\Program Files\Android\Android Studio\jbr\bin"

Thrid Generate your keystore file

    .\keytool -genkey -v -keystore 16025\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

Forth move the keystore file generated into your .andriod directory

Finally grab the SHA1

    ./keytool -list -v -keystore "< ENTER YOUR KEYSTORE PATH. EXAMPLE:C:\Users\16025\.android\.keystore>" -alias androiddebugkey -storepass "<STORE PASSWORD CREATED IN PRIOR STEP>" -keypass "<KEY PASSWORD CREATED IN PRIOR STEP>"
