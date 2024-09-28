{ config, pkgs, ... }:
let
  #buildToolsVersion = "30.0.3";
  #cmakeVersion = "3.10.2";
  
  #ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
  
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.1";
    buildToolsVersions = [ "30.0.3" ];
    includeEmulator = true;
    emulatorVersion = "35.1.4";
    platformVersions = [ "28" "29" "30" ];
    includeSources = true;
    includeSystemImages = true;
    systemImageTypes = [ "google_apis_playstore" ];
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
    cmakeVersions = [ "3.10.2" ];
    includeNDK = true;
    ndkVersions = ["22.0.7026061"];
    useGoogleAPIs = true;
    useGoogleTVAddOns = true;
    includeExtras = [
      "extras;google;gcm"
    ];
  };
in
{
  users.users.zfmk.extraGroups = [ "kvm" ];
  
  environment.sessionVariables = {
    #PATH = "~/development/flutter/bin:$PATH";
    #ANDROID_SDK_ROOT = "${ANDROID_HOME}";
    #ANDROID_NDK_ROOT = "${ANDROID_HOME}/ndk-bundle";
    #GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_HOME}/build-tools/${buildToolsVersion}/aapt2";
  };
  
  #networking.firewall.allowedTCPPorts = [ 5037 ];
  #networking.firewall.allowedUDPPorts = [ 5037 ];

  environment.systemPackages = with pkgs; [
    android-studio
    #androidComposition.androidsdk
    flutter
  ];

}
