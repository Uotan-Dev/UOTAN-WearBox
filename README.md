[简体中文](https://github.com/Gnayoah/watch_assistant/blob/main/readme_cn.md)

# Uotan Watch Assistant

Uotan Watch Assistant, independently designed and developed by [Gnayoah](https://github.com/Gnayoah), was released in February 2020. It aims to provide a streamlined and efficient management tool for users unfamiliar with ADB (Android Debug Bridge) commands. As a collaborative project with the Uotan Community (uotan.cn), Uotan Watch Assistant embodies the principles of open-source, free, and practical design, offering a comprehensive suite of smartwatch management features for a wide range of users.

# Frequently Asked Questions (FAQ)

### 1. **Why is my device unable to connect or detected by the system?**

Ensure that **USB Debugging** is enabled on your device, and when prompted during connection, confirm that **USB Debugging Authorization** has been granted. This is a critical prerequisite for communication between the Uotan Watch Assistant and your device.

### 2. **How do I activate USB Debugging mode on my device?**

Follow these steps meticulously to enable USB Debugging:
- Navigate to **Settings**, then proceed to **About Phone**.
- Tap **Build Number** multiple times until the system notifies you that Developer Mode has been activated.
- Return to the **Settings** main screen and locate **Developer Options**.
- Within Developer Options, toggle **USB Debugging** to enable this functionality.

### 3. **Why does my device display ADB Debugging instead of USB Debugging?**

**ADB Debugging** and **USB Debugging** are essentially identical in purpose and functionality. **ADB** (Android Debug Bridge) is the protocol through which USB Debugging communicates, hence both terms refer to the same process of establishing a connection between your device and a computer for development and debugging purposes.

### 4. **How can I connect wirelessly?**

To establish a wireless debugging connection, please ensure the following conditions are met:
- Both your computer and smartwatch must be connected to the same local network (whether it be a 2.4GHz or 5GHz network, the key is that both devices must reside on the same IP subnet).
- On your watch, access **Developer Options** and enable either **Wireless Debugging** or **WLAN Debugging**.
- If your device operates on the WearOS by Google system, it also supports Bluetooth pairing. In this case, enable **Bluetooth Debugging** in the Developer Options.

Once these settings are configured, Uotan Watch Assistant will seamlessly communicate with the smartwatch over the network.

### 5. **How do I retrieve the IP address and port number for Wireless Debugging?**

To obtain the IP address and port number for wireless debugging:
- Navigate to the watch’s **Developer Options**.
- Locate and click on **Wireless Debugging Information**. Here, you will find the relevant details, including the IP address and port number needed to establish a connection.

### 6. **Why are some functions unresponsive?**

Certain functionalities may be restricted due to limitations imposed by customized Android operating systems. Uotan Watch Assistant supports 90% of features on modified Android systems, including popular devices such as **OPPO Watch** and **Meizu Watch**. However, for devices running **WearOS by Google**, such as **Pixel Watch**, **Mi Watch**, and **TicWatch**, 99% of the functions are fully supported.

In the case of unresponsiveness, we recommend retrying the action multiple times. If the issue persists, it may be attributable to system-level restrictions.
