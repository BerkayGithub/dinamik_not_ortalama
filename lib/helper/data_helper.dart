import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FF"];
  }

  static double harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FF":
        return 0;
      default:
        return -1;
    }
  }

  static List<DropdownMenuItem<double>> harfListesiDondur() {
    return _tumDerslerinHarfleri()
        .map(
          (oankiHarf) => DropdownMenuItem<double>(
            value: harfiNotaCevir(oankiHarf),
            child: Text(oankiHarf),
          ),
        )
        .toList();
  }

  static List<double> _tumNotlar(){
    return [1,2,3,4,5];
  }

  static List<DropdownMenuItem<double>> krediListesiniDondur(){
    return _tumNotlar().map(
        (oankiNot) => DropdownMenuItem<double>(
            value: oankiNot,
            child: Text(oankiNot.toString()))
    ).toList();
  }
}
