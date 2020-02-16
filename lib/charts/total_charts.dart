import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries({
    @required this.year,
    @required this.subscribers,
    @required this.barColor,
  });
}

class TotalCharts extends StatelessWidget {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2007",
      subscribers: 15,
      barColor: charts.ColorUtil.fromDartColor(
        Color.fromRGBO(62, 77, 168, 1.0),
      ),
    ),
    SubscriberSeries(
      year: "2008",
      subscribers: 30,
      barColor: charts.ColorUtil.fromDartColor(
        Color.fromRGBO(244, 191, 119, 1.0),
      ),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 25,
      barColor: charts.ColorUtil.fromDartColor(
        Color.fromRGBO(208, 95, 95, 1.0),
      ),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 30,
      barColor: charts.ColorUtil.fromDartColor(
        Color.fromRGBO(185, 238, 253, 1.0),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor,
        labelAccessorFn: (SubscriberSeries series, _) =>
            '${series.subscribers}%',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15.0,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Recovered Per Category',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(62, 77, 162, 1.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 350.0,
            child: charts.PieChart(
              series,
              animate: true,
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 60,
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(),
                ],
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
                              child: Text(data[index].year),
                            ),
                          ],
                        ),
                        Text('${data[index].subscribers}%')
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
