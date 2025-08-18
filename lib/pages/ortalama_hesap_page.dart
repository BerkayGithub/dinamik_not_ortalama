import 'package:dinamik_not_ortalama/constants/app_constants.dart';
import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:dinamik_not_ortalama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesapApp extends StatefulWidget {
  const OrtalamaHesapApp({super.key});

  @override
  State<OrtalamaHesapApp> createState() => _OrtalamaHesapAppState();
}

class _OrtalamaHesapAppState extends State<OrtalamaHesapApp> {
  var formKey = GlobalKey<FormState>();
  var secilenNotText = "AA";
  double secilenNot = 4;
  double seclenCredit = 1;

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
                child: OrtalamaGoster(ortalama: 1.3252, dersSayisi: 3),
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
                _buildHarfler(),
                _buildKrediler(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  color: AppSabitleri.anaRenk,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildKrediler() {
    return Container(
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

  TextFormField _buildTextFormField() {
    return TextFormField(
      initialValue: "",
      decoration: InputDecoration(
        labelText: "Ders",
        hintText: "Ders ismini giriniz",
        border: OutlineInputBorder(borderRadius: AppSabitleri.borderRadius),
      ),
    );
  }
}
