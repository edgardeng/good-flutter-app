import 'package:base_library/src/res/index.dart';
import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
    fontWeight: FontWeight.bold,
  );
  static TextStyle listTitle2 = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
  );
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_normal,
  );
  static TextStyle listContent2 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
  );
  static TextStyle listExtra2 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_normal,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: Dimens.font_sp18,
    color: Colours.text_dark,
  );

  static const TextStyle textSize12 = const TextStyle(
    fontSize: Dimens.font_sp12,
  );
  static const TextStyle textSize16 = const TextStyle(
    fontSize: Dimens.font_sp16,
  );
  static const TextStyle textBold14 = const TextStyle(
      fontSize: Dimens.font_sp14,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBold16 = const TextStyle(
      fontSize: Dimens.font_sp16,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBold18 = const TextStyle(
      fontSize: Dimens.font_sp18,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBold24 = const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textBold26 = const TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold
  );

  static const TextStyle textGray14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static const TextStyle textDarkGray14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_text_gray,
  );

  static const TextStyle textWhite14 = const TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.white,
  );

  static const TextStyle text = const TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text,
      // https://github.com/flutter/flutter/issues/40248
      textBaseline: TextBaseline.alphabetic
  );
  static const TextStyle textDark = const TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.dark_text,
      textBaseline: TextBaseline.alphabetic
  );

  static const TextStyle textGray12 = const TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.text_gray,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textDarkGray12 = const TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.dark_text_gray,
      fontWeight: FontWeight.normal
  );

  static const TextStyle textHint14 = const TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.dark_unselected_item_color
  );
}

class Decorations {
  static Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider)));
}

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);
  static Widget hGap30 = new SizedBox(width: Dimens.gap_dp30);


  /// 垂直间隔
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);

  static Widget getHGap(double w) {
    return SizedBox(width: w);
  }

  static Widget getVGap(double h) {
    return SizedBox(height: h);
  }
}
