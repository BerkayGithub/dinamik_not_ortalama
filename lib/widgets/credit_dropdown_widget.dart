
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropDownWidget extends StatefulWidget{
  final Function onCreditSecildi;
  const CreditDropDownWidget({super.key, required this.onCreditSecildi});

  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double seclenCredit = 1.0;

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
        items: DataHelper.krediListesiniDondur(),
        onChanged: (double? seclenCreditTemp) {
          setState(() {
            seclenCredit = seclenCreditTemp!;
            widget.onCreditSecildi(seclenCreditTemp);
          });
        },
        value: seclenCredit,
      ),
    );
  }
}