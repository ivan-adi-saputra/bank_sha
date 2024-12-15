import 'package:another_flushbar/flushbar.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

String formatCurrency(int number, {String symbol = "Rp "}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
  ).show(context);
}

Future<XFile?> selectImage() async {
  XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );

  return selectedImage;
}
