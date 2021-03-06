import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

///
/// GitScrum #MW-1
///
/// [NetworkInfo] interface is responsible for checking whether the device is connected to the Internet or not
///
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(
      this.connectionChecker,
      );

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
