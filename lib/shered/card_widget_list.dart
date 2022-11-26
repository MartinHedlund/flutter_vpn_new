import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vpn21/models/CardModel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'descrtiption_text_widget.dart';
import 'modal_with_nested_scroll.dart';

class CardWidgetList extends StatelessWidget {
  CardWidgetList({super.key, required this.items});
  CardModel items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBarModalBottomSheet(
        expand: true,
        useRootNavigator: true,
        context: context,
        builder: (context) => NestedScrollModal(
          item: items,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.5, horizontal: 7.5),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SizedBox(
              height: 300,
              child: _imgcard(items.img),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .cardColor, // Color.fromARGB(155, 255, 255, 255)
                        ),
                        alignment: Alignment.center,
                        height: 80.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items.title == "" ? 'Нет заголовка' : items.title!,
                        style: Theme.of(context).textTheme.headline6,
                      ), //TextStyle( fontSize: 20.0,fontWeight: FontWeight.bold,
                      DescriptionTextWidget(
                        text: items.descrtiption == ""
                            ? 'Нет описания'
                            : items.descrtiption!,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// скругленое изображение
Widget _imgcard(String url) {
  try {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 0.0,
                offset: Offset(3.5, 5.0),
                blurStyle: BlurStyle.normal),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        child: Image(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
                child: Column(
              children: [
                const SizedBox(height: 10),
                CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
                const SizedBox(height: 10),
                Text(
                    "${loadingProgress.expectedTotalBytes != null ? (loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!).round() * 100 : "Загрузка..."} %"),
              ],
            ));
          },
          errorBuilder: (context, error, stackTrace) => SizedBox(
            width: window.physicalSize.width,
            child: Image.asset(
              "lib/assets/notfound.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  } catch (e) {
    return const ClipRRect(
      child: Icon(Icons.error_outline),
    );
  }
}
