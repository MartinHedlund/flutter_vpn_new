import 'package:flutter/material.dart';
import 'package:flutter_vpn21/models/CardModel.dart';
import 'package:flutter_vpn21/shered/card_widget_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NestedScrollModal extends StatelessWidget {
  late CardModel item;

  NestedScrollModal({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(),
      physics: const ScrollPhysics(parent: PageScrollPhysics()),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    height: 300,
                    color: const Color.fromARGB(222, 222, 222, 222),
                    child: Image(
                      image: NetworkImage(item.img),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "lib/assets/notfound.png",
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ),
          ),
        ];
      },
      body: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline4, //TextStyle(fontSize: 28,fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item.descrtiption!,
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
