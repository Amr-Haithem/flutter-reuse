import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/general_functions.dart';

class TextRemainingDurationCounter extends StatefulWidget {
  const TextRemainingDurationCounter(
      {super.key, required this.remainingDuration, required this.textStyle,required this.title});
  final Duration remainingDuration;
  final TextStyle textStyle;
  final String title;
  @override
  State<TextRemainingDurationCounter> createState() =>
      _TextRemainingDurationCounterState();
}

class _TextRemainingDurationCounterState
    extends State<TextRemainingDurationCounter> {
  String remainingTimeText = "00:00:00";

  fireCounter() {
    GeneralFunctions.countdownStream(widget.remainingDuration)
        .listen((updatedString) {
      print(updatedString);
      setState(() {
        remainingTimeText = updatedString;
      });
      print(remainingTimeText);
    });
  }

  @override
  void initState() {
    fireCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: widget.textStyle,
        ),
        Text(
          remainingTimeText,
          style: widget.textStyle,
        ),
      ],
    );
  }
}
