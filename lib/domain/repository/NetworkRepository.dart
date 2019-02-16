import 'package:connectivity/connectivity.dart';

abstract class NetworkRepository {
  Future<ConnectivityResult> checkConnection();
}
