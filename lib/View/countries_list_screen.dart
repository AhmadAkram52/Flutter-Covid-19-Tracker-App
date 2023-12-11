import 'package:covid_tracker/Models/CountriesListModel.dart';
import 'package:covid_tracker/Services/countries_list_services.dart';
import 'package:covid_tracker/View/country_details_screen.dart';
import 'package:covid_tracker/View/widgets/shimmer_effects.dart';
import 'package:flutter/material.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  List<CountriesListModel> cList = [];

  CountriesList countriesList = CountriesList();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: "Search with Country Name...",
              ),
              onChanged: (val) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<CountriesListModel>>(
                future: countriesList.getCountriesList(cList),
                builder: (context, snapShot) {
                  if (!snapShot.hasData) {
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return const CountriesListShimmer();
                        });
                  } else {
                    return ListView.builder(
                        itemCount: cList.length,
                        itemBuilder: (context, i) {
                          String countryName = cList[i].country.toString();
                          if (searchController.text.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return CountryDetailScreen(
                                        countryImage: cList[i]
                                            .countryInfo!
                                            .flag
                                            .toString(),
                                        countryName:
                                            cList[i].country.toString(),
                                        recovered: cList[i].recovered!.toInt(),
                                        deaths: cList[i].deaths!.toInt(),
                                        actives: cList[i].active!.toInt(),
                                        critical: cList[i].critical!.toInt(),
                                        todayCases:
                                            cList[i].todayCases!.toInt(),
                                        todayDeaths:
                                            cList[i].todayDeaths!.toInt(),
                                        todayRecovered:
                                            cList[i].todayRecovered!.toInt(),
                                        totalCases: cList[i].cases!.toInt(),
                                      );
                                    }),
                                  );
                                },
                                child: ListTile(
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
                          } else if (countryName
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return CountryDetailScreen(
                                        countryImage: cList[i]
                                            .countryInfo!
                                            .flag
                                            .toString(),
                                        countryName:
                                            cList[i].country.toString(),
                                        recovered: cList[i].recovered!.toInt(),
                                        deaths: cList[i].deaths!.toInt(),
                                        actives: cList[i].active!.toInt(),
                                        critical: cList[i].critical!.toInt(),
                                        todayCases:
                                            cList[i].todayCases!.toInt(),
                                        todayDeaths:
                                            cList[i].todayDeaths!.toInt(),
                                        todayRecovered:
                                            cList[i].todayRecovered!.toInt(),
                                        totalCases: cList[i].cases!.toInt(),
                                      );
                                    }),
                                  );
                                },
                                child: ListTile(
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
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
