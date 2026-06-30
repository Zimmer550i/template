import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/utils/app_colors.dart';
import 'package:template/utils/app_icons.dart';
import 'package:template/utils/app_texts.dart';
import 'package:template/utils/custom_svg.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Colors
final _backgroundColor = AppColors.green[600]!;
final _titleColor = AppColors.green[50]!;
final _dividerColor = AppColors.green.shade300;

// Sizing
const _appBarHeight = 44.0;
const _leadingStartPadding = 12.0;
const _leadingSize = 32.0;
const _leadingRadius = 8.0;
const _titleLeftPadding = 18.0;
const _dividerHeight = 0.5;

// Typography
final _titleStyle = AppTexts.tsmr;

// Icons
const _backIcon = AppIcons.back;

// ──────────────────────────────────────────────

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  const CustomAppBar({super.key, required this.title, this.hasLeading = true});

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _backgroundColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: _appBarHeight,
        child: Row(
          children: [
            SizedBox(width: _leadingStartPadding),
            InkWell(
              onTap: () => hasLeading ? Get.back() : null,
              borderRadius: BorderRadius.circular(_leadingRadius),
              child: SizedBox(
                height: _leadingSize,
                width: _leadingSize,
                child: hasLeading
                    ? Center(child: CustomSvg(asset: _backIcon))
                    : const SizedBox(),
              ),
            ),
            const SizedBox(width: _titleLeftPadding),
            Text(
              title,
              style: _titleStyle.copyWith(color: _titleColor),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(_dividerHeight),
        child: Container(
          height: _dividerHeight,
          width: double.infinity,
          color: _dividerColor,
        ),
      ),
    );
  }
}
