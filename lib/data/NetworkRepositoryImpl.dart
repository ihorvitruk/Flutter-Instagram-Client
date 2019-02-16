import 'package:connectivity/connectivity.dart';
import 'package:flutter_instagram_client/domain/repository/NetworkRepository.dart';

class NetworkRepositoryImpl extends NetworkRepository {
  @override
  Future<ConnectivityResult> checkConnection() async {
    return await (Connectivity().checkConnectivity());
  }
}
