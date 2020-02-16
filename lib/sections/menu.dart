import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class MenuSection extends StatelessWidget {

  final String page;

  MenuSection({@required this.page});


  Widget listElement({IconData icon, String label, Function action}) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icon, color: (this.page == label) ? Color.fromRGBO(62, 77, 162, 1.0) : Colors.black,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  color: (this.page == label) ? Color.fromRGBO(62, 77, 162, 1.0) : Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height: screen.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15.0),
            height: 80.0,
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            height: screen.height - 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    this.listElement(
                      icon: FeatherIcons.home,
                      label: 'Dashboard',
                      action: () {
                        Navigator.of(context).pushNamed('/dashboard');
                      },
                    ),
                    this.listElement(
                      icon: FeatherIcons.plus,
                      label: 'New',
                      action: () {
                        Navigator.of(context).pushNamed('/new');
                      },
                    ),
                    this.listElement(
                      icon: FeatherIcons.list,
                      label: 'Billing History',
                      action: null,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    this.listElement(
                      icon: FeatherIcons.logOut,
                      label: 'Logout',
                      action: null,
                    ),
                    this.listElement(
                      icon: FeatherIcons.helpCircle,
                      label: 'Help',
                      action: null,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
