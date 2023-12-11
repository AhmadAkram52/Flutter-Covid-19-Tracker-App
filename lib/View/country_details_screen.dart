import 'package:covid_tracker/View/widgets/values_row.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatefulWidget {
  final String countryName, countryImage;
  final int totalCases,
      recovered,
      deaths,
      actives,
      critical,
      todayCases,
      todayRecovered,
      todayDeaths;

  const CountryDetailScreen(
      {super.key,
      required this.countryName,
      required this.countryImage,
      required this.recovered,
      required this.deaths,
      required this.actives,
      required this.critical,
      required this.todayCases,
      required this.todayDeaths,
      required this.todayRecovered,
      required this.totalCases});

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Card(
          elevation: 50,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  elevation: 30,
                  child: Image(
                    image: NetworkImage(widget.countryImage),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.countryName,
                  style: const TextStyle(fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ValuesRow(
                              title: "Total Cases",
                              value: widget.totalCases.toString()),
                          ValuesRow(
                              title: "Recovered",
                              value: widget.recovered.toString()),
                          ValuesRow(
                              title: "Deaths", value: widget.deaths.toString()),
                          ValuesRow(
                              title: "Actives",
                              value: widget.actives.toString()),
                          ValuesRow(
                              title: "Critical",
                              value: widget.critical.toString()),
                          ValuesRow(
                              title: "Today Cases",
                              value: widget.todayCases.toString()),
                          ValuesRow(
                              title: "Today Recovered",
                              value: widget.todayRecovered.toString()),
                          ValuesRow(
                              title: "Today Deaths",
                              value: widget.todayDeaths.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
