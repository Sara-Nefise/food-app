import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get veylowValue => height * 0.005;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.015;
  double get normalWidthValue => width * 0.024;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get pagePadding => const EdgeInsets.all(10.0);
  EdgeInsets get searchPadding => const EdgeInsets.all(15.0);
}

extension BorderExtension on BuildContext {
  BorderRadius get radiusAll => const BorderRadius.all(Radius.circular(10));
}

extension DecorationExtension on BuildContext {
  BoxDecoration get imageDecoration => const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/page.png'),
        fit: BoxFit.cover,
      ));
  BoxDecoration get cardDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(15), color: AppColors.milkWhite);
  BoxDecoration get listTile => BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.milkWhite,
      );
}

extension EmptySizedBox on BuildContext {
  SizedBox get emptyLowBox => SizedBox(height: lowValue);
  SizedBox get emptyMeduimBox => SizedBox(height: normalValue);
  SizedBox get emptyVeryLowBox => SizedBox(height: veylowValue);
  SizedBox get emptyMeduimWidth => SizedBox(width: normalWidthValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingNormalRigth => EdgeInsets.only(right: normalValue);
  EdgeInsets get paddingCategory =>
      const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5);

  EdgeInsets get paddinglistTile =>
      const EdgeInsets.only(right: 20, top: 5, bottom: 5);
  EdgeInsets get panddingBottomList => const EdgeInsets.only(bottom: 15);

  EdgeInsets get paddingWideField =>
      const EdgeInsets.only(top: 90, bottom: 30, left: 20, right: 20);
  EdgeInsets get paddingdetailField =>
      const EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20);
  EdgeInsets get paddingTipDetailField =>
      const EdgeInsets.only(top: 70, bottom: 70, left: 20, right: 20);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
}
