import 'package:connectivity/connectivity.dart';
import 'package:flutter_telegram_client/domain/NetworkRepository.dart';

class NetworkRepositoryImpl extends NetworkRepository {
  @override
  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return Future.value(connectivityResult != ConnectivityResult.none);
  }
}
