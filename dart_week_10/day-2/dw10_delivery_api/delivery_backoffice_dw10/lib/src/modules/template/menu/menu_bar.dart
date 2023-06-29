import 'dart:html';

import 'package:flutter/material.dart';

// ignore: prefer_relative_imports
import 'package:delivery_backoffice_dw10/src/core/ui/helpers/size_extensions.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/ui/helpers/history_back_listener.dart';
import 'menu_button.dart';
import 'menu_enum.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({super.key});

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> with HistoryBackListener {
  Menu? selectedMenu;
  var colapsed = false;

  @override
  void ontHistoryBack(Event event) {
    setState(() {
      selectedMenu = Menu.findByPath(Modular.to.path);
    });
  }

  @override
  void initState() {
    selectedMenu = Menu.findByPath(Modular.to.path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 2000),
      width: colapsed ? 90 : context.percentWidth(.18),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: colapsed ? Alignment.center : Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  colapsed = !colapsed;
                });
              },
              icon: Icon(
                colapsed
                    ? Icons.keyboard_double_arrow_right
                    : Icons.keyboard_double_arrow_left,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Menu.values.length,
            itemBuilder: (context, index) {
              final menu = Menu.values[index];
              return MenuButton(
                menu: menu,
                menuSelected: selectedMenu,
                onPressed: (Menu menu) {
                  setState(() {
                    selectedMenu = menu;
                    Modular.to.navigate(menu.route);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
