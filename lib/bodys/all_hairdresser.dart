import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonproject/models/user_model.dart';
import 'package:salonproject/states/detail_hairdresser.dart';
import 'package:salonproject/utility/my_constant.dart';
import 'package:salonproject/widgets/widget_process.dart';
import 'package:salonproject/widgets/widget_text.dart';

class AllHairdresser extends StatefulWidget {
  const AllHairdresser({super.key});

  @override
  State<AllHairdresser> createState() => _AllHairdresserState();
}

class _AllHairdresserState extends State<AllHairdresser> {
  var userModels = <UserModel>[];
  bool load = true;

  @override
  void initState() {
    super.initState();
    readAllHairdresser();
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const WidgetProcess()
        : GridView.builder(
            itemCount: userModels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Get.to(DetailHairdresser(userModel: userModels[index]));
              },
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.network(
                          userModels[index].urlImage ?? Myconstant.urlAvatar),
                    ),
                    WidgetText(
                      text: userModels[index].name,
                      textStyle: Myconstant().h3ActiveStyle(),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future<void> readAllHairdresser() async {
    await FirebaseFirestore.instance
        .collection('user')
        .where('typeUser', isEqualTo: 'Hairdresser')
        .get()
        .then((value) {
      for (var element in value.docs) {
        UserModel userModel = UserModel.fromMap(element.data());
        userModels.add(userModel);
      }
      load = false;
      setState(() {});
    });
  }
}
