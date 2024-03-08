import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String dateFormmatteCustom(DateTime date) => DateFormat("dd/MM/yyyy").format(date);

final numberMaskFormatter = MaskTextInputFormatter(
      mask: "(##) # ####-####",
      filter: { "#": RegExp(r'[0-9]') }
);

final cpfMaskFormatter = MaskTextInputFormatter(
      mask: "###.###.###-##",
      filter: { "#": RegExp(r'[0-9]') }
);