import '../libs/app/size_config.dart';
import '../constants/app_constants.dart';

extension WidgetsScale on num {
  double get horizontalScale => this * (SizeConfig.screenWidth / designScreenWidth);
  double get verticalScale => this * (SizeConfig.screenHeight / designScreenHeight);
}
