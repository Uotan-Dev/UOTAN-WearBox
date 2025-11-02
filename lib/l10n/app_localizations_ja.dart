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
  String get settingsFooter => 'Uotan WearBox\n© 2020-2025 Gnayoah.com All rights reserved.';

  @override
  String get settingsLanguageTitle => '言語設定';

  @override
  String get settingsLanguageSubtitle => '表示言語を切り替える';

  @override
  String get languageSystem => 'システムに合わせる';

  @override
  String get languageChinese => '簡体字中国語';

  @override
  String get languageEnglish => '英語';

  @override
  String get wirelessPageTitle => 'ワイヤレス接続';

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
    return 'BL ロック: $bootloader';
  }

  @override
  String deviceArchitecture(Object architecture) {
    return 'アーキテクチャ: $architecture';
  }

  @override
  String deviceBatteryLevel(Object level) {
    return '電池残量: $level%';
  }

  @override
  String deviceBatteryHealth(Object health) {
    return 'バッテリー健康度: $health';
  }

  @override
  String deviceBatteryVoltage(Object voltage) {
    return '電圧: ${voltage}mV';
  }

  @override
  String deviceBatteryTemperature(Object temperature) {
    return '温度: $temperature°C';
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
  String get featureMemoryClean => 'メモリクリーニング';

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
  String get featureFlashTool => 'フラッシュツール';

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
  String get installApptoWatch => 'アプリ（APK）を手表にインストール';

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
  String get pairingStepDescription1 => '旧スマホ側で、手表との Bluetooth ペアリングを解除してください。';

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
  String get typePageTitle => 'テキストを手表へ送信';

  @override
  String get typeHint => 'ここにテキストを入力してください…';

  @override
  String get typeImportButton => 'テキストをインポート';

  @override
  String get typeClearButton => 'クリア';

  @override
  String get typeSendButton => '手表へ送信';

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
  String get githubDescription => 'APGL-3.0 ライセンスでオープンソース公開';

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
  String get driverStep3Description => '手表をケーブルまたは充電ドックで PC に接続し、デバイスマネージャー内の「その他のデバイス」または「ポータブルデバイス」を展開します。';

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
}
