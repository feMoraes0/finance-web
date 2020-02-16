import 'package:finance_web/sections/menu.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.grey[100],
              width: screen.width * 0.20,
              child: MenuSection(
                page: 'New',
              ),
            ),
            SizedBox(
              width: screen.width * 0.80,
            )
          ],
        ),
      ),
    );
  }
}