import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> checkConnect() async {
    var con = await Connectivity().checkConnectivity();

    if (con == ConnectivityResult.wifi || con == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}
