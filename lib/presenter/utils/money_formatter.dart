import 'package:money_formatter/money_formatter.dart';

String moneyFormatter(double price) {
  MoneyFormatter fmf = MoneyFormatter(
    amount: price,
    settings: MoneyFormatterSettings(
      symbol: '₽',
      thousandSeparator: ' ',
      decimalSeparator: ',',
      symbolAndNumberSeparator: ' ',
      fractionDigits: 3,
      compactFormatType: CompactFormatType.long,
    ),
  );

  return fmf.output.withoutFractionDigits;
}