import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  Widget headerDashboard() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20.0,
        ),
        padding: const EdgeInsets.only(
          left: 20.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.grey[100],
              width: 2.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                '\$ 100.32',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(62, 77, 162, 1.0),
                ),
              ),
            ),
            Text(
              'Current Period Recovered',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        this.headerDashboard(),
        this.headerDashboard(),
        this.headerDashboard(),
        Container(
          padding: const EdgeInsets.only(
            right: 30.0,
            top: 30.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
            ),
            color: Colors.grey[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Fernando de Moraes',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                ),
              ),
              this.headerDashboard(),
            ],
          ),
        )
      ],
    );
  }
}
