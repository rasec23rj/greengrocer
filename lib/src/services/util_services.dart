import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
}
