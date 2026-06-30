import 'package:flutter/material.dart';
import 'package:template/utils/app_colors.dart';
import 'package:template/utils/app_texts.dart';
import 'package:template/utils/custom_svg.dart';

// ──────────────────────────────────────────────
// CUSTOMIZABLE VARIABLES — Change these to style
// ──────────────────────────────────────────────

// Colors
const _topBorderColor = Color(0xff333333);
const _selectedColor = AppColors.green;
final _unselectedColor = AppColors.green.shade100;

// Sizing
const _borderRadius = 16.0;
const _verticalPadding = 10.0;
const _iconSize = 24.0;
const _labelSpacing = 5.0;

// Shadow
const _shadowOffset = Offset(0, 2);
const _shadowBlur = 16.0;
const _shadowAlpha = 27;

// Typography
final _labelStyle = AppTexts.tsmm;

// ──────────────────────────────────────────────

class CustomBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int)? onChanged;
  const CustomBottomNavbar({super.key, required this.index, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: _topBorderColor)),
        borderRadius: BorderRadius.vertical(top: Radius.circular(_borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: _shadowOffset,
            blurRadius: _shadowBlur,
            color: Colors.black.withAlpha(_shadowAlpha),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: _verticalPadding),
        child: Row(
          children: [
            // item("Home", AppIcons.home, 0),
            // item("Pool", AppIcons.pool, 1),
            // item("Settings", AppIcons.settings, 2),
          ],
        ),
      ),
    );
  }

  Widget item(String name, String icon, int pos) {
    bool isSelected = pos == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) onChanged!(pos);
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            CustomSvg(
              asset: icon,
              size: _iconSize,
              color: isSelected ? _selectedColor : _unselectedColor,
            ),
            const SizedBox(height: _labelSpacing),
            Text(
              name,
              style: _labelStyle.copyWith(
                color: isSelected ? _selectedColor : _unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
