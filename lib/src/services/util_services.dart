import 'package:flutter/painting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
          : Color.fromARGB(255, 132, 201, 47),
      textColor: Color.fromARGB(255, 255, 255, 255),

      fontSize: 14,
    );
  }

  final storage = const FlutterSecureStorage();

  Future<void> saveLocalData({
    required String key,
    required String data,
  }) async {
    await storage.write(key: key, value: data);
  }

  Future<String?> loadLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }
}
