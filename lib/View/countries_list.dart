import 'package:covid_tracker/Models/CountriesListModel.dart';
import 'package:covid_tracker/Services/countries_list_serviecs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  List<CountriesListModel> cList = [];

  CountriesList countriesList = CountriesList();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: searchController,
                decoration:
                    InputDecoration(fillColor: Colors.red, filled: true),
                onChanged: (se) {
                  setState(() {});
                },
              ),
            ),
            FutureBuilder<List<CountriesListModel>>(
                future: countriesList.getCountriesList(cList),
                builder: (context, snapShot) {
                  if (!snapShot.hasData) {
                    return Expanded(
                      child: Center(
                        child: SpinKitFadingCircle(
                          size: 50,
                          color: Colors.yellowAccent,
                          controller: _controller,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: cList.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: ListTile(
                                  style: ListTileStyle.drawer,
                                  tileColor: Brightness == Brightness.dark
                                      ? Colors.teal
                                      : Colors.pink.shade200,
                                  leading: Image(
                                    image: NetworkImage(
                                        cList[i].countryInfo!.flag.toString()),
                                    height: 30,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(cList[i].country.toString()),
                                  subtitle: Text(cList[i].cases.toString()),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
