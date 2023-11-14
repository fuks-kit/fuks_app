import 'dart:async';

import 'package:flutter/material.dart';

class AccessTimer extends StatefulWidget {
  const AccessTimer({
    super.key,
    required this.duration,
  });

  final Duration duration;

  static void showSnackBar(BuildContext context, Duration duration) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration,
      content: AccessTimer(duration: duration),
      backgroundColor: Colors.greenAccent,
    ));
  }

  @override
  State createState() => _AccessTimerState();
}

class _AccessTimerState extends State<AccessTimer> {
  late Timer _timer;
  late Duration _leftTime;

  @override
  void initState() {
    super.initState();

    _leftTime = widget.duration;

    const tick = Duration(milliseconds: 1000);
    _timer = Timer.periodic(tick, (timer) {
      if (widget.duration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() => _leftTime -= tick);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Tür ist offen',
          style: TextStyle(color: Colors.black),
        ),
        const Spacer(),
        SizedBox(
          width: 24,
          height: 24,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value:
                    _leftTime.inMilliseconds / widget.duration.inMilliseconds,
                color: Colors.black,
              ),
              Text(
                '${_leftTime.inSeconds}',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
