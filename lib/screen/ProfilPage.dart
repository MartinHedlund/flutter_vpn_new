import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn21/config/them.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    var wight = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var header = Container(
      child: Stack(alignment: Alignment.bottomRight, children: [
        CircleAvatar(
            radius: wight * 0.20,
            backgroundColor: Colors.grey[400],
            backgroundImage: NetworkImage(
              "https://n1s1.elle.ru/e9/2b/bf/e92bbf78184a1168e43d2f60db7c6b8b/728x946_1_8c05a11722cb53c974cc0a44167425a5@800x1040_0xc35dbb80_13873213741517414727.jpg",
            )),
        FloatingActionButton(
          mini: true,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.create_outlined,
            size: wight * 0.06,
            color: Colors.black,
          ),
          onPressed: () => showBarModalBottomSheet(
              context: context, builder: (context) => ModalFit()),
        )
      ]),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Профиль"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          actions: [
            IconButton(
                onPressed: () => setState(() {
                      customTheme.toggleTheme();
                    }),
                icon: Icon(
                  Icons.brightness_medium,
                  size: wight * 0.08,
                  color: Colors.white,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, size: wight * 0.08),
                  ),
                  header,
                  IconButton(
                      onPressed: () => setState(() {
                            customTheme.toggleTheme();
                          }),
                      icon: Icon(Icons.settings, size: wight * 0.08)),
                ],
              ),
              SizedBox(height: height * 0.02),
              Text("Nicolai Petrovich"),
              Text("nicklaypetrovich@gmail.com"),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                child: Container(
                  alignment: Alignment.center,
                  width: wight * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Connection",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Edit'),
            leading: Icon(Icons.edit),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Copy'),
            leading: Icon(Icons.content_copy),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Cut'),
            leading: Icon(Icons.content_cut),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Move'),
            leading: Icon(Icons.folder_open),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    ));
  }
}
