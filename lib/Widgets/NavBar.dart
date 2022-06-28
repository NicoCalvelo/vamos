import 'package:flutter/material.dart';

import 'dart:html' as html;

class NavBar extends StatelessWidget with PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actionsIconTheme:
          const IconThemeData(color: Color.fromRGBO(190, 190, 190, 1)),
      actions: [
        Container(
            margin: EdgeInsets.only(right: 40),
            child: IconButton(
                onPressed: () {},
                iconSize: 36,
                icon: const Icon(Icons.menu_rounded)))
      ],
      toolbarHeight: 80,
      leadingWidth: 180,
      leading: Container(
        margin: EdgeInsets.only(left: 40),
        child: MouseRegion( 
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
          onTap: () {
            html.window.location.reload();
          },
          child: Image.asset(
            'assets/icons/isologotipo1024x1024.png',
            width: 140,
          ),
        ),)
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
