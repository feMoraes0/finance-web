import 'dart:math';

import 'package:finance_web/sections/menu.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries(
      {@required this.year,
      @required this.subscribers,
      @required this.barColor});
}

class DashboardPage extends StatelessWidget {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blueAccent[200]),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellowAccent),
    ),
    SubscriberSeries(
      year: "2011",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
    ),
  ];

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

    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Row(
            children: <Widget>[
              Container(
                width: screen.width * 0.20,
                color: Colors.grey[100],
                child: MenuSection(
                  page: 'Dashboard',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                width: screen.width * 0.80,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      children: <Widget>[
                        Container(
                          width: screen.width * 0.80 * 0.20,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Recovered Per Category',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(62, 77, 162, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 350.0,
                                child: charts.PieChart(
                                  series,
                                  animate: true,
                                  behaviors: [
                                    new charts.DatumLegend(
                                      position: charts.BehaviorPosition.bottom,
                                      outsideJustification: charts
                                          .OutsideJustification.middleDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 4,
                                      cellPadding: new EdgeInsets.only(
                                        bottom: 6.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screen.width * 0.80 * 0.20,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Recovered Per Category',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(62, 77, 162, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 350.0,
                                child: charts.PieChart(
                                  series,
                                  animate: true,
                                  behaviors: [
                                    new charts.DatumLegend(
                                      position: charts.BehaviorPosition.bottom,
                                      outsideJustification: charts
                                          .OutsideJustification.middleDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 4,
                                      cellPadding: new EdgeInsets.only(
                                        bottom: 6.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screen.width * 0.80 * 0.60 - 20.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Recovered Per Category',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(62, 77, 162, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 350.0,
                                child: charts.PieChart(
                                  series,
                                  animate: true,
                                  behaviors: [
                                    new charts.DatumLegend(
                                      position: charts.BehaviorPosition.bottom,
                                      outsideJustification: charts
                                          .OutsideJustification.middleDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 4,
                                      cellPadding: new EdgeInsets.only(
                                        bottom: 6.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
