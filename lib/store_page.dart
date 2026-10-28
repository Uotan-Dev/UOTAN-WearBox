import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:window_manager/window_manager.dart';

import 'app_theme.dart';
import 'l10n/l10n.dart';

/// 应用商店（占位页，功能开发中）
class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final AppPalette palette = context.palette;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onPanStart: (details) => windowManager.startDragging(),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      l10n.storeTitle,
                      style: TextStyle(
                        color: palette.text,
                        fontSize: 26,
                        fontFamily: 'MiSansLight',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/sidebar/store.svg',
              width: 56,
              height: 56,
              colorFilter: ColorFilter.mode(palette.disabled, BlendMode.srcIn),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.storeComingSoon,
              style: TextStyle(fontSize: 16, color: palette.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
