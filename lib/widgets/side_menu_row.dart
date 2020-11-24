import 'package:flutter/material.dart';

import 'package:codeitapp/model/side_menu_item.dart';

class SideMenuRow extends StatelessWidget {
  final SideMenuItem sideMenuItem;

  const SideMenuRow({
    Key key,
    @required this.sideMenuItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                sideMenuItem.color1,
                sideMenuItem.color2,
              ],
            ),
          ),
          child: Icon(
            sideMenuItem.icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          child: Text(
            sideMenuItem.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF242629),
            ),
          ),
        ),
      ],
    );
  }
}
