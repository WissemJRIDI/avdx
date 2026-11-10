class Avdx < Formula
  desc "Interactive terminal launcher for Android emulators (AVDs)"
  homepage "https://github.com/WissemJRIDI/avdx"
  url "https://github.com/WissemJRIDI/avdx/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  def install
    bin.install "avdx"
  end

  def caveats
    <<~EOS
      avdx needs the Android SDK 'emulator' binary. If you don't have Android
      Studio installed, you can get the SDK command-line tools with:

        brew install --cask android-commandlinetools
        sdkmanager "emulator" "platform-tools" "system-images;android-34;google_apis;arm64-v8a"

      avdx looks for the SDK on your PATH, then in $ANDROID_HOME, $ANDROID_SDK_ROOT,
      ~/Library/Android/sdk and ~/Android/Sdk.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avdx --version")
  end
end
