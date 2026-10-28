// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Uotan WearBox';

  @override
  String get navigationHome => 'ホーム';

  @override
  String get navigationFeatures => 'ツール';

  @override
  String get navigationStore => 'アプリ';

  @override
  String get storeComingSoon => '近日公開';

  @override
  String get storeTitle => 'アプリセンター';

  @override
  String get navigationAbout => '設定';

  @override
  String get settingsPageTitle => 'Uotan WearBox';

  @override
  String settingsVersionLabel(Object version) {
    return 'バージョン: $version   開発・デザイン: Gnayoah';
  }

  @override
  String get settingsSectionFaq => 'よくある質問';

  @override
  String get settingsSectionAgreements => '利用規約';

  @override
  String get settingsSectionVisit => '公式サイトへ';

  @override
  String get settingsFaqTitle => 'よくある質問';

  @override
  String get settingsFaqSubtitle => '使用方法・接続・操作に問題がある場合は、まずこちらをご確認ください。';

  @override
  String get settingsDonateTitle => '寄付';

  @override
  String get settingsDonateSubtitle => '本プロジェクトは無料でご利用いただけます。ご支援いただけると幸いです (❁´◡`❁)';

  @override
  String get donationTitle => 'ご支援のお願い';

  @override
  String get donationChooseAmountLabel => '金額を選択：';

  @override
  String donationAmountLabel(Object amount) {
    return '$amount円';
  }

  @override
  String get donationAmountCustom => 'カスタム';

  @override
  String donationSelectedAmount(Object amount) {
    return '￥$amount';
  }

  @override
  String get donationSelectedAmountCustom => '任意の金額';

  @override
  String get donationPaymentAlipay => 'Alipay';

  @override
  String get donationPaymentWeChat => 'WeChat';

  @override
  String get donationThanksMessage => 'ご支援いただきありがとうございます。心より感謝申し上げます。';

  @override
  String get donationNetworkErrorTitle => 'ネットワークエラー';

  @override
  String get donationNetworkErrorBody => 'サーバーに接続できません。ネットワーク設定をご確認ください。';

  @override
  String get settingsFeedbackTitle => 'フィードバック';

  @override
  String get settingsFeedbackSubtitle => 'バグや問題については、まず FAQ をご確認の上、解決しない場合にご連絡ください。';

  @override
  String get settingsPrivacyTitle => 'プライバシーポリシー';

  @override
  String get settingsPrivacySubtitle => '内容をご確認の上、ご理解いただいた上でご利用ください。';

  @override
  String get settingsUserAgreementTitle => '利用規約';

  @override
  String get settingsUserAgreementSubtitle => '内容をご確認の上、ご理解いただいた上でご利用ください。';

  @override
  String get settingsWebsiteTitle => '公式サイト';

  @override
  String get settingsWebsiteSubtitle => 'Uotan WearBox';

  @override
  String get settingsCommunityTitle => 'コミュニティ';

  @override
  String get settingsCommunitySubtitle => 'デバイスユーザー交流コミュニティ';

  @override
  String get settingsFooter => 'Uotan WearBox\n© 2020-2026 Gnayoah.com All rights reserved.';

  @override
  String get settingsLanguageTitle => '言語設定';

  @override
  String get settingsLanguageSubtitle => '表示言語を切り替える';

  @override
  String get settingsDarkModeTitle => 'ダークモード';

  @override
  String get settingsDarkModeSubtitle => 'ライトとダークの外観を切り替えます';

  @override
  String get settingsCheckUpdateTitle => 'アップデートを確認';

  @override
  String get settingsCheckUpdateSubtitle => '最新バージョンを取得';

  @override
  String get updateUpToDate => '最新バージョンです';

  @override
  String get updateCheckFailed => 'アップデートを確認できませんでした。ネットワークを確認してください。';

  @override
  String get themeModeSystem => 'システムに従う';

  @override
  String get themeModeAlwaysOn => '常にオン';

  @override
  String get themeModeAlwaysOff => '常にオフ';

  @override
  String get languageSystem => 'システムに合わせる';

  @override
  String get languageChinese => '簡体字中国語';

  @override
  String get languageEnglish => '英語';

  @override
  String get wirelessPageTitle => 'ワイヤレス';

  @override
  String get wirelessHeaderIntro => 'デバイスの IP アドレスとポート番号を入力してください';

  @override
  String get wirelessIpLabel => 'デバイス IP アドレス';

  @override
  String get wirelessPortLabel => 'ポート番号';

  @override
  String get wirelessConnectButton => '接続';

  @override
  String get wirelessErrorTitle => 'エラー';

  @override
  String get wirelessSuccessTitle => '成功';

  @override
  String get wirelessInputIncomplete => 'IP アドレスとポート番号を入力してください';

  @override
  String wirelessConnectSuccess(Object target) {
    return '$target に接続しました';
  }

  @override
  String wirelessConnectFailure(Object details) {
    return '接続に失敗しました: $details';
  }

  @override
  String wirelessExecutionFailed(Object details) {
    return '実行に失敗しました: $details';
  }

  @override
  String get faqPageTitle => 'よくある質問';

  @override
  String get faqMenuTitle => '目次';

  @override
  String get faqMenuDeviceCannotConnect => 'デバイスが接続できない';

  @override
  String get faqMenuHowEnableUsbDebug => 'USB デバッグを有効にする方法';

  @override
  String get faqMenuWhyAdbDebug => 'ADB デバッグと表示される理由';

  @override
  String get faqMenuHowWirelessConnect => 'ワイヤレス接続の方法';

  @override
  String get faqMenuHowGetWirelessIpPort => 'ワイヤレスデバッグの IP とポートの確認方法';

  @override
  String get faqMenuFeatureNoResponse => '一部の機能が反応しない';

  @override
  String get faqQ1Title => '1. デバイスが接続できない・認識されない';

  @override
  String get faqQ1Body => 'USB デバッグが有効であること、接続時にデバッグ許可を与えたことをご確認ください。これは Uotan WearBox が通信するために必要です。';

  @override
  String get faqQ2Title => '2. USB デバッグを有効にする方法';

  @override
  String get faqQ2Intro => '以下の手順で有効にできます：';

  @override
  String get faqQ2Step1 => '• <b>設定</b> → <b>端末情報</b> を開きます。';

  @override
  String get faqQ2Step2 => '• <b>ビルド番号</b> を数回タップし、開発者モードを有効にします。';

  @override
  String get faqQ2Step3 => '• 設定に戻り、<b>開発者向けオプション</b> を開きます。';

  @override
  String get faqQ2Step4 => '• <b>USB デバッグ</b> を有効にします。';

  @override
  String get faqQ3Title => '3. なぜ ADB デバッグと表示されるのか';

  @override
  String get faqQ3Body => 'ADB デバッグと USB デバッグは本質的に同じ機能です。USB を通じて通信するため名称が異なるだけです。';

  @override
  String get faqQ4Title => '4. ワイヤレス接続の方法';

  @override
  String get faqQ4Intro => 'ワイヤレスデバッグを利用するには以下をご確認ください：';

  @override
  String get faqQ4Bullet1 => '• PC とデバイスが同一ネットワーク内にあること（2.4GHz / 5GHz は問いません）。';

  @override
  String get faqQ4Bullet2 => '• 開発者向けオプションで <b>ワイヤレスデバッグ</b> を有効にすること。';

  @override
  String get faqQ4Conclusion => 'ワイヤレスデバッグが有効になれば、Uotan WearBox でワイヤレス操作が可能になります。';

  @override
  String get faqQ5Title => '5. ワイヤレスデバッグの IP とポートの確認方法';

  @override
  String get faqQ5Intro => '以下の手順で確認できます：';

  @override
  String get faqQ5Body => '開発者向けオプションの「ワイヤレスデバッグ情報」で現在の IP アドレスとポートを確認できます。';

  @override
  String get faqQ6Title => '6. 一部の機能が反応しない';

  @override
  String get faqQ6Body1 => 'メーカー独自の Android システムを使用している場合、一部の機能が制限されることがあります（OPPO Watch、Meizu Watch など）。';

  @override
  String get faqQ6Body2 => 'Google の WearOS デバイスでは 99% の機能が利用できます（Pixel Watch、Mi Watch、TicWatch など）。複数回お試しください。';

  @override
  String get faqQ6Body3 => '動作しない場合は、再接続・再試行してください。';

  @override
  String get feedbackEmailSubject => 'Uotan WearBox - フィードバック';

  @override
  String get feedbackEmailBody => 'システムバージョン：\n\nフィードバック内容：\n\n\n\n\n\n\n\n';

  @override
  String get updateDialogTitle => 'アップデートがあります';

  @override
  String updateDialogMessage(Object remoteVersion, Object releaseDate) {
    return '新しいバージョン: $remoteVersion\nリリース日: $releaseDate';
  }

  @override
  String get updateDialogUpdate => '今すぐ更新';

  @override
  String get updateDialogLater => '後で';

  @override
  String get networkErrorTitle => 'サーバーに接続できません';

  @override
  String get networkErrorMessage => 'ネットワークをご確認の上、再度お試しください。';

  @override
  String get networkErrorExit => '終了';

  @override
  String get networkErrorRetry => '再試行';

  @override
  String get homeGreetingEarlyMorning => 'おはようございます（早朝）';

  @override
  String get homeGreetingMorning => 'おはようございます';

  @override
  String get homeGreetingAfternoon => 'こんにちは';

  @override
  String get homeGreetingEvening => 'こんばんは';

  @override
  String get homeWelcomeMessage => 'Uotan WearBox へようこそ';

  @override
  String get homeNoDeviceDetected => 'デバイスが検出されません。以下の手順に従って接続してください。';

  @override
  String get homeConnectionMethodsTitle => '対応している接続方法：';

  @override
  String get homeConnectionWired => '1. ケーブル／充電ドックで PC と接続（推奨）';

  @override
  String get homeConnectionWirelessPrefix => '2. ';

  @override
  String get homeConnectionWirelessLink => 'ワイヤレス接続';

  @override
  String get homeConnectionWirelessSuffix => ' を開いて Wi-Fi または Bluetooth 接続を開始';

  @override
  String get homeTroubleshootTitle => '接続できない場合は次をお試しください：';

  @override
  String get homeTroubleshootUsbDebug => '1. USB デバッグが有効か確認';

  @override
  String get homeTroubleshootUsbDebugLink => '手順を見る';

  @override
  String get homeTroubleshootDriver => '2. USB ドライバーがインストールされているか確認';

  @override
  String get homeTroubleshootDriverLink => 'ドライバーのインストール';

  @override
  String get homeTroubleshootReinstall => '3. アプリを再インストールし、最新版か確認';

  @override
  String get homeTroubleshootRestart => '4. PC やケーブルを変更し、再起動して再試行';

  @override
  String get deviceBasicInfoTitle => '基本情報';

  @override
  String get deviceBatteryStatusTitle => 'バッテリー状況';

  @override
  String get deviceSystemVersionTitle => 'システムバージョン';

  @override
  String deviceBrand(Object brand) {
    return 'ブランド: $brand';
  }

  @override
  String deviceResolution(Object resolution) {
    return '解像度: $resolution';
  }

  @override
  String deviceModel(Object model) {
    return 'モデル: $model';
  }

  @override
  String deviceDpi(Object dpi) {
    return 'DPI: $dpi';
  }

  @override
  String deviceSerial(Object serial) {
    return 'シリアル番号: $serial';
  }

  @override
  String deviceMemory(Object memory) {
    return 'メモリ: $memory';
  }

  @override
  String deviceUptime(Object uptime) {
    return '稼働時間: $uptime';
  }

  @override
  String deviceStorage(Object storage) {
    return 'ストレージ: $storage';
  }

  @override
  String deviceBootloader(Object bootloader) {
    return 'Bootloader ロック: $bootloader';
  }

  @override
  String deviceArchitecture(Object architecture) {
    return 'CPU アーキテクチャ: $architecture';
  }

  @override
  String deviceBatteryLevel(Object level) {
    return '電池残量: $level%';
  }

  @override
  String deviceBatteryHealth(Object health) {
    return 'バッテリーの状態: $health';
  }

  @override
  String deviceBatteryVoltage(Object voltage) {
    return '電池電圧: ${voltage}mV';
  }

  @override
  String deviceBatteryTemperature(Object temperature) {
    return '電池温度: $temperature°C';
  }

  @override
  String deviceAndroidVersion(Object androidVersion) {
    return 'Android バージョン: $androidVersion';
  }

  @override
  String devicePatchDate(Object patchDate) {
    return 'パッチ日: $patchDate';
  }

  @override
  String deviceSoftwareVersion(Object softwareVersion) {
    return 'ソフトウェアバージョン: $softwareVersion';
  }

  @override
  String deviceKernelVersion(Object kernelVersion) {
    return 'カーネルバージョン: $kernelVersion';
  }

  @override
  String get featuresTitle => 'ツール一覧';

  @override
  String get featureSectionApps => 'アプリ';

  @override
  String get featureSectionFiles => 'ファイル';

  @override
  String get featureSectionSystem => 'システム';

  @override
  String get featureSectionHardware => 'ハードウェア';

  @override
  String get featureSectionAdvanced => '詳細設定';

  @override
  String get featureInstallApp => 'アプリをインストール';

  @override
  String get featureAppManagement => 'アプリ管理';

  @override
  String get featureFileManagement => 'ファイル管理';

  @override
  String get featureSendText => 'テキスト送信';

  @override
  String get featureDisplaySettings => '表示設定';

  @override
  String get featureMemoryClean => 'ストレージ/メモリのクリーンアップ';

  @override
  String get featureKeySimulation => 'キー操作シミュレーション';

  @override
  String get featureBatteryManager => 'バッテリー管理';

  @override
  String get featureRotateScreen => '画面の強制回転';

  @override
  String get featureCapture => 'スクリーンショット / 画面録画';

  @override
  String get featureRePair => 'WearOS 再ペアリング';

  @override
  String get featureFlashTool => 'カスタムフラッシング';

  @override
  String get featureComingSoonTitle => '近日公開';

  @override
  String featureComingSoonMessage(Object feature) {
    return '現在この機能（$feature）は再構築中のためご利用いただけません。今後の更新で追加予定です。';
  }

  @override
  String get dialogOk => 'OK';

  @override
  String get setting_config => '設定';

  @override
  String get connect_successfully => '接続に成功しました！デバイスを接続したまま USB デバッグを有効にしてください。';

  @override
  String get installApptoWatch => 'アプリ（APK）をスマートウォッチにインストール';

  @override
  String get selectApptoInstall => 'インストールする APK を選択';

  @override
  String get installingWaiting => 'インストール中です…しばらくお待ちください。';

  @override
  String get installNoDeviceTitle => 'デバイスが未接続';

  @override
  String get installNoDeviceMessage => 'デバイスが検出されません。接続状態をご確認ください。';

  @override
  String get installSuccessTitle => 'インストール完了';

  @override
  String get installSuccessMessage => 'アプリが正常にインストールされました！';

  @override
  String get installFailureTitle => 'インストール失敗';

  @override
  String get installFailureMessage => 'インストール中に問題が発生しました。';

  @override
  String installFailureWithReason(Object error) {
    return 'エラー：$error';
  }

  @override
  String installErrorOutput(Object details) {
    return 'エラー: $details';
  }

  @override
  String get installTipTitle => '確認';

  @override
  String get installNoFileSelected => 'ファイルが選択されていません。';

  @override
  String get commonErrorTitle => 'エラー';

  @override
  String get commonNoticeTitle => '通知';

  @override
  String get buttonPageTitle => 'キー操作シミュレーター';

  @override
  String get buttonDeviceNotConnectedTitle => 'デバイス未接続';

  @override
  String get buttonDeviceNotConnectedMessage => 'デバイスが PC に接続され、USB デバッグが有効かご確認ください。';

  @override
  String get buttonConnectFirstMessage => 'まずデバイスを接続してください。';

  @override
  String buttonSendKeySuccess(Object keycode) {
    return 'キーコード $keycode を送信しました。';
  }

  @override
  String buttonExecutionFailed(Object details) {
    return '実行に失敗しました: $details';
  }

  @override
  String get buttonNameHome => 'ホーム';

  @override
  String get buttonNameBack => '戻る';

  @override
  String get buttonNamePower => '電源';

  @override
  String get buttonNameVolumeUp => '音量＋';

  @override
  String get buttonNameVolumeDown => '音量−';

  @override
  String get buttonNameSpeakerMute => 'スピーカーミュート';

  @override
  String get buttonNameMicMute => 'マイクミュート';

  @override
  String get buttonNameCallDial => '発信';

  @override
  String get buttonNameCallEnd => '通話終了';

  @override
  String get buttonNamePlayPause => '再生 / 一時停止';

  @override
  String get buttonNameNextTrack => '次の曲';

  @override
  String get buttonNamePreviousTrack => '前の曲';

  @override
  String get buttonNameScreenOn => '画面オン';

  @override
  String get buttonNameScreenOff => '画面オフ';

  @override
  String get displayPageTitle => '表示設定';

  @override
  String get displayValueUnknown => '取得不可';

  @override
  String get displayValueUnavailable => '利用できません';

  @override
  String get displayDeviceNotConnectedMessage => 'デバイスが検出されません。接続を確認してください。';

  @override
  String displayErrorCheckingConnection(Object error) {
    return 'デバイス接続を確認できません: $error';
  }

  @override
  String displayCurrentDpi(Object value) {
    return '現在の DPI: $value';
  }

  @override
  String displaySelectedDpi(Object value) {
    return '選択中: $value';
  }

  @override
  String get displayDpiLabel => 'DPI：';

  @override
  String get displayResetDefaultButton => 'デフォルトに戻す';

  @override
  String get displayApplyDpiButton => 'DPI を適用';

  @override
  String displayCurrentResolution(Object value) {
    return '現在の解像度: $value';
  }

  @override
  String displaySelectedResolution(Object value) {
    return '選択中: $value';
  }

  @override
  String get displayWidthLabel => '幅：';

  @override
  String get displayHeightLabel => '高さ：';

  @override
  String get displayApplyResolutionButton => '解像度を適用';

  @override
  String displayDpiSetSuccess(Object value) {
    return 'DPI を $value に変更しました';
  }

  @override
  String displayDpiSetFailure(Object error) {
    return 'DPI を変更できません: $error';
  }

  @override
  String displayResolutionSetSuccess(Object value) {
    return '解像度を $value に変更しました';
  }

  @override
  String displayResolutionSetFailure(Object error) {
    return '解像度を変更できません: $error';
  }

  @override
  String get displayDpiResetSuccess => 'DPI をデフォルトに戻しました';

  @override
  String displayDpiResetFailure(Object error) {
    return 'DPI を初期化できません: $error';
  }

  @override
  String get displayResolutionResetSuccess => '解像度をデフォルトに戻しました';

  @override
  String displayResolutionResetFailure(Object error) {
    return '解像度を初期化できません: $error';
  }

  @override
  String get displayDeviceDisconnectedMessage => 'デバイスが切断されました。';

  @override
  String get dialogCancel => 'キャンセル';

  @override
  String get dialogConfirm => '確認';

  @override
  String get appManageTitle => 'アプリ管理';

  @override
  String get appManageShowSystemApps => 'システムアプリを表示';

  @override
  String get appManageNoAppsOrDevice => 'アプリが検出されない、またはデバイスが接続されていません。';

  @override
  String appManageCannotFetch(Object error) {
    return 'アプリ一覧を取得できません: $error';
  }

  @override
  String get appManageDeviceDisconnected => 'デバイスが切断されました。';

  @override
  String get appManageTooltipUnfreeze => '解凍';

  @override
  String get appManageTooltipFreeze => '凍結';

  @override
  String get appManageTooltipExportApk => 'APK を抽出';

  @override
  String get appManageTooltipUninstall => 'アンインストール';

  @override
  String get appManageConfirmUninstallTitle => 'アンインストール確認';

  @override
  String appManageConfirmUninstallMessage(Object packageName) {
    return '$packageName をアンインストールしますか？';
  }

  @override
  String get appManagePullProgress => 'APK を抽出中…';

  @override
  String appManagePullSuccess(Object path) {
    return 'APK を保存しました：$path';
  }

  @override
  String appManagePullFailure(Object error) {
    return 'APK を抽出できません: $error';
  }

  @override
  String appManageUninstallSuccess(Object packageName) {
    return '$packageName をアンインストールしました';
  }

  @override
  String appManageUninstallFailure(Object error) {
    return 'アンインストールに失敗しました: $error';
  }

  @override
  String appManageFreezeSuccess(Object packageName) {
    return '$packageName を凍結しました';
  }

  @override
  String appManageFreezeFailure(Object error) {
    return 'アプリを凍結できません: $error';
  }

  @override
  String appManageUnfreezeSuccess(Object packageName) {
    return '$packageName を解凍しました';
  }

  @override
  String appManageUnfreezeFailure(Object error) {
    return '解凍に失敗しました: $error';
  }

  @override
  String fileManagerListFailure(Object path) {
    return '$path 以下のファイル一覧を取得できません。デバイス接続をご確認ください。';
  }

  @override
  String fileManagerErrorMessage(Object error) {
    return 'エラー: $error';
  }

  @override
  String get fileManagerSuccessTitle => '成功';

  @override
  String get fileManagerConfirmDeleteTitle => '削除確認';

  @override
  String fileManagerConfirmDeleteMessage(Object entry) {
    return '$entry を削除しますか？';
  }

  @override
  String get fileManagerDeleteButton => '削除';

  @override
  String fileManagerDeleteProgress(Object entry) {
    return '$entry を削除中…';
  }

  @override
  String fileManagerDeleteSuccess(Object entry) {
    return '$entry を削除しました';
  }

  @override
  String fileManagerDeleteFailure(Object entry) {
    return '$entry を削除できませんでした';
  }

  @override
  String get fileManagerRenameTitle => '名前変更';

  @override
  String get fileManagerRenameLabel => '新しい名前を入力';

  @override
  String get fileManagerRenameAction => '変更';

  @override
  String get fileManagerSaveDialogTitle => '保存先を選択';

  @override
  String fileManagerSaveProgress(Object file) {
    return '$file を保存中…';
  }

  @override
  String fileManagerSaveSuccess(Object path) {
    return '$path に保存しました';
  }

  @override
  String get fileManagerSaveFailure => 'PC にコピーできませんでした。';

  @override
  String get fileManagerUploadProgress => 'アップロード中…';

  @override
  String fileManagerUploadSuccess(Object path) {
    return '$path にアップロードしました';
  }

  @override
  String get fileManagerUploadFailure => 'デバイスにアップロードできませんでした。';

  @override
  String get fileManagerContextRename => '名前変更';

  @override
  String get fileManagerContextCopy => 'PC にコピー';

  @override
  String get fileManagerContextDelete => '削除';

  @override
  String fileManagerTitle(Object path) {
    return 'ファイル管理 ($path)';
  }

  @override
  String get fileManagerRootLabel => '内部ストレージ';

  @override
  String get pairingPageTitle => '初期化なしで再ペアリング（WearOS）';

  @override
  String pairingStepTitle(Object step) {
    return 'ステップ $step';
  }

  @override
  String get pairingStepDescription1 => '旧スマホ側で、スマートウォッチとの Bluetooth ペアリングを解除してください。';

  @override
  String get pairingClearServicesButton => 'Google サービスをクリアして再起動';

  @override
  String get pairingStepDescription4 => '新しいスマホで WearOS アプリを開き、再ペアリングしてください。';

  @override
  String get pairingEnableBluetoothButton => 'Bluetooth の検出モードを有効化';

  @override
  String pairingClearFailure(Object error) {
    return 'Google サービスのクリアに失敗しました: $error';
  }

  @override
  String get pairingRebooting => 'デバイスを再起動しています…';

  @override
  String pairingRebootFailure(Object error) {
    return '再起動に失敗しました: $error';
  }

  @override
  String pairingExecuteFailure(Object error) {
    return 'コマンドの実行に失敗しました: $error';
  }

  @override
  String get pairingBluetoothEnabled => 'Bluetooth の検出モードが有効になりました。';

  @override
  String get rotatePageTitle => '画面回転';

  @override
  String get rotateButtonLeft => '左回転';

  @override
  String get rotateButtonRight => '右回転';

  @override
  String get rotateButtonFlip => '上下反転';

  @override
  String get rotateButtonReset => 'リセット';

  @override
  String rotateSuccessMessage(Object direction) {
    return '画面を$directionへ回転しました';
  }

  @override
  String rotateExecuteFailure(Object error) {
    return '回転の適用に失敗しました: $error';
  }

  @override
  String get typePageTitle => 'テキストをスマートウォッチへ送信';

  @override
  String get typeHint => 'ここにテキストを入力してください…';

  @override
  String get typeImportButton => 'テキストをインポート';

  @override
  String get typeClearButton => 'クリア';

  @override
  String get typeSendButton => 'スマートウォッチへ送信';

  @override
  String typeImportFailure(Object error) {
    return 'テキストファイルを読み込めませんでした: $error';
  }

  @override
  String get typeNoDeviceMessage => 'デバイスが検出されません。接続をご確認ください。';

  @override
  String get typeEmptyTextMessage => 'テキストを入力してください。';

  @override
  String get typeSendingProgress => '送信中…';

  @override
  String get typePermissionDenied => '権限がありません。「USB デバッグ（インストール設定）」を有効にして再度お試しください。';

  @override
  String get typeSendSuccess => 'テキストを送信しました。';

  @override
  String typeSendFailure(Object error) {
    return 'エラーが発生しました: $error';
  }

  @override
  String typeConnectionCheckFailure(Object error) {
    return '接続状態を確認できません: $error';
  }

  @override
  String get viewOnGithub => 'Github';

  @override
  String get githubDescription => 'AGPL-3.0 ライセンスでオープンソース公開';

  @override
  String get driverTitle => 'USB ドライバーインストールガイド';

  @override
  String get driverIntro => 'このガイドは Windows 向けです。macOS / Linux ユーザーは USB ドライバーをインストールする必要はありません。';

  @override
  String get driverStep1Title => '1. USB ドライバーをダウンロード';

  @override
  String get driverStep1LinkPrefix => '';

  @override
  String get driverStep1LinkText => 'Android USB Driver';

  @override
  String get driverStep1LinkSuffix => ' のダウンロードページを開きます';

  @override
  String get driverStep1DownloadInstructions => '「Download the Google USB Driver ZIP file (ZIP)」をクリックし、ライセンスに同意して「usb_driver_r13-windows.zip」をダウンロードし、任意の場所に解凍してください。';

  @override
  String get driverStep2Title => '2. デバイスマネージャーを開く';

  @override
  String get driverStep2Description => 'Windows の設定からシステム情報に入り、「デバイスマネージャー」を開きます。';

  @override
  String get driverStep3Title => '3. デバイスを接続';

  @override
  String get driverStep3Description => 'スマートウォッチをケーブルまたは充電ドックで PC に接続し、デバイスマネージャー内の「その他のデバイス」または「ポータブルデバイス」を展開します。';

  @override
  String get driverStep4Title => '4. ドライバーを更新';

  @override
  String get driverStep4Description => '表示されたデバイス名を右クリックし、「ドライバーの更新」を選択します。';

  @override
  String get driverStep5Title => '5. 「コンピューターを参照してドライバーを検索」を選択';

  @override
  String get driverStep6Title => '6. ドライバーフォルダーを選択';

  @override
  String get driverStep6Description => '「参照」をクリックし、先ほど解凍したフォルダー「usb_driver_r13-windows」を選択します。';

  @override
  String get driverStep7Title => '7. ドライバーをインストール';

  @override
  String get driverStep7Description => '「次へ」をクリックするとドライバーがインストールされ、設定が完了します。';

  @override
  String driverUrlLaunchError(Object url) {
    return 'リンクを開けませんでした: $url';
  }

  @override
  String get tutorialTitle => 'USB デバッグ有効化ガイド（多くのデバイスに対応）';

  @override
  String get homeConnectionHelp => '接続ガイド';

  @override
  String get homeConnectDevice => 'デバイスを接続してください';

  @override
  String settingsCurrentVersion(String version) {
    return '現在のバージョン：$version';
  }

  @override
  String get homeNarrowWiredHelp => 'ケーブル／充電ドックでウォッチを接続';

  @override
  String get homeNarrowDebugHelp => 'USB デバッグが有効か確認';

  @override
  String get homeNarrowDriverHelp => 'ADB ドライバーがインストールされているか確認';

  @override
  String get homeWirelessUse => '2. 次の機能を使用：';

  @override
  String get homeCheckDebugPrefix => '3. 次の設定を有効にしてください：';

  @override
  String get homeUsbDebugLink => 'USB デバッグ';

  @override
  String get homeInstallDriverPrefix => '次のドライバーもインストールしてください：';

  @override
  String get homeAdbDriverLink => 'ADB ドライバー';

  @override
  String get homeDriverSuffix => '';

  @override
  String get homeRebootTo => '再起動先';

  @override
  String get homeSystem => 'システム';

  @override
  String get homeSelectDevice => 'デバイスを選択';

  @override
  String get homeNoConnectedDevices => '接続中のデバイスがありません';

  @override
  String get homeRefreshing => '更新中...';

  @override
  String get homeRefreshDevices => 'デバイスを更新';

  @override
  String get homeDevicesRefreshed => 'デバイス一覧を更新しました';

  @override
  String homeRefreshFailed(String error) {
    return 'デバイスの更新に失敗しました: $error';
  }

  @override
  String get homeDeviceInfo => 'デバイス情報';

  @override
  String get homeSelectDeviceFirst => '先にデバイスを選択してください';

  @override
  String get homeCommandSent => 'コマンドを送信しました';

  @override
  String commandExitFailure(String code) {
    return '実行に失敗しました。終了コード: $code';
  }

  @override
  String homeAdbError(String error) {
    return 'ADB エラー: $error';
  }

  @override
  String get batteryCurrentLevel => '現在の充電量';

  @override
  String get batteryTemperatureLabel => '温度 (°C)';

  @override
  String get batteryLevelLabel => '充電量 (%)';

  @override
  String get batterySimulateDischarging => '非充電を模擬';

  @override
  String get batterySimulateWireless => 'ワイヤレス充電を模擬';

  @override
  String get batterySimulateUsb => 'USB 充電を模擬';

  @override
  String get batteryRestoreDefault => '初期値に戻す';

  @override
  String get batteryModify => '適用';

  @override
  String get batteryHealthGood => '良好 (2)';

  @override
  String get batteryHealthOverheat => '過熱 (3)';

  @override
  String get batteryHealthDead => '故障 (4)';

  @override
  String get batteryHealthOverVoltage => '過電圧 (5)';

  @override
  String get batteryHealthFailure => '異常 (6)';

  @override
  String get batteryHealthCold => '低温 (7)';

  @override
  String batteryHealthUnknown(String code) {
    return '不明 ($code)';
  }

  @override
  String get batteryResetSuccess => 'バッテリーの模擬設定を初期値に戻しました。';

  @override
  String get batteryEnterTemperature => '温度を入力してください。';

  @override
  String get batteryInvalidTemperature => '温度の形式が無効です。';

  @override
  String batteryTemperatureChanged(String temperature) {
    return '温度を $temperature°C に変更しました';
  }

  @override
  String get batteryEnterLevel => '充電量を入力してください。';

  @override
  String get batteryInvalidLevel => '充電量は 0～100 の整数で指定してください。';

  @override
  String batteryLevelChanged(String level) {
    return '充電量を $level% に変更しました';
  }

  @override
  String get adbCommandFailed => 'ADB コマンドの実行に失敗しました。';

  @override
  String adbCommandError(String details) {
    return 'ADB コマンドの実行に失敗しました: $details';
  }

  @override
  String get adbCommandTimeout => 'ADB コマンドがタイムアウトしました。接続を確認して再試行してください。';

  @override
  String adbExecutionError(String error) {
    return 'ADB コマンドを実行できません: $error';
  }

  @override
  String get adbConnectionTimeout => 'ADB の接続確認がタイムアウトしました。ケーブルまたはワイヤレス接続を確認してください。';

  @override
  String adbConnectionError(String error) {
    return 'デバイスの接続状態を確認できません: $error';
  }

  @override
  String get captureSaveLocation => '保存先';

  @override
  String get captureComputerFolder => 'PC のフォルダー';

  @override
  String get captureDeviceFolder => 'デバイスのフォルダー';

  @override
  String get captureChooseFolder => 'フォルダーを選択';

  @override
  String get captureSetDevicePath => 'デバイスのパスを設定';

  @override
  String get captureSectionTitle => 'スクリーンショットと画面録画';

  @override
  String get captureTakeScreenshot => 'スクリーンショットを撮影';

  @override
  String get captureStartRecording => '録画を開始';

  @override
  String get captureStopRecording => '録画を停止';

  @override
  String get captureLocationLockedHint => '書き出しエラーを防ぐため、録画中は保存先が固定されます。';

  @override
  String get captureChooseSaveFolder => '保存フォルダーを選択';

  @override
  String get captureDeviceSavePath => 'デバイスの保存パスを設定';

  @override
  String get captureScreenshotFailed => 'デバイスでのスクリーンショット撮影に失敗しました';

  @override
  String captureScreenshotSavedDevice(String path) {
    return 'スクリーンショットをデバイスに保存しました:\n$path';
  }

  @override
  String get captureScreenshotExportFailed => 'スクリーンショットの書き出しに失敗しました';

  @override
  String captureScreenshotSavedComputer(String path) {
    return 'スクリーンショットを PC に保存しました:\n$path';
  }

  @override
  String commandExecutionError(String error) {
    return '実行に失敗しました: $error';
  }

  @override
  String get captureRecordingStartFailed => '録画の開始に失敗しました';

  @override
  String get captureRecordingProcessMissing => '録画プロセスが見つかりません。デバイスが screenrecord に対応しているか確認してください。';

  @override
  String get captureRecordingStarted => '録画を開始しました。';

  @override
  String get captureRecordingInvalidState => '録画状態に異常があります。録画をやり直してください。';

  @override
  String captureRecordingSavedDevice(String path) {
    return '録画をデバイスに保存しました:\n$path';
  }

  @override
  String get captureRecordingExportFailed => '録画の書き出しに失敗しました';

  @override
  String captureRecordingSavedComputer(String path) {
    return '録画を PC に保存しました:\n$path';
  }

  @override
  String get flashPageTitle => 'カスタム書き込み';

  @override
  String get flashCustomPartition => 'カスタムパーティション';

  @override
  String get flashChooseFile => 'ファイル';

  @override
  String get flashTargetPartition => '書き込み先';

  @override
  String get flashAction => '書き込む';

  @override
  String get flashLogTitle => 'ログ出力';

  @override
  String get flashNoLogs => 'ログはまだありません';

  @override
  String get flashQuickActions => 'クイック操作';

  @override
  String get flashDisableVbmeta => 'vbmeta 検証を無効化';

  @override
  String get flashSwitchSlot => 'スロットを切り替え';

  @override
  String get flashSelectImageFirst => '先にイメージファイルを選択してください。';

  @override
  String get flashEnterPartition => 'パーティション名を入力してください。';

  @override
  String get flashSelectVbmetaImage => 'vbmeta イメージを選択';

  @override
  String get flashUnknownSlot => '現在のスロットを識別できません。fastboot のログを確認してください。';

  @override
  String flashSwitchSlotFailed(String error) {
    return 'スロットの切り替えに失敗しました: $error';
  }

  @override
  String flashOperationFailed(String code) {
    return '操作に失敗しました。終了コード: $code';
  }

  @override
  String flashExecutionError(String error) {
    return 'fastboot コマンドを実行できません: $error';
  }

  @override
  String get flashNoDevice => 'fastboot デバイスが検出されません。デバイスが fastboot モードになっているか確認してください。';

  @override
  String flashDetectionError(String error) {
    return 'fastboot デバイスを検出できません。fastboot がインストールされ、使用可能か確認してください。\n$error';
  }

  @override
  String get memoryStatusTitle => 'メモリの状態';

  @override
  String get memoryTotal => '合計メモリ';

  @override
  String get memoryUsed => '使用済み';

  @override
  String get memoryAvailable => '利用可能メモリ';

  @override
  String get memoryFree => '空きメモリ';

  @override
  String get memoryCached => 'キャッシュ';

  @override
  String get memoryCleanupTitle => 'クリーンアップ';

  @override
  String get memoryClearBackground => 'バックグラウンドプロセスを終了';

  @override
  String get memoryClearCache => 'アプリのキャッシュを削除';

  @override
  String get memoryCustomPackage => '終了するパッケージを指定';

  @override
  String get memoryPackageHint => '例: com.google.android.gms';

  @override
  String get memoryForceStop => 'アプリを強制終了';

  @override
  String get memoryBackgroundCleared => 'バックグラウンドプロセスを終了しました。';

  @override
  String get memoryCacheCommandSent => 'キャッシュ削除コマンドを実行しました。';

  @override
  String get memoryEnterPackage => 'パッケージ名を入力してください。';

  @override
  String memoryStopAttempted(String packageName) {
    return '終了を試みました: $packageName';
  }

  @override
  String commandStderrFailure(String details) {
    return '実行に失敗しました: $details';
  }

  @override
  String commandExitCodeFailure(String code) {
    return '実行に失敗しました。終了コード: $code';
  }

  @override
  String get privacyParagraph1 => 'プライバシーポリシー';

  @override
  String get privacyParagraph2 => 'Uotan WearBox プライバシーポリシー';

  @override
  String get privacyParagraph3 => '更新日：2024年9月19日';

  @override
  String get privacyParagraph4 => 'Uotan WearBox（以下「本アプリ」）をご利用いただきありがとうございます。当方は個人情報の重要性を深く理解し、関連法令を厳守するとともに、適切な安全管理措置を講じて個人情報を保護することを約束します。本アプリをご利用になる前に、本プライバシーポリシーの全内容をよくお読みいただき、十分にご理解ください。';

  @override
  String get privacyParagraph5 => '一、収集する情報';

  @override
  String get privacyParagraph6 => '1. IP アドレス：本アプリの正常な動作とシステムの安全性を確保するため、必要な場合に限り IP アドレスを収集します。IP アドレス以外に、個人を特定できる情報は収集しません。';

  @override
  String get privacyParagraph7 => '2. 必要な権限：';

  @override
  String get privacyParagraph8 => '     - ネットワークアクセス権限：データ転送、サーバーとの通信、機能の更新に必要です。\n     - デバイス情報の読み取り権限：性能と互換性を向上させるため、機種や OS バージョンなどを読み取る場合があります。\n     - ストレージの読み書き権限：データのキャッシュ、設定の保存、オフライン機能の提供のために、ストレージを読み書きする場合があります。';

  @override
  String get privacyParagraph9 => '二、情報の利用方法';

  @override
  String get privacyParagraph10 => '1. サービスの提供と維持：収集した IP アドレスとデバイス情報を利用して、本アプリの正常な動作、機能の充実、利用体験の継続的な改善を図ります。';

  @override
  String get privacyParagraph11 => '2. 安全性の確保：IP アドレスとデバイス情報を利用して、不正行為、ネットワーク攻撃、その他システムの安全性を損なう行為の防止を含む監視とリスク対策を行います。';

  @override
  String get privacyParagraph12 => '三、個人情報を処理する法的根拠';

  @override
  String get privacyParagraph13 => '中国本土の利用者については、「中華人民共和国サイバーセキュリティ法」、「情報セキュリティ技術 個人情報セキュリティ規範」（GB/T 35273-2017）および関連法令に基づき、製品またはサービスの提供のために個人情報を収集・利用します。通常は同意を得た場合にのみ収集しますが、法的義務、契約の履行、または利用者もしくは他者の重大な利益の保護のために必要となる場合があります。';

  @override
  String get privacyParagraph14 => '四、情報の共有、移転および公開';

  @override
  String get privacyParagraph15 => '1. 法令上の要請：法令に従い、司法機関または政府の主管機関から適法な要請を受けた場合、個人情報を開示することがあります。';

  @override
  String get privacyParagraph16 => '2. 事業の移転：合併、買収、資産譲渡などに伴い、個人情報が資産の一部として移転される場合があります。新たな保有者には本ポリシーの遵守を求め、遵守できない場合は改めて同意を取得するよう求めます。';

  @override
  String get privacyParagraph17 => '3. 無断の公開：明示的な同意を得ない限り、個人情報を公開しません。';

  @override
  String get privacyParagraph18 => '4. 個人情報の共有、移転および公開に関する同意の例外';

  @override
  String get privacyParagraph19 => '関連法令に基づき、次の場合は同意を得ずに個人情報を共有、移転または公開することがあります：';

  @override
  String get privacyParagraph20 => '    - 国家の安全または国防に関わる場合\n    - 公共の安全、公衆衛生、重大な公共の利益に関わる場合\n    - 犯罪捜査、起訴、裁判、判決の執行に関わる場合\n    - 本人の同意を得ることが困難で、本人または他者の生命、財産などの重大な合法的権益を守るために必要な場合\n    - 本人が自ら公開した個人情報である場合\n    - 適法な報道や政府の情報公開など、合法的に公開された情報から収集した場合\n    - その他法令で定められた場合';

  @override
  String get privacyParagraph21 => '五、情報の保存と保護';

  @override
  String get privacyParagraph22 => '1. 情報の保存：取得した情報は中華人民共和国国内または香港特別行政区に保存します。国外へのデータ移転が生じる場合は、目的や受領者などをポップアップまたはメールで個別に通知し、同意を得ます。受領者に十分なデータ保護能力があることを確認します。';

  @override
  String get privacyParagraph23 => '2. 安全管理措置：業界標準に沿った物理的、電子的、管理上の措置により個人情報を保護します。データの分類・等級制度、セキュリティ管理規範、安全な開発の規範を整備し、情報の保存・利用を管理するとともに、サービスと無関係な個人情報を収集しないようにします。';

  @override
  String get privacyParagraph24 => '3. セキュリティ事故への対応：送信された情報の保護に最善を尽くしますが、技術的制約やインターネット上の悪意ある行為により、常に完全な安全性を保証することはできません。サービスへの接続に使用するシステムや通信網には、当方の管理外の要因で問題が生じる場合があります。';

  @override
  String get privacyParagraph25 => '事故を防ぐため、警戒体制と緊急対応計画を整備しています。個人情報のセキュリティ事故が発生した場合は、法令に従い、事故の概要と影響、実施済みまたは予定の対応策、リスクを低減するための助言、救済措置を速やかに通知し、直ちに緊急対応計画を発動して損失の最小化を図ります。電話やプッシュ通知などでお知らせし、個別の通知が困難な場合は合理的かつ有効な方法で公告します。また、規制当局の要請に従って対応状況を報告し、政府機関に協力します。';

  @override
  String get privacyParagraph26 => '六、利用者の権利';

  @override
  String get privacyParagraph27 => '1. アクセスと訂正：個人情報へのアクセスと更新を行う権利があります。行使する場合は、本ポリシーの連絡先までお問い合わせください。';

  @override
  String get privacyParagraph28 => '2. 削除と同意の撤回：法令に従い、個人情報の削除または同意の撤回を求める権利があります。削除や撤回により、一部またはすべてのサービスを提供できなくなる場合があります。';

  @override
  String get privacyParagraph29 => '七、未成年者の保護';

  @override
  String get privacyParagraph30 => '未成年者の個人情報保護を重視しています。18 歳未満の方は、保護者または法定後見人の同意と指導の下で本アプリを利用し、同意を得た上で個人情報を提供してください。';

  @override
  String get privacyParagraph31 => '八、プライバシーポリシーの更新';

  @override
  String get privacyParagraph32 => '事業の発展や法令の変更に伴い、本ポリシーを改定する場合があります。改定版は本ページに掲載し、掲載日から効力を生じます。最新の保護措置を確認するため、定期的にご覧ください。';

  @override
  String get privacyParagraph33 => '九、準拠法と紛争解決';

  @override
  String get privacyParagraph34 => '本ポリシーの成立、効力、履行、解釈および紛争解決には中華人民共和国の法律を適用します。紛争は友好的な協議で解決し、解決できない場合は、いずれの当事者も本アプリの所在地を管轄する人民法院に提訴できます。';

  @override
  String get privacyParagraph35 => '十、お問い合わせ';

  @override
  String get privacyParagraph36 => '本ポリシーに関するご質問、ご意見、ご提案、または権利の行使については、次の連絡先にお問い合わせください：\nメール：support@Gnayoah.com';

  @override
  String get privacyParagraph37 => '内容を速やかに確認し、ご依頼を受領後、適時に回答します。';

  @override
  String get privacyParagraph38 => 'Uotan WearBox への信頼とご支援に感謝します。';

  @override
  String get agreementParagraph1 => '利用規約';

  @override
  String get agreementParagraph2 => 'Uotan WearBox 利用規約';

  @override
  String get agreementParagraph3 => '更新日：2024年9月18日';

  @override
  String get agreementParagraph4 => 'Uotan WearBox（以下「本アプリ」または「当方」）をご利用になる前に、本利用規約（以下「本規約」）の全内容をよくお読みいただき、十分にご理解ください。本規約は、利用者（以下「利用者」または「お客様」）と Uotan WearBox との間で、本アプリの利用に関して締結される法的拘束力のある合意です。ダウンロード、インストール、その他の利用を行うことにより、すべての条項を読み、理解し、同意したものとみなします。';

  @override
  String get agreementParagraph5 => '一、プライバシーポリシーの独立性';

  @override
  String get agreementParagraph6 => 'Uotan Community と Uotan WearBox のプライバシーポリシーは完全に独立しており、相互に関連しません。Uotan Community のポリシーは同コミュニティの公式サイトをご覧ください。本アプリのポリシーは Uotan WearBox のみに適用されます。';

  @override
  String get agreementParagraph7 => '二、規約の承諾と変更';

  @override
  String get agreementParagraph8 => '1. 規約の承諾';

  @override
  String get agreementParagraph9 => '利用前に本規約の全内容をよくお読みください。いずれかの条項に同意できない場合は、直ちに利用を中止してください。ダウンロード、インストールまたは利用を行った場合、本規約の拘束を受けることに同意したものとみなします。';

  @override
  String get agreementParagraph10 => '2. 規約の変更';

  @override
  String get agreementParagraph11 => '事業の発展や法令の変更に応じ、個別の通知なく随時改定する権利を留保します。改定版は公表と同時に効力を生じます。最新の規約を確認する責任は利用者にあり、変更後も利用を続けた場合は改定内容に同意したものとみなします。';

  @override
  String get agreementParagraph12 => '三、サービス内容と利用規範';

  @override
  String get agreementParagraph13 => '1. サービス内容';

  @override
  String get agreementParagraph14 => '本アプリは、時刻表示、アラーム設定、健康モニタリングなど、時計に関連する補助機能とサービスを提供します。具体的な内容は実際に提供される機能に準じます。';

  @override
  String get agreementParagraph15 => '2. サービスの変更、中断または終了';

  @override
  String get agreementParagraph16 => '実情に応じて、事前の通知なくサービスの一部または全部を随時変更、中断または終了できます。これらによって生じた損失について責任を負いません。';

  @override
  String get agreementParagraph17 => '四、利用者の行動規範';

  @override
  String get agreementParagraph18 => '1. 適法な利用';

  @override
  String get agreementParagraph19 => '利用者は法令に従って利用し、法令、公序良俗または他者の合法的権益を侵害する行為を行わないことを約束します。禁止行為には次を含みます：';

  @override
  String get agreementParagraph20 => '• 知的財産権の侵害：著作権、商標権、特許権などで保護された内容を無断で複製、配布、改変、その他の方法で利用してはなりません。';

  @override
  String get agreementParagraph21 => '• 不適切な情報の発信：わいせつ、ポルノ、賭博、暴力、テロ、迷信、誹謗、侮辱、扇動、犯罪の教唆など、法令で禁止された内容を公開・配布してはなりません。';

  @override
  String get agreementParagraph22 => '• システムの安全性の侵害：悪意あるプログラム、ウイルス、トロイの木馬、ワームの拡散、本アプリのサーバー、ネットワーク、他の利用者のデバイスへの攻撃など、ネットワークの安全性を損なう行為やその試みを行ってはなりません。';

  @override
  String get agreementParagraph23 => '2. 法令の遵守';

  @override
  String get agreementParagraph24 => '利用時には「中華人民共和国サイバーセキュリティ法」、「中華人民共和国民法典」などの関連法令を厳守し、違法行為や犯罪行為に利用してはなりません。';

  @override
  String get agreementParagraph25 => '五、知的財産権の保護';

  @override
  String get agreementParagraph26 => '1. 権利の帰属';

  @override
  String get agreementParagraph27 => '本アプリおよび文章、画像、画面設計、視覚効果、ロゴ、商標、コード、プログラム、ソフトウェア、サービス、文書などの全内容は、中華人民共和国の著作権法、商標法、特許法などで保護され、関連する権利は Gnayoah またはその許諾者に帰属します。';

  @override
  String get agreementParagraph28 => '2. 利用許諾';

  @override
  String get agreementParagraph29 => '本規約に従ってダウンロード、インストールおよび利用するための、個人的、譲渡不可、非独占的、取消可能な限定的ライセンスを付与します。当方の事前の書面による同意なく、本アプリのいかなる部分も複製、改変、配布、販売、譲渡、その他の方法で利用してはなりません。';

  @override
  String get agreementParagraph30 => '3. 禁止行為';

  @override
  String get agreementParagraph31 => '当方または関連権利者の書面による許諾なく、上記の知的財産を実施、利用、譲渡、または第三者に許諾してはなりません。本アプリのリバースエンジニアリング、逆コンパイル、逆アセンブル、クラックなどを含みます。';

  @override
  String get agreementParagraph32 => '六、プライバシーポリシーとデータ保護';

  @override
  String get agreementParagraph33 => '1. 個人情報の保護';

  @override
  String get agreementParagraph34 => '個人情報の保護を重視し、本アプリのプライバシーポリシーおよび関連法令に厳格に従って、個人情報を収集、利用、保存および共有します。';

  @override
  String get agreementParagraph35 => '2. ポリシーへの同意';

  @override
  String get agreementParagraph36 => '本アプリの利用により、プライバシーポリシーの全内容を読み、同意したものとみなします。同意できない内容がある場合は直ちに利用を中止してください。';

  @override
  String get agreementParagraph37 => '七、免責と責任の制限';

  @override
  String get agreementParagraph38 => '1. 現状での提供';

  @override
  String get agreementParagraph39 => '本アプリは「現状のまま」かつ「提供可能な範囲」で提供します。継続性、適時性、安全性、正確性、完全性、信頼性について、明示・黙示を問わず保証しません。';

  @override
  String get agreementParagraph40 => '2. 責任の制限';

  @override
  String get agreementParagraph41 => '適用法で認められる最大限の範囲で、利用または利用不能により生じた直接的、間接的、付随的、特別、結果的、懲罰的損害（利益の喪失、データの消失、事業の中断などを含む）について責任を負いません。';

  @override
  String get agreementParagraph42 => '3. 第三者に関する責任';

  @override
  String get agreementParagraph43 => '本アプリを通じてアクセスする第三者のサイト、サービス、リソースの内容、正確性、適法性、信頼性について責任を負いません。第三者サービスの利用リスクは利用者が負担します。';

  @override
  String get agreementParagraph44 => '八、違反の責任と救済措置';

  @override
  String get agreementParagraph45 => '1. 違反への対応';

  @override
  String get agreementParagraph46 => '本規約または法令に違反した場合、事前の通知なく、警告、アクセスや利用の制限・中断・終了、関連記録の保存、法的責任の追及などの措置を講じることができます。';

  @override
  String get agreementParagraph47 => '2. 損害賠償責任';

  @override
  String get agreementParagraph48 => '本規約または法令への違反により当方や第三者に損失を与えた場合、直接的・間接的損失、期待利益の喪失、訴訟費用、弁護士費用などを含め、法に従ってすべての賠償責任を負うものとします。';

  @override
  String get agreementParagraph49 => '九、規約の終了とその効果';

  @override
  String get agreementParagraph50 => '1. 当方の終了権';

  @override
  String get agreementParagraph51 => '事業上の判断に基づき、事前の通知なく、いつでも、いかなる理由でも本規約を終了し、アクセスや利用を制限、中断または終了できます。';

  @override
  String get agreementParagraph52 => '2. 利用者の終了権';

  @override
  String get agreementParagraph53 => '利用者はいつでも利用を中止できます。利用の中止は本規約の終了を意味せず、知的財産権、責任の制限、準拠法などの条項は利用中止後も効力を有します。';

  @override
  String get agreementParagraph54 => '十、不可抗力';

  @override
  String get agreementParagraph55 => '自然災害、戦争、テロ、政府の行為、法令や政策の変更、ネットワーク障害、ハッキングなど、合理的な管理の及ばない原因によるサービスの中断やその他の不具合について責任を負いません。';

  @override
  String get agreementParagraph56 => '十一、準拠法と紛争解決';

  @override
  String get agreementParagraph57 => '1. 準拠法';

  @override
  String get agreementParagraph58 => '本規約の成立、効力、履行、解釈および紛争解決には、中華人民共和国の法律を適用します。本規約の目的上、香港特別行政区、マカオ特別行政区および台湾地区の法律は含みません。';

  @override
  String get agreementParagraph59 => '2. 紛争解決';

  @override
  String get agreementParagraph60 => '本規約に起因または関連する紛争は、まず友好的な協議によって解決します。解決できない場合は、いずれの当事者も当方の所在地を管轄する人民法院に提訴できます。';

  @override
  String get agreementParagraph61 => '十二、解釈権';

  @override
  String get agreementParagraph62 => '本規約の最終的な解釈権は Uotan WearBox に帰属します。本規約の解釈、変更および更新に関するすべての権利を留保します。';

  @override
  String get agreementParagraph63 => '十三、その他の条項';

  @override
  String get agreementParagraph64 => '1. 完全合意';

  @override
  String get agreementParagraph65 => '本規約（プライバシーポリシーを含む）は、対象事項に関する当事者間の完全な合意を構成し、それ以前の書面または口頭による合意、約束、表明に優先します。';

  @override
  String get agreementParagraph66 => '2. 条項の独立性';

  @override
  String get agreementParagraph67 => '管轄裁判所がいずれかの条項を無効または執行不能と判断した場合、その条項を必要最小限の範囲で制限または削除し、残りの条項の有効性および執行可能性には影響しないものとします。';

  @override
  String get agreementParagraph68 => '3. 権利の放棄';

  @override
  String get agreementParagraph69 => '当方が権利や救済措置を行使しない、または行使が遅れた場合も、その放棄とはみなされず、将来の行使に影響しません。';

  @override
  String get agreementParagraph70 => '4. 通知と送達';

  @override
  String get agreementParagraph71 => '本規約または本アプリに関する通知を、メール、SMS、アプリ内通知、公告などで送信することに同意するものとします。これらの通知は送信時に到達したものとみなします。';

  @override
  String get agreementParagraph72 => '十四、お問い合わせ';

  @override
  String get agreementParagraph73 => '本規約に関するご質問、ご意見、ご提案は、次の連絡先にお問い合わせください：';

  @override
  String get agreementParagraph74 => 'メール：support@Gnayoah.com';

  @override
  String get agreementParagraph75 => '合理的な期間内に回答します。';

  @override
  String get agreementParagraph76 => 'Uotan WearBox をお選びいただきありがとうございます。';

  @override
  String get deviceValueUnknown => '不明';

  @override
  String get deviceBootloaderLocked => 'ロック済み';

  @override
  String get deviceBootloaderUnlocked => 'ロック解除済み';

  @override
  String deviceMemoryUsage(String used, String total, String percent) {
    return '${used}G/${total}G（$percent% 使用）';
  }

  @override
  String deviceUptimeDays(String days, String hours, String minutes) {
    return '$days 日 $hours 時間 $minutes 分';
  }

  @override
  String deviceUptimeHours(String hours, String minutes) {
    return '$hours 時間 $minutes 分';
  }

  @override
  String deviceUptimeMinutes(String minutes) {
    return '$minutes 分';
  }

  @override
  String get flashReady => '書き込みツールの準備ができました。';

  @override
  String flashSelectedFile(String path) {
    return '選択したファイル: $path';
  }

  @override
  String flashSelectedVbmeta(String path) {
    return '選択した vbmeta イメージ: $path';
  }

  @override
  String flashSlotParseLog(String output) {
    return '出力から現在のスロットを解析できません: $output';
  }

  @override
  String flashActionPartition(String partition) {
    return '$partition に書き込む';
  }

  @override
  String flashActionSlot(String current, String target) {
    return 'スロットを切り替え $current → $target';
  }

  @override
  String flashLogStart(String action) {
    return '開始: $action';
  }

  @override
  String flashLogDone(String action) {
    return '完了: $action';
  }

  @override
  String flashLogFailed(String action, String code) {
    return '失敗: $action（終了コード $code）';
  }
}
