import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget{
  final Function harfSecildi;
  const HarfDropDownWidget({super.key, required this.harfSecildi});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenNot = 4;

  @override
  Widget build(BuildContext context) {
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
            widget.harfSecildi(secilenNot);
          });
        },
        value: secilenNot,
      ),
    );
  }
}