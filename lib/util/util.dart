import 'dart:math' as Math;
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

NumberFormat currencyFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
NumberFormat numberFormat = NumberFormat.decimalPattern('pt_BR');
NumberFormat percentFormat = NumberFormat.decimalPercentPattern(locale: 'pt_BR', decimalDigits: 2);

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String formatDateToStr(DateTime dt, String format) {
  if (dt == null) return null;

  return DateFormat(format, 'pt_BR').format(dt);
}

String formatNumberToStr(double nbr) => currencyFormat.format(nbr);

String formatNbrToStr(double nbr) => numberFormat.format(nbr);

//String formatPercentToStr(double percent) => percentFormat.format(percent);
String formatPercentToStr(double percent) => formatNbrToStr(percent) + '%';

Color colorFromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

coalesce(obj1, obj2) {
  if (obj1 == null) {
    return obj2;
  }

  return obj1;
}

DateTime dynamicToDate(dynamic d) {
  if (d == null)
    return null;

  if (d is int) {
    return DateTime.fromMillisecondsSinceEpoch(d);
  } else { 
    return DateTime.parse(d);
  }
}

toString(obj) {
  if (obj == null) 
    return null;

  return obj.toString();
}

toBoolean(valor) {
  if (valor == null)
    return null;

  if (valor is int) {
    return valor > 0;
  }

  return valor;
}

double toDouble(dynamic d) {
  if (d == null)
    return null;

  if (d is double) {
    return d; 
  } else { 
    return double.parse("$d");
  }
}

int toInt(dynamic d) {
  if (d == null)
    return null;

  if (d is int) {
    return d; 
  } else { 
    return int.parse("$d");
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Math.Random _rnd = Math.Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));