import 'package:flutter/material.dart';

import 'menu_section.dart';

class ScaffoldSection extends StatelessWidget {
  final String page;
  final Widget body;

  ScaffoldSection({@required this.page, @required this.body});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double bodySection = screen.width * 0.80;
    double menuSection = screen.width - bodySection;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: menuSection,
                color: Colors.grey[100],
                child: MenuSection(
                  page: this.page,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  width: bodySection,
                  color: Colors.white,
                  child: this.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
