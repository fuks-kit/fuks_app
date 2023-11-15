import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

const _challengeServiceUUIDPrefix = "4deb699e";

class ChallengeService {
  static StreamSubscription? _scanResultsSubscription;

  static final _doormanChallengeStream = StreamController<String>.broadcast();

  static String? _challenge;

  static void dispose() {
    _doormanChallengeStream.close();

    FlutterBluePlus.stopScan();
    _scanResultsSubscription?.cancel();
    _scanResultsSubscription = null;
  }

  static void init() async {
    if (_scanResultsSubscription != null) {
      return;
    }

    final supported = await FlutterBluePlus.isSupported;
    if (!supported) {
      print("BLE not supported");
      return;
    }

    print("Init BLE challenge service ${DateTime.now()}");

    _scanResultsSubscription = FlutterBluePlus.scanResults.listen(
      (results) async {
        // print("results: ${results.length}");

        for (final result in results) {
          // print("result: ${result.device.platformName}");

          for (var uuid in result.advertisementData.serviceUuids) {
            // print("uuid: $uuid");

            if (!uuid.str.startsWith(_challengeServiceUUIDPrefix)) {
              continue;
            }

            if (_challenge != uuid.str) {
              print("*** Set challenge: ${DateTime.now()} $uuid");
              _challenge = uuid.str;
              _doormanChallengeStream.add(uuid.str);
            }
          }
        }
      },
      onError: (err) {
        print("err: $err");
        _doormanChallengeStream.addError(err);
      },
    );

    FlutterBluePlus.startScan(
      continuousDivisor: 1,
    );
  }

  static Stream<String> stream() async* {
    if (_challenge != null) {
      yield _challenge!;
    }

    for (;;) {
      final challenge = await _doormanChallengeStream.stream.first;
      yield challenge;
    }
  }
}
