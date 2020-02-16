import 'package:finance_web/charts/full_charts.dart';
import 'package:finance_web/charts/parcial_charts.dart';
import 'package:finance_web/charts/total_charts.dart';
import 'package:finance_web/sections/header_section.dart';
import 'package:finance_web/sections/scaffold_section.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largeSection = MediaQuery.of(context).size.width * 0.80;

    return ScaffoldSection(
      page: 'Dashboard',
      body: Column(
        children: <Widget>[
          HeaderSection(),
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
    );
  }
}
