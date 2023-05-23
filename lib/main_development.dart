import 'app.dart';
import 'app/constants/app_constants.dart';
import 'app/enums/general_enum.dart';
import 'app/models/general/config/environment_config_model.dart';

/// To run the app from Comman line -> 
/// flutter run --flavor development lib/main_development.dart
void main() {
  run(
    EnvironmentConfigModel(
        appName: generalAppName + AppEnvironment.Development.name,
        environment: AppEnvironment.Development,
        apiBaseUrl: 'rickandmortyapi.com',
      )
  );
}
