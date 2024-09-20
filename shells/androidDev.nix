{ pkgs ? import <nixpkgs> {} }:

let

  flutter = pkgs.flutter;
  androidStudio = pkgs.android-studio;
  androidEnv = pkgs.androidenv.override {
    licenseAccepted = true;
  };
  androidSdk = androidEnv.composeAndroidPackages {
    platformToolsVersion = "34.0.4";
    buildToolsVersions = [ "30.0.3" "33.0.2" "34.0.0" ];
    platformVersions = [ "28" "31" "32" "33" "34" ];
    includeEmulator = true;
    systemImageTypes = [ "google_apis" "google_apis_playstore" ];
  };

in

pkgs.mkShell {
  
#  packages = [];
#  inputsFrom = [];

  
  buildInputs = [
    flutter
    androidStudio
    androidSdk.androidsdk
    pkgs.jdk11
  ];

  shellHook = ''
    export ANDROID_HOME="${androidSdk}/libexec/android-sdk"
    export ANDROID_SDK_ROOT="${androidSdk}/libexec/android-sdk"
    export JAVA_HOME="${pkgs.jdk11.home}"
    export FLUTTER_ROOT="${flutter}/bin"
  '';
}
