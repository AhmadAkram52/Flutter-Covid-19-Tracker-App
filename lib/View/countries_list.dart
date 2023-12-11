import 'package:covid_tracker/Models/CountriesListModel.dart';
import 'package:covid_tracker/Services/countries_list_serviecs.dart';
import 'package:covid_tracker/View/shimmer_effects.dart';
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
    return SafeArea(
      child: Scaffold(
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
                onChanged: (se) {
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
                                    setState(() {});
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      image: NetworkImage(cList[i]
                                          .countryInfo!
                                          .flag
                                          .toString()),
                                      height: 30,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    ),
                                    title: Text(cList[i].country.toString()),
                                    subtitle: Text(cList[i].cases.toString()),
                                  ),
                                ),
                              );
                            } else if (countryName.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      image: NetworkImage(cList[i]
                                          .countryInfo!
                                          .flag
                                          .toString()),
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
      ),
    );
  }
}
