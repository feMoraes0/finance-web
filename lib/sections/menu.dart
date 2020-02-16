import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {

  final String page;

  MenuSection({@required this.page});


  Widget listElement({IconData icon, String label, Function action}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
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
                      icon: Icons.dashboard,
                      label: 'Dashboard',
                      action: null,
                    ),
                    this.listElement(
                      icon: Icons.add_circle_outline,
                      label: 'New',
                      action: null,
                    ),
                    this.listElement(
                      icon: Icons.history,
                      label: 'Billing History',
                      action: null,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    this.listElement(
                      icon: Icons.exit_to_app,
                      label: 'Logout',
                      action: null,
                    ),
                    this.listElement(
                      icon: Icons.help_outline,
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
