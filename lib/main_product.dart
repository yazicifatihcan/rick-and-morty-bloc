import 'app.dart';
import 'app/constants/app_constants.dart';
import 'app/enums/general_enum.dart';
import 'app/models/general/config/environment_config_model.dart';


/// To run the app from Command line -> 
/// flutter run --flavor product lib/main_product.dart
void main() {
  run(
    EnvironmentConfigModel(
        appName: generalAppName,
        environment: AppEnvironment.Production,
        apiBaseUrl: 'rickandmortyapi.com',
      )
  );
}
