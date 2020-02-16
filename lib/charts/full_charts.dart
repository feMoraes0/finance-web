import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(
    this.time,
    this.sales,
  );
}

class FullCharts extends StatelessWidget {
  final List<TimeSeriesSales> data = [
    new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
    new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
    new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
    new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Amount Recovered Per Week',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(62, 77, 162, 1.0),
                    fontFamily: 'Nunito'
                  ),
                ),
                Icon(
                  FeatherIcons.settings,
                  color: Colors.black87,
                  size: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: charts.TimeSeriesChart(
                [
                  new charts.Series<TimeSeriesSales, DateTime>(
                    id: 'Sales',
                    domainFn: (TimeSeriesSales sales, _) => sales.time,
                    measureFn: (TimeSeriesSales sales, _) => sales.sales,
                    data: data,
                    colorFn: (TimeSeriesSales sales, _) =>
                        charts.ColorUtil.fromDartColor(
                      Color.fromRGBO(62, 77, 168, 1.0),
                    ),
                  ),
                ],
                animate: true,
                defaultRenderer: new charts.LineRendererConfig(includePoints: true),
              ),
            ),
          ),
          Container(
            height: 40.0 * data.length,
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Container(
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('${data[index].time}'),
                            ),
                          ],
                        ),
                        Text('${data[index].sales}%')
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
