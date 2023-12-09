import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GeneralFunctions {
  static String formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static String convertToAMPM(TimeOfDay time) {
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = time.hourOfPeriod;
    int minute = time.minute;

    // Formatting hour to be in 12-hour format
    if (hour == 0) {
      hour = 12;
    }

    // Adding leading zeros to minutes if needed
    String formattedMinute = minute < 10 ? '0$minute' : '$minute';

    return '$hour:$formattedMinute $period';
  }

  static Stream<String> countdownStream(Duration duration) async* {
    int secondsRemaining = duration.inSeconds;

    // Simulate a countdown timer
    const oneMinute = Duration(minutes: 1);
    while (secondsRemaining >= 0) {
      int days = secondsRemaining ~/ (3600 * 24);
      int hours = (secondsRemaining ~/ 3600) % 24;
      int minutes = (secondsRemaining ~/ 60) % 60;

      String formattedString = '${days.toString().padLeft(2, '0')}:'
          '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}';

      yield formattedString; // Emit the formatted countdown string

      await Future.delayed(oneMinute); // Wait for one minute
      secondsRemaining -= 60; // Decrement by one minute (60 seconds)
    }

    yield '00:00:00'; // Emit final value when the countdown finishes
  }
  

  static Future<File?> getImage() async {
    File? image;
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);

      // uploadImageToFirebase();
      return image;
    } else {
      return null;
    }
  }
}
