

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

Future<String> chooseDate({required BuildContext context}) async {
  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1)))) &&
        (day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
      return true;
    }
    return false;
  }
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: green016E69, // <-- SEE HERE
            onPrimary: Colors.white, // <-- SEE HERE
            onSurface: Colors.black, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: green016E69, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
    initialDate: DateTime(DateTime.now().year - 18, DateTime.now().month),
    firstDate: DateTime(DateTime.now().year - 117),
    lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month),
    errorFormatText: "Enter Valid Date",
    errorInvalidText: "Enter Valid Date range",
    cancelText: "Close",
    confirmText: "Confirm",
    selectableDayPredicate: disableDate,
  );
  if (pickedDate != null) {
    return DateFormat("dd/MM/yyyy").format(pickedDate).toString();
  }else{
    return "";
  }

}

// dateformatter
String dateformaterFuncDate({required String inputString}){
  final DateTime inputDateTime = DateTime.parse(inputString);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(inputDateTime);
  return formatted;
}




