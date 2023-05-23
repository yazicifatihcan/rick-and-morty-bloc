import 'dart:async';
import 'dart:io';

class ConnectionService {
  ConnectionService._();
  static final _instance = ConnectionService._();
  static ConnectionService get instance => _instance;

  final String _checkInternetURL = 'google.com';

  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup(_checkInternetURL);
      final isActive = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      return isActive;
    } catch (e) {
      return false;
    }
  }
}
