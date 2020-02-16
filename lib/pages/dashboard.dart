import 'package:finance_web/charts/full_charts.dart';
import 'package:finance_web/charts/parcial_charts.dart';
import 'package:finance_web/charts/total_charts.dart';
import 'package:finance_web/sections/menu.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
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
    Size screen = MediaQuery.of(context).size;
    double largeSection = screen.width * 0.80;
    double shortSection = screen.width - largeSection;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: shortSection,
                  color: Colors.grey[100],
                  child: MenuSection(
                    page: 'Dashboard',
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    width: largeSection,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
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
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Fernando de Moraes',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Icon(
                                            Icons.exit_to_app,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  this.headerDashboard(),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Current Period',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Color.fromRGBO(62, 77, 162, 1.0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              width: largeSection * 0.25,
                              child: TotalCharts(),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              width: largeSection * 0.25,
                              child: ParcialCharts(),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              width: (largeSection * 0.50) - 20.0,
                              child: FullCharts(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
