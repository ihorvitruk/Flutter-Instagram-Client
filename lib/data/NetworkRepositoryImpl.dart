import 'package:connectivity/connectivity.dart';
import 'package:flutter_instagram_client/domain/repository/NetworkRepository.dart';

class NetworkRepositoryImpl extends NetworkRepository {
  @override
  Future<bool> checkConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return Future.value(connectivityResult != ConnectivityResult.none);
  }
}
