import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0), // 设置 AppBar 的高度
        child: Padding(
          padding: const EdgeInsets.only(top: 40), // 设置顶部边距
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(), // 允许拖动窗口
            child: Container(
              color: Colors.transparent, // 设置为透明背景
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右对齐
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 20), // 返回图标
                        onPressed: () {
                          Navigator.pop(context); // 返回到上一个页面
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '隐私政策', // 页面标题
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'MiSansLight', // 使用自定义字体
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 30.0, right: 30, bottom: 30, top: 20), // 设置页面内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '柚坛手表助手隐私政策',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 2),
            Text(
              '更新日期：2024年9月19日',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '欢迎使用柚坛手表助手（以下简称“本应用”）。我们深刻理解个人信息对您的重要性，并承诺严格遵守相关法律法规的要求，采取适当的安全保护措施，保障您的个人信息安全。请您在使用本应用前，仔细阅读并充分理解本隐私政策的全部内容。',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '一、我们收集的信息 ',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 互联网协议地址：为确保本应用的正常运行和系统安全，我们仅在必要情况下收集您的互联网协议地址。除互联网协议地址外，我们不收集任何其他可识别您个人身份的信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 必要的权限获取:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '     - 网络访问权限：本应用需要获取网络访问权限，以实现数据传输、服务器通信和功能更新。\n     - 读取设备信息权限：为优化应用性能、提升兼容性，我们可能需要读取您的设备信息，例如设备型号、操作系统版本等。\n     - 读写存储权限：本应用可能需要读取和写入设备存储空间，以缓存数据、保存用户设置并提供离线功能。',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '二、我们如何使用信息 ',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 提供和维护服务：利用收集的互联网协议地址和设备信息，确保本应用的正常运行、功能完善，并持续优化用户体验。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 安全保障：使用互联网协议地址和设备信息进行安全监测和风险防范，包括但不限于预防欺诈、网络攻击和其他可能危害系统安全的活动。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '三、处理个人信息的法律依据',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '如果您是中华人民共和国大陆地区的用户，我们将依据《中华人民共和国网络安全法》、《信息安全技术 个人信息安全规范》（GB/T 35273-2017）以及其他相关法律法规，收集和使用您的个人信息，为您提供产品和/或服务。我们通常仅在征得您同意的情况下收集您的个人信息。在某些情况下，我们可能基于法律义务或履行合同必要性收集您的个人信息，或者需要您的个人信息来保护您或他人的重要利益。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '四、信息的共享、转让和公开披露',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 法律法规要求：在符合法律法规的前提下，若司法机关或政府主管部门依法要求，我们可能会披露您的个人信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 业务转让：在涉及合并、收购、资产转让或其他类似交易时，您的个人信息可能作为资产之一被转移。我们将要求新的持有方继续受本隐私政策的约束，否则将要求其重新取得您的授权同意。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. 未经授权的披露：除非获得您的明确同意，我们不会公开披露您的个人信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '4. 共享、转让、公开披露个人信息授权同意的例外',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '根据相关法律法规的规定，在以下情形中，我们可能在不征得您的授权同意的情况下共享、转让、公开披露您的个人信息：',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '    - 与国家安全、国防安全有关的；\n    - 与公共安全、公共卫生、重大公共利益有关的；\n    - 与刑事侦查、起诉、审判和判决执行等有关的；\n    - 出于维护您或其他个人的生命、财产等重大合法权益但又难以获得本人同意的；\n    - 您自行向社会公众公开的个人信息；\n    - 从合法公开披露的信息中收集到的个人信息，如合法的新闻报道、政府信息公开等渠道；\n    - 法律法规规定的其他情形。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '五、信息的存储和保护',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 信息存储：我们将在中华人民共和国境内或香港特别行政区存储我们获取的您的信息。如果发生数据的跨境传输，我们会以弹窗或邮件的方式单独告知您数据出境的目的、接收方等，并征得您的授权同意。我们将确保数据接收方具备充分的数据保护能力，以保护您的个人信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 安全措施：我们致力于采取符合业界标准的物理、电子和管理方面的安全措施来保护您的个人信息安全。我们积极建立数据分类分级制度、数据安全管理规范、数据安全开发规范，以管理和规范个人信息的存储和使用，确保不收集与我们提供的服务无关的个人信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. 安全事件处理：尽管我们将尽力确保您发送给我们的任何信息的安全性，但请您理解，由于技术的限制以及互联网行业可能存在的各种恶意手段，信息不可能始终保证百分之百的安全。您需要了解，您接入我们服务所用的系统和通讯网络，有可能因我们可控范围外的因素而出现问题。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '为防止安全事故的发生，我们制定了完善的预警机制和应急预案。如果不幸发生个人信息安全事件，我们将按照法律法规的要求，及时向您告知安全事件的基本情况和可能的影响、我们已采取或将要采取的处置措施、您可自主防范和降低风险的建议以及对您的补救措施，并立即启动应急预案，力求将损失降到最低。我们将通过电话、推送通知等方式及时告知您；如果难以逐一告知，我们会采取合理、有效的方式发布公告。同时，我们还将按照监管部门的要求，主动上报个人信息安全事件的处置情况，密切配合政府机关的工作。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '六、您的权利',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 访问和更正权：您有权访问并更新您的个人信息。若需行使上述权利，请通过本政策提供的联系方式与我们联系。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 删除和撤回同意权：在符合法律法规的情况下，您有权请求删除您的个人信息或撤回对我们的授权同意。请注意，删除或撤回同意可能导致我们无法继续为您提供部分或全部服务。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '七、未成年人保护',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们非常重视未成年人的个人信息保护。若您未满18周岁，您应在您的父母或法定监护人同意并指导下使用本应用，并在征得其同意的前提下向我们提供您的个人信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '八、隐私政策的更新',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '鉴于业务的发展或法律法规的变化，我们可能会适时修订本隐私政策。修订后的隐私政策将在本页面上发布，并自发布之日起生效。我们建议您定期查阅本政策，以了解最新的隐私保护措施。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '九、适用法律与争议解决',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本隐私政策的订立、生效、履行、解释及争议解决均适用中华人民共和国法律。因本隐私政策产生的任何争议，双方应友好协商解决；协商不成的，任何一方可向本应用所在地有管辖权的人民法院提起诉讼。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '十、联系我们',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MiSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '如您对本隐私政策有任何疑问、意见或建议，或需要行使您的相关权利，请通过以下方式与我们联系：\n电子邮箱：support@Gnayoah.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '我们将尽快审核所涉问题，并在收到您的请求后及时予以回复。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '感谢您对柚坛手表助手的信任与支持。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
