import 'package:covid_tracker/Models/WorldStatesModel.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/View/countries_list_screen.dart';
import 'package:covid_tracker/View/widgets/values_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../util/colors.dart';

class WorldStatScreen extends StatefulWidget {
  const WorldStatScreen({super.key});

  @override
  State<WorldStatScreen> createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  StatesServices statesServices = StatesServices();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: FutureBuilder(
            future: statesServices.getState(),
            builder: (context, AsyncSnapshot<WorldStates> sn) {
              if (!sn.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: SpinKitFadingCircle(
                        controller: _controller,
                        color: Colors.red,
                      ),
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      PieChart(
                        dataMap: {
                          'Total Cases':
                              double.parse(sn.data!.cases.toString()),
                          'Recovered':
                              double.parse(sn.data!.recovered.toString()),
                          'Deaths': double.parse(sn.data!.deaths.toString()),
                        },
                        animationDuration: const Duration(seconds: 5),
                        chartLegendSpacing: 40,
                        chartRadius: MediaQuery.of(context).size.width / 2.5,
                        legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left,
                        ),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValuesInPercentage: true,
                          showChartValues: true,
                          decimalPlaces: 1,
                        ),
                        colorList: CColors.chartColorsList,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .05),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                ValuesRow(
                                    title: "Total Cases",
                                    value: sn.data!.cases.toString()),
                                ValuesRow(
                                    title: "Recovered",
                                    value: sn.data!.recovered.toString()),
                                ValuesRow(
                                    title: "Deaths",
                                    value: sn.data!.deaths.toString()),
                                ValuesRow(
                                    title: "Actives",
                                    value: sn.data!.active.toString()),
                                ValuesRow(
                                    title: "Critical",
                                    value: sn.data!.critical.toString()),
                                ValuesRow(
                                    title: "Today Cases",
                                    value: sn.data!.todayCases.toString()),
                                ValuesRow(
                                    title: "Today Recovered",
                                    value: sn.data!.todayRecovered.toString()),
                                ValuesRow(
                                    title: "Today Deaths",
                                    value: sn.data!.todayDeaths.toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CountriesListView()));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 20,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text("Track Countries"),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
