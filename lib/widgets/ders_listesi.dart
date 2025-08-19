import 'package:dinamik_not_ortalama/constants/app_constants.dart';
import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({super.key, required this.onElemanCikarildi});

  @override
  Widget build(BuildContext context) {
    return DataHelper.tumDersler.isNotEmpty ? ListView.builder(
      itemCount: DataHelper.tumDersler.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          onDismissed: (e){
            onElemanCikarildi(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(DataHelper.tumDersler[index].harfDegeri.toString()),
                ),
                title: Text(DataHelper.tumDersler[index].ad),
                subtitle: Text(
                  "Credit:${DataHelper.tumDersler[index].krediDegeri}",
                )
              ),
            ),
          ),
        );
      },
    ) : Container(
      alignment: Alignment.center,
      child: Text("Lütfen Ders Ekleyin", style: AppSabitleri.textStyle,),
    );
  }
}
