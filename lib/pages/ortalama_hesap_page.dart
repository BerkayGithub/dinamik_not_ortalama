import 'package:dinamik_not_ortalama/constants/app_constants.dart';
import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:dinamik_not_ortalama/model/ders.dart';
import 'package:dinamik_not_ortalama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesapApp extends StatefulWidget {
  const OrtalamaHesapApp({super.key});

  @override
  State<OrtalamaHesapApp> createState() => _OrtalamaHesapAppState();
}

class _OrtalamaHesapAppState extends State<OrtalamaHesapApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var secilenNotText = "AA";
  double secilenNot = 4;
  double seclenCredit = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(AppSabitleri.baslik, style: AppSabitleri.textStyle),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _formOlustur()),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(ortalama: DataHelper.ortalamaHesaple(), dersSayisi: DataHelper.tumDersler.length),
              ),
            ],
          ),
          Expanded(child: Center(child: Text("Form buraya gelecek"))),
        ],
      ),
    );
  }

  Widget _formOlustur() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            _buildTextFormField(),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildHarfler()),
                SizedBox(width: 10),
                Expanded(child: _buildKrediler()),
                Expanded(
                  child: IconButton(
                    onPressed: _ortlamaHesaplaVeDersEkle,
                    icon: Icon(Icons.arrow_forward_ios_sharp),
                    color: AppSabitleri.anaRenk,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (girilenDeger){
        setState(() {
          girilenDersAdi = girilenDeger!;
        });
      },
      validator: (s){
        if(s!.isEmpty){
          return "Lütfen bir ders giriniz";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: "Ders",
        hintText: "Ders ismini giriniz",
        border: OutlineInputBorder(borderRadius: AppSabitleri.borderRadius),
      ),
      initialValue: girilenDersAdi,
    );
  }

  Container _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppSabitleri.anaRenk.shade100.withAlpha(75),
        borderRadius: AppSabitleri.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: AppSabitleri.anaRenk.shade200,
        items: DataHelper.krediListesiniDondur(),
        onChanged: (double? seclenCreditTemp) {
          setState(() {
            seclenCredit = seclenCreditTemp!;
          });
        },
        value: seclenCredit,
      ),
    );
  }

  Container _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppSabitleri.anaRenk.shade100.withAlpha(75),
        borderRadius: AppSabitleri.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: AppSabitleri.anaRenk.shade200,
        items: DataHelper.harfListesiDondur(),
        onChanged: (double? secilenNotTemp) {
          setState(() {
            secilenNot = secilenNotTemp!;
          });
        },
        value: secilenNot,
      ),
    );
  }

  _ortlamaHesaplaVeDersEkle() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers = Ders(ad: girilenDersAdi, harfDegeri: secilenNot, krediDegeri: seclenCredit);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.tumDersler.toString());
      setState(() {
      });
    }
  }

}
