import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ia/core/exception/app_exception.dart';

abstract class InternetConnectionService {
  Future<void> checkConnectivityState();
  void listenConnectivityChanges({
    required Function()? onConnected,
    required Function()? onDisconnected,
  });
}

@LazySingleton(as: InternetConnectionService)
class InternetConnectionServiceImpl implements InternetConnectionService {
  final Connectivity connectivity;

  InternetConnectionServiceImpl({required this.connectivity});

  @override
  Future<void> checkConnectivityState() async {
    try {
      final result = await connectivity.checkConnectivity();

      if (result.contains(ConnectivityResult.wifi)) {
        return;
      } else if (result.contains(ConnectivityResult.mobile)) {
        return;
      } else if (result.contains(ConnectivityResult.ethernet)) {
        return;
      } else if (result.contains(ConnectivityResult.vpn)) {
        return;
      } else if (result.contains(ConnectivityResult.other)) {
        return;
      } else {
        throw InternetConnectionException();
      }
    } on Exception catch (e) {
      throw InternetConnectionException(data: e.toString());
    }
  }

  @override
  void listenConnectivityChanges({
    required Function()? onConnected,
    required Function()? onDisconnected,
  }) {
    connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.wifi)) {
        onConnected?.call();
      } else if (result.contains(ConnectivityResult.mobile)) {
        onConnected?.call();
      } else if (result.contains(ConnectivityResult.ethernet)) {
        onConnected?.call();
      } else if (result.contains(ConnectivityResult.vpn)) {
        onConnected?.call();
      } else if (result.contains(ConnectivityResult.other)) {
        onConnected?.call();
      } else {
        onDisconnected?.call();
      }
    });
  }
}
