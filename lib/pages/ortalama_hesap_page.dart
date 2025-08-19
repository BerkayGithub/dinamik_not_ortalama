import 'package:dinamik_not_ortalama/constants/app_constants.dart';
import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:dinamik_not_ortalama/model/ders.dart';
import 'package:dinamik_not_ortalama/widgets/credit_dropdown_widget.dart';
import 'package:dinamik_not_ortalama/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalama/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_not_ortalama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesapApp extends StatefulWidget {
  const OrtalamaHesapApp({super.key});

  @override
  State<OrtalamaHesapApp> createState() => _OrtalamaHesapAppState();
}

class _OrtalamaHesapAppState extends State<OrtalamaHesapApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          Expanded(child: Center(child: DersListesi(
            onElemanCikarildi: (index){
              DataHelper.tumDersler.removeAt(index);
              setState(() {
              });
            },
          ))),
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
                Expanded(child: HarfDropDownWidget(harfSecildi: (secilenNotTemp){
                  setState(() {
                    secilenNot = secilenNotTemp;
                  });
                })),
                SizedBox(width: 10),
                Expanded(child: CreditDropDownWidget(onCreditSecildi: (seclenCreditTemp){
                  setState(() {
                    seclenCredit = seclenCreditTemp;
                  });
                })),
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
      keyboardType: TextInputType.text,
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
