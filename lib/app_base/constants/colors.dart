import 'package:flutter/cupertino.dart';

// for the alpha value i used value from this list : https://gist.github.com/creativecreatorormaybenot/8710f6f752f6a0f2cae13abb538f0e8e
// binary calculator : http://www.binaryhexconverter.com/decimal-to-hex-converter
// basically is 255 * opacity percentage then roundup then convert to hexadecimal value
// 24 = 61.2 => 61 => 3D
// 16 = 40.8 => 41 => 29
// 10 = 25.5 => 26 => 1A

class AppColors {
  AppColors._();

  /// custom color fot theme
  static const Color primary = Color(0xFF3CCABC);
  static const Color accent = Color(0xFF2C3E50);
  static const Color white50 = Color(
    0x80FFFFFF,
  ); // white with alpha 50, seems like not included in AlignUI
  static const Color overlay = Color(0x3E020D17);
  static const Gradient gradientBg = LinearGradient(
    colors: [Color(0x40FFFFFF), Color(0x80648DB6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const BoxShadow regularShadowXSmall = BoxShadow(
    color: Color(0x080A0D14),
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  static const BoxShadow regularShadowMedium = BoxShadow(
    color: Color(0x1A0B121B),
    offset: Offset(0, 16),
    blurRadius: 32,
    spreadRadius: -12,
  );

  // for switch toggle box shadow
  static const BoxShadow toggleSwitchSmall = BoxShadow(
    color: Color(0x080E121B),
    offset: Offset(0, 2),
    blurRadius: 10,
    spreadRadius: 0,
  );

  // for switch toggle box shadow
  static const BoxShadow toggleSwitchMedium = BoxShadow(
    color: Color(0x0F0E121B),
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow durationPickerSmall = BoxShadow(
    color: Color(0x14000000),
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow durationPickerMedium = BoxShadow(
    color: Color(0x05000000),
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow logListingSmall = BoxShadow(
    color: Color(0x14000000),
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow logListingMedium = BoxShadow(
    color: Color(0x05000000),
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow navigationBarSmall = BoxShadow(
    color: Color(0x14000000),
    offset: Offset(0, -2),
    blurRadius: 2,
    spreadRadius: 0,
  );

  static const BoxShadow navigationBarMedium = BoxShadow(
    color: Color(0x05000000),
    offset: Offset(0, 0),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static const BoxShadow navigationBarButtonSmall = BoxShadow(
    color: Color(0x14000000),
    offset: Offset(0, -2),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow navigationBarButtonMedium = BoxShadow(
    color: Color(0x05000000),
    offset: Offset(0, 0),
    blurRadius: 6,
    spreadRadius: 0,
  );

  /// this is from Align UI
  // neutral colors
  static const Color neutral950 = Color(0xFF0E121B);
  static const Color neutral900 = Color(0xFF181B25);
  static const Color neutral800 = Color(0xFF222530);
  static const Color neutral700 = Color(0xFF2B303B);
  static const Color neutral600 = Color(0xFF525866);
  static const Color neutral500 = Color(0xFF717784);
  static const Color neutral400 = Color(0xFF99A0AE);
  static const Color neutral300 = Color(0xFFCACFD8);
  static const Color neutral200 = Color(0xFFE1E4EA);
  static const Color neutral100 = Color(0xFFF2F5F8);
  static const Color neutral50 = Color(0xFFF5F7FA);
  static const Color neutral0 = Color(0xFFFFFFFF);

  // blue
  static const Color blue950 = Color(0xFF122368);
  static const Color blue900 = Color(0xFF182F8B);
  static const Color blue800 = Color(0xFF1F3BAD);
  static const Color blue700 = Color(0xFF2547D0);
  static const Color blue600 = Color(0xFF3559E9);
  static const Color blue500 = Color(0xFF335CFF);
  static const Color blue400 = Color(0xFF6895FF);
  static const Color blue300 = Color(0xFF97BAFF);
  static const Color blue200 = Color(0xFFC0D5FF);
  static const Color blue100 = Color(0xFFD5E2FF);
  static const Color blue50 = Color(0xFFEBF1FF);

  // orange
  static const Color orange950 = Color(0xFF683412);
  static const Color orange900 = Color(0xFF8B4618);
  static const Color orange800 = Color(0xFFAD581F);
  static const Color orange700 = Color(0xFFD06925);
  static const Color orange600 = Color(0xFFE97D35);
  static const Color orange500 = Color(0xFFFF9147);
  static const Color orange400 = Color(0xFFFFA468);
  static const Color orange300 = Color(0xFFFFC197);
  static const Color orange200 = Color(0xFFFFD9C0);
  static const Color orange100 = Color(0xFFFFE6D5);
  static const Color orange50 = Color(0xFFFFF3EB);

  // red
  static const Color red950 = Color(0xFF681219);
  static const Color red900 = Color(0xFF8B1822);
  static const Color red800 = Color(0xFFAD1F2B);
  static const Color red700 = Color(0xFFD02533);
  static const Color red600 = Color(0xFFE93544);
  static const Color red500 = Color(0xFFFB3748);
  static const Color red400 = Color(0xFFFF6875);
  static const Color red300 = Color(0xFFFF97A0);
  static const Color red200 = Color(0xFFFFC0C5);
  static const Color red100 = Color(0xFFFFD5D8);
  static const Color red50 = Color(0xFFFFEBEC);

  // green
  static const Color green950 = Color(0xFF0B4627);
  static const Color green900 = Color(0xFF16643B);
  static const Color green800 = Color(0xFF1A7544);
  static const Color green700 = Color(0xFF178C4E);
  static const Color green600 = Color(0xFF1DAF61);
  static const Color green500 = Color(0xFF1FC16B);
  static const Color green400 = Color(0xFF3EE089);
  static const Color green300 = Color(0xFF84EBB4);
  static const Color green200 = Color(0xFFC2F5DA);
  static const Color green100 = Color(0xFFD0FBE9);
  static const Color green50 = Color(0xFFE0FAEC);

  // yellow
  static const Color yellow950 = Color(0xFF624C18);
  static const Color yellow900 = Color(0xFF86661D);
  static const Color yellow800 = Color(0xFFA78025);
  static const Color yellow700 = Color(0xFFC99A2C);
  static const Color yellow600 = Color(0xFFE6A819);
  static const Color yellow500 = Color(0xFFF6B51E);
  static const Color yellow400 = Color(0xFFFFD268);
  static const Color yellow300 = Color(0xFFFFE097);
  static const Color yellow200 = Color(0xFFFFECC0);
  static const Color yellow100 = Color(0xFFFFEFCC);
  static const Color yellow50 = Color(0xFFFFF4D6);

  // purple
  static const Color purple950 = Color(0xFF351A75);
  static const Color purple900 = Color(0xFF3D1D86);
  static const Color purple800 = Color(0xFF4C25A7);
  static const Color purple700 = Color(0xFF5B2CC9);
  static const Color purple600 = Color(0xFF693EE0);
  static const Color purple500 = Color(0xFF7D52F4);
  static const Color purple400 = Color(0xFF8C71F6);
  static const Color purple300 = Color(0xFFA897FF);
  static const Color purple200 = Color(0xFFCAC0FF);
  static const Color purple100 = Color(0xFFDCD5FF);
  static const Color purple50 = Color(0xFFEFEBFF);

  // sky
  static const Color sky950 = Color(0xFF124B68);
  static const Color sky900 = Color(0xFF18658B);
  static const Color sky800 = Color(0xFF1F7EAD);
  static const Color sky700 = Color(0xFF2597D0);
  static const Color sky600 = Color(0xFF35ADE9);
  static const Color sky500 = Color(0xFF47C2FF);
  static const Color sky400 = Color(0xFF68CDFF);
  static const Color sky300 = Color(0xFF97DCFF);
  static const Color sky200 = Color(0xFFC0EAFF);
  static const Color sky100 = Color(0xFFD5F1FF);
  static const Color sky50 = Color(0xFFEBF8FF);

  // pink
  static const Color pink950 = Color(0xFF68123D);
  static const Color pink900 = Color(0xFF8B1852);
  static const Color pink800 = Color(0xFFAD1F66);
  static const Color pink700 = Color(0xFFD0257A);
  static const Color pink600 = Color(0xFFE9358F);
  static const Color pink500 = Color(0xFFFB4BA3);
  static const Color pink400 = Color(0xFFFF68B3);
  static const Color pink300 = Color(0xFFFF97CB);
  static const Color pink200 = Color(0xFFFFC0DF);
  static const Color pink100 = Color(0xFFFFD5EA);
  static const Color pink50 = Color(0xFFFFEBF4);

  // teal
  static const Color teal950 = Color(0xFF0B463E);
  static const Color teal900 = Color(0xFF16645A);
  static const Color teal800 = Color(0xFF1A7569);
  static const Color teal700 = Color(0xFF178C7D);
  static const Color teal600 = Color(0xFF1DAF9C);
  static const Color teal500 = Color(0xFF22D3BB);
  static const Color teal400 = Color(0xFF3FDEC9);
  static const Color teal300 = Color(0xFF84EBDD);
  static const Color teal200 = Color(0xFFC2F5EE);
  static const Color teal100 = Color(0xFFD0FBF5);
  static const Color teal50 = Color(0xFFE4FBF8);

  // alpha colors
  static const Color neutralAlpha24 = Color(0x3D99A0AE);
  static const Color neutralAlpha16 = Color(0x2999A0AE);
  static const Color neutralAlpha10 = Color(0x1A99A0AE);
  static const Color blueAlpha24 = Color(0x3D476CFF);
  static const Color blueAlpha16 = Color(0x29476CFF);
  static const Color blueAlpha10 = Color(0x1A476CFF);
  static const Color orangeAlpha24 = Color(0x3DFF9147);
  static const Color orangeAlpha16 = Color(0x29FF9147);
  static const Color orangeAlpha10 = Color(0x1AFF9147);
  static const Color redAlpha24 = Color(0x3DFB3748);
  static const Color redAlpha16 = Color(0x29FB3748);
  static const Color redAlpha10 = Color(0x1AFB3748);
  static const Color greenAlpha24 = Color(0x3D1FC16B);
  static const Color greenAlpha16 = Color(0x291FC16B);
  static const Color greenAlpha10 = Color(0x1A1FC16B);
  static const Color yellowAlpha24 = Color(0x3DFBC64B);
  static const Color yellowAlpha16 = Color(0x29FBC64B);
  static const Color yellowAlpha10 = Color(0x1AFBC64B);
  static const Color skyAlpha24 = Color(0x3D47C2FF);
  static const Color skyAlpha16 = Color(0x2947C2FF);
  static const Color skyAlpha10 = Color(0x1A47C2FF);
  static const Color purpleAlpha24 = Color(0x3D784DEF);
  static const Color purpleAlpha16 = Color(0x29784DEF);
  static const Color purpleAlpha10 = Color(0x1A784DEF);
  static const Color pinkAlpha24 = Color(0x3DFB4BA3);
  static const Color pinkAlpha16 = Color(0x29FB4BA3);
  static const Color pinkAlpha10 = Color(0x1AFB4BA3);
  static const Color tealAlpha24 = Color(0x3D22D3BB);
  static const Color tealAlpha16 = Color(0x2922D3BB);
  static const Color tealAlpha10 = Color(0x1A22D3BB);
  static const Color whiteAlpha24 = Color(0x3DFFFFFF);
  static const Color whiteAlpha16 = Color(0x29FFFFFF);
  static const Color whiteAlpha10 = Color(0x1AFFFFFF);
  static const Color blackAlpha24 = Color(0x3D0E121B);
  static const Color blackAlpha16 = Color(0x290E121B);
  static const Color blackAlpha10 = Color(0x1A0E121B);

  // primary
  static const Color primaryDark = AppColors.blue800;
  static const Color primaryDarker = AppColors.blue700;
  static const Color primaryBase = AppColors.blue500;
  static const Color primaryAlpha16 = AppColors.blueAlpha16;
  static const Color primaryAlpha10 = AppColors.blueAlpha10;

  // static
  static const Color staticBlack = AppColors.neutral950;
  static const Color staticWhite = AppColors.neutral0;

  // background
  static const Color bgStrong950 = AppColors.neutral950;
  static const Color bgSurface800 = AppColors.neutral800;
  static const Color bgSub300 = AppColors.neutral300;
  static const Color bgSoft200 = AppColors.neutral200;
  static const Color bgWeak50 = AppColors.neutral50;
  static const Color bgWhite0 = AppColors.neutral0;

  // text color
  static const Color textStrong950 = AppColors.neutral950;
  static const Color textSub600 = AppColors.neutral600;
  static const Color textSoft400 = AppColors.neutral400;
  static const Color textDisabled300 = AppColors.neutral300;
  static const Color textWhite0 = AppColors.neutral0;

  // stroke
  static const Color strokeStrong950 = AppColors.neutral950;
  static const Color strokeSub300 = AppColors.neutral300;
  static const Color strokeSoft200 = AppColors.neutral200;
  static const Color strokeWhite0 = AppColors.neutral0;

  // icon
  static const Color iconStrong950 = AppColors.neutral950;
  static const Color iconSub600 = AppColors.neutral600;
  static const Color iconSoft400 = AppColors.neutral400;
  static const Color iconDisabled300 = AppColors.neutral300;
  static const Color iconWhite0 = AppColors.neutral0;

  // faded
  static const Color fadedDark = AppColors.neutral800;
  static const Color fadedBase = AppColors.neutral500;
  static const Color fadedLight = AppColors.neutral200;
  static const Color fadedLighter = AppColors.neutral100;

  // information
  static const Color informationDark = AppColors.blue950;
  static const Color informationBase = AppColors.blue500;
  static const Color informationLight = AppColors.blue200;
  static const Color informationLighter = AppColors.blue50;

  //warning
  static const Color warningDark = AppColors.orange950;
  static const Color warningBase = AppColors.orange500;
  static const Color warningLight = AppColors.orange200;
  static const Color warningLighter = AppColors.orange50;

  //error
  static const Color errorDark = AppColors.red950;
  static const Color errorBase = AppColors.red500;
  static const Color errorLight = AppColors.red200;
  static const Color errorLighter = AppColors.red50;

  // success
  static const Color successDark = AppColors.green950;
  static const Color successBase = AppColors.green500;
  static const Color successLight = AppColors.green200;
  static const Color successLighter = AppColors.green50;

  //away
  static const Color awayDark = AppColors.yellow950;
  static const Color awayBase = AppColors.yellow500;
  static const Color awayLight = AppColors.yellow200;
  static const Color awayLighter = AppColors.yellow50;

  //feature
  static const Color featureDark = AppColors.purple950;
  static const Color featureBase = AppColors.purple500;
  static const Color featureLight = AppColors.purple200;
  static const Color featureLighter = AppColors.purple50;

  //verified
  static const Color verifiedDark = AppColors.sky950;
  static const Color verifiedBase = AppColors.sky500;
  static const Color verifiedLight = AppColors.sky200;
  static const Color verifiedLighter = AppColors.sky50;

  //highlighted
  static const Color highlightedDark = AppColors.pink950;
  static const Color highlightedBase = AppColors.pink500;
  static const Color highlightedLight = AppColors.pink200;
  static const Color highlightedLighter = AppColors.pink50;

  //stable
  static const Color stableDark = AppColors.teal950;
  static const Color stableBase = AppColors.teal500;
  static const Color stableLight = AppColors.teal200;
  static const Color stableLighter = AppColors.teal50;
}
