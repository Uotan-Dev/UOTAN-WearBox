import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

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
                        '用户协议', // 页面标题
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
        padding:
            EdgeInsets.only(left: 30.0, right: 30, bottom: 30, top: 20), // 设置页面内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '柚坛手表助手用户协议',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 2),
            Text(
              '更新日期：2024年9月18日',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '在使用柚坛手表助手（以下简称“本应用”或“我们”）之前，请仔细阅读并充分理解本用户协议（以下简称“本协议”）。本协议是您（以下简称“用户”或“您”）与柚坛手表助手之间就使用本应用所订立的具有法律约束力的协议。您下载、安装或以其他方式使用本应用，即表示您已阅读、理解并同意接受本协议的全部条款和条件。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '一、 隐私政策的独立性',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
          

           
          
            SizedBox(height: 6),
            Text(
              '柚坛社区的隐私政策与柚坛手表助手的隐私政策完全独立，互不关联。如您需要查阅柚坛社区的隐私政策，敬请前往柚坛社区官方网站。本应用的隐私政策仅适用于柚坛手表助手，特此声明。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '二、协议的接受与变更',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 协议的接受',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '您在使用本应用前，应认真阅读本协议的全部内容。如果您不同意本协议的任何条款，您应立即停止使用本应用。您的下载、安装或使用行为即视为您已阅读并同意接受本协议的约束。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 协议的修改',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们保留根据业务发展或法律法规的变化，随时对本协议进行修订的权利，且无需另行个别通知您。修订后的协议一经发布，立即生效。您有义务自行查阅本协议的最新版本；若您在协议内容变更后继续使用本应用，视为您已接受修订后的协议内容。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '三、服务内容与使用规范',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 服务内容',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本应用为用户提供与手表相关的辅助功能和服务，包括但不限于时间显示、闹钟设定、健康监测等。具体服务内容以本应用实际提供的功能为准。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 服务的变更、中断或终止',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们有权根据实际情况，随时调整、暂停或终止部分或全部服务，且无需事先通知您。对于因服务的调整、暂停或终止所导致的任何损失，我们不承担任何责任。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '四、用户行为准则',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 合法合规使用',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '您承诺依法使用本应用，不得利用本应用从事任何违反法律法规、社会公德或侵犯他人合法权益的行为，包括但不限于：',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '• 侵犯知识产权：不得未经授权复制、传播、修改或以其他方式使用受版权、商标权、专利权等法律保护的内容。',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '• 发布不当信息：不得发布、传播含有淫秽、色情、赌博、暴力、恐怖、迷信、诽谤、侮辱、煽动、教唆犯罪等法律法规禁止的内容。',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '• 危害系统安全：不得实施任何破坏或试图破坏网络安全的行为，包括但不限于传播恶意程序、病毒、木马、蠕虫等，攻击本应用的服务器、网络或其他用户的设备。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 遵守法律法规',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '您在使用本应用时，应严格遵守《中华人民共和国网络安全法》、《中华人民共和国民法典》等相关法律法规，不得利用本应用从事任何违法犯罪活动。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '五、知识产权保护',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 权利归属',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本应用及其所有内容，包括但不限于文字、图形、界面设计、视觉效果、标识、商标、计算机代码、程序、软件、服务、文档等，均受《中华人民共和国著作权法》、《中华人民共和国商标法》、《中华人民共和国专利法》等法律法规的保护，相关权利归属Gnayoah或其授权人所有。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 许可使用',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们授予您一项个人的、不可转让的、非独占性的、可撤销的有限许可，允许您按照本协议的规定下载、安装和使用本应用。除非事先取得我们的书面同意，您不得以任何方式复制、修改、分发、出售、转让或以其他方式利用本应用的任何部分。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. 禁止行为',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '未经我们或相关权利人书面授权，您不得以任何形式实施、利用、转让或许可任何第三方实施、利用或转让上述知识产权，包括但不限于对本应用进行反向工程、反向编译、反向汇编、破解等。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '六、隐私政策与数据保护',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 个人信息保护',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们非常重视用户的个人信息保护，并将严格按照本应用的《隐私政策》及相关法律法规的规定，收集、使用、存储和分享您的个人信息。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 政策的接受',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '您在使用本应用时，表示您已阅读并同意我们的《隐私政策》的全部内容。如您不同意《隐私政策》的任何内容，请立即停止使用本应用。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '七、免责声明与责任限制',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 服务的现状提供',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本应用以“现状”和“可提供”为基础向您提供服务。我们不对本应用的持续性、及时性、安全性、准确性、完整性或可靠性作任何明示或默示的保证。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 责任限制',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '在适用法律允许的最大范围内，对于因使用或无法使用本应用所导致的任何直接、间接、偶然、特殊、后果性或惩罚性损害赔偿，包括但不限于利润损失、数据丢失、业务中断等，我们不承担任何责任。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. 第三方责任',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '对于您通过本应用访问的任何第三方网站、服务或资源的内容、准确性、合法性或可靠性，我们不承担任何责任。您应自行承担因使用第三方服务所产生的风险。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '八、违约责任与救济措施',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 违约处理',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '若您违反本协议或相关法律法规的规定，我们有权在不事先通知的情况下，采取包括但不限于警告、限制、暂停或终止您对本应用的访问和使用，保存有关记录，并依法追究您的法律责任。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 赔偿责任',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '因您违反本协议或相关法律法规的规定，导致我们或任何第三方遭受损失，您应依法承担全部赔偿责任，包括但不限于直接损失、间接损失、预期利益损失、诉讼费、律师费等。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '九、协议的终止与后果',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 我们的终止权',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们有权基于自身业务考虑，在任何时间、以任何理由，终止本协议、限制、暂停或终止您对本应用的访问和使用，且无需事先通知。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 用户的终止权',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '您可随时停止使用本应用。停止使用本应用并不代表本协议的终止，本协议中关于知识产权、责任限制、适用法律等条款在您停止使用本应用后仍然具有法律效力。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '十、不可抗力条款',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '对于因我们合理控制范围以外的原因（包括但不限于自然灾害、战争、恐怖活动、政府行为、法律法规或政策的变化、网络故障、黑客攻击等）导致的服务中断或其他缺陷，我们不承担任何责任。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '十一、适用法律与争议解决',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 适用法律',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本协议的订立、生效、履行、解释及争议解决均适用中华人民共和国法律（为本协议之目的，不包括香港特别行政区、澳门特别行政区和台湾地区的法律）。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 争议解决',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '因本协议引起的或与本协议有关的任何争议，双方应首先通过友好协商解决；协商不成的，任何一方均可向我们所在地有管辖权的人民法院提起诉讼。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '十二、解释权',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本协议的最终解释权归柚坛手表助手所有。我们保留对本协议的全部和最终的解释、修改和更新的权利。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '十三、其他条款',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '1. 完整协议',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '本协议（包括《隐私政策》）构成双方就本协议事项达成的完整协议，取代双方先前的任何书面或口头协议、承诺或陈述。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '2. 条款的独立性',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '若本协议的任何条款被有管辖权的法院认定为无效或不可执行，该条款应在必要的最小范围内被限制或删除，而本协议的其余条款的有效性和可执行性不受影响。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '3. 权利的放弃',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '我们未能或延迟行使本协议项下的任何权利或救济，不应视为对该权利或救济的放弃，亦不影响我们在将来行使该权利或救济的能力。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '4. 通知与送达',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '您同意我们可通过电子邮件、短信、应用内通知或公告等方式向您发送与本协议或本应用有关的通知。上述通知一经发送，即视为已送达收件人。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '十四、联系我们',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'OPPOSansMed',
              ),
            ),
            SizedBox(height: 6),
            Text(
              '如您对本协议有任何疑问、意见或建议，请通过以下方式与我们联系：',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '电子邮箱：support@Gnayoah.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '我们将在合理的时间内回复您的请求。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '感谢您选择柚坛手表助手！',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  
}
