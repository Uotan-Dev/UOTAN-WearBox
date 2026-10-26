#!/bin/sh
# 下载 Google 官方 macOS platform-tools，并把 adb / fastboot 打包进
# WearBox.app/Contents/Resources/platform-tools（lib/platform_tools.dart 会优先使用这里的版本）。
#
# 用法：
#   macos/scripts/bundle_platform_tools.sh          仅下载到 macos/platform-tools（已存在则跳过）
#   由 Xcode 构建阶段调用时会额外复制进 app 包
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHE_DIR="$SCRIPT_DIR/../platform-tools"
URL="https://dl.google.com/android/repository/platform-tools-latest-darwin.zip"
FILES="adb fastboot NOTICE.txt source.properties"

if [ ! -x "$CACHE_DIR/adb" ] || [ ! -x "$CACHE_DIR/fastboot" ]; then
  echo "Downloading Android platform-tools from $URL"
  TMP_DIR="$(mktemp -d)"
  trap 'rm -rf "$TMP_DIR"' EXIT
  curl -fsSL -o "$TMP_DIR/platform-tools.zip" "$URL"
  unzip -q "$TMP_DIR/platform-tools.zip" -d "$TMP_DIR"
  # 只接受 Google 签名的二进制
  for bin in adb fastboot; do
    codesign -dv "$TMP_DIR/platform-tools/$bin" 2>&1 | grep -q "TeamIdentifier=EQHXZ8M8AV" || {
      echo "error: $bin is not signed by Google LLC" >&2
      exit 1
    }
  done
  mkdir -p "$CACHE_DIR"
  for f in $FILES; do
    cp "$TMP_DIR/platform-tools/$f" "$CACHE_DIR/$f"
  done
fi

# 非 Xcode 构建环境下只做下载
if [ -z "$TARGET_BUILD_DIR" ] || [ -z "$UNLOCALIZED_RESOURCES_FOLDER_PATH" ]; then
  exit 0
fi

DEST="$TARGET_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH/platform-tools"
mkdir -p "$DEST"
for f in $FILES; do
  # ditto 会保留 Google 原有的代码签名
  ditto "$CACHE_DIR/$f" "$DEST/$f"
done
echo "Bundled platform-tools into $DEST"
