import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilServices {
  static String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  static final cpfFormatter = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static final cpftelefone = MaskTextInputFormatter(
    mask: "(##) ##### ####",
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError
          ? Color.fromARGB(255, 248, 2, 2)
          : Color.fromARGB(255, 255, 254, 254),
      textColor: isError
          ? Color.fromARGB(255, 255, 255, 255)
          : Color.fromARGB(255, 7, 7, 7),
      fontSize: 14,
    );
  }
}
