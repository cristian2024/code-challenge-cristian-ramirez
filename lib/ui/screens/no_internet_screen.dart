import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_can_haz_dad_joke/app.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  /// this subscription is used for check internet connection
  late StreamSubscription<InternetStatus> listener;

  @override
  void initState() {
    listener = InternetConnection().onStatusChange.listen(onStatusChange);
    super.initState();
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  void onStatusChange(InternetStatus status) {
    if (status == InternetStatus.connected) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const App(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_connected_no_internet_4_rounded,
              size: 96,
            ),
            Text(
              'There is no internet connection',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
