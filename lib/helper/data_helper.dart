import 'package:dinamik_not_ortalama/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {

  static List<Ders> tumDersler = [];

  static void dersEkle(Ders d){
    tumDersler.add(d);
  }

  static double ortalamaHesaple(){
    double toplam = 0.0;
    double toplamKredi = 0;
    for (var ders in tumDersler) {
      toplam += ders.harfDegeri * ders.krediDegeri;
      toplamKredi += ders.krediDegeri;
    }
    if(toplamKredi == 0){
      return 0;
    }else{
      return (toplam/toplamKredi);
    }
  }

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
    return [1,2,3,4];
  }

  static List<DropdownMenuItem<double>> krediListesiniDondur(){
    return _tumNotlar().map(
        (oankiNot) => DropdownMenuItem<double>(
            value: oankiNot,
            child: Text(oankiNot.toString()))
    ).toList();
  }
}
