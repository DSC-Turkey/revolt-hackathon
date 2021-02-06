import 'package:flutter/material.dart';

/// --------------------My imports --------------------------------
import 'package:revolt/theme/theme_colors.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get grey => copyWith(color: Colors.grey);
  TextStyle get subTitleColor => copyWith(color: ThemeColor.subTitleTextColor);
}

extension PaddingHelper on Widget {
  Padding get p16 => Padding(padding: EdgeInsets.all(16), child: this);

  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Horizontal Padding 16
  Padding get hPadding4 => Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: this);
  Padding get hPadding8  => Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: this);
  Padding get hPadding16 => Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: this);

  /// Vertical Padding 16
  Padding get vP16 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 16), child: this);
  Padding get vP8 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);
  Padding get vP4 =>
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child: this);
}

extension Extented on Widget {
  Expanded get extended => Expanded(
    child: this,
  );
}
extension CornerRadius on Widget {
  ClipRRect get circular=> ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(1000)),
    child: this,
  );
}
extension OnPressed on Widget {
  Widget  ripple(Function onPressed, {BorderRadiusGeometry borderRadius =const BorderRadius.all(Radius.circular(5))}) => Stack(
    children: <Widget>[
      this,
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius
            ),
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Container()),
      )
    ],
  );
}
/// Other values
/// --------------------------------------------------------------------
Duration kAnimationDuration = Duration(milliseconds: 200);
extension ExAlignment on Widget{
  Widget get alignTopCenter => Align(child: this,alignment: Alignment.topCenter,);
  Widget get alignCenter => Align(child: this,alignment: Alignment.center,);
  Widget get alignBottomCenter => Align(child: this,alignment: Alignment.bottomCenter,);
  Widget get alignBottomLeft => Align(child: this,alignment: Alignment.bottomLeft,);
}


///  This section provides all necessary configs
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

/// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  /// 812 is the layout height that most smartphones use
  return (inputHeight / 812.0) * screenHeight;
}

/// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  /// 375 is the layout width that most phone use
  return (inputWidth / 375.0) * screenWidth;
}