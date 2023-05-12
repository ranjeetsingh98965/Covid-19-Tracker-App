import 'package:covid_19_tracker_app/Services/states_services.dart';
import 'package:covid_19_tracker_app/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
              future: stateServices.countriesListApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                print('No data!');
                return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          ListTile(
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              leading: Container(
                                height: 50,
                                width: 59,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    );
                  },
                );
              } else {
                print('having data');
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name = snapshot.data![index]['country'];

                    if (searchController.text.isEmpty)
                    {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      name: snapshot.data![index]['country'],
                                      test: snapshot.data![index]['tests'],
                                      totalRecovered: snapshot.data![index]['recovered'],
                                      critical: snapshot.data![index]['critical'],
                                      active: snapshot.data![index]['active'],
                                      todayRecovered: snapshot.data![index]['todayRecovered'],
                                      image: snapshot.data![index]['countryInfo']['flag'],
                                      totalCases: snapshot.data![index]['cases'],
                                      totalDeaths: snapshot.data![index]['deaths'],
                                    ),
                                  ));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text('Cases: ' +
                                  snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    else if (name.toLowerCase().contains(searchController.text.toLowerCase()))
                    {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      name: snapshot.data![index]['country'],
                                      test: snapshot.data![index]['tests'],
                                      totalRecovered: snapshot.data![index]['recovered'],
                                      critical: snapshot.data![index]['critical'],
                                      active: snapshot.data![index]['active'],
                                      todayRecovered: snapshot.data![index]['todayRecovered'],
                                      image: snapshot.data![index]['countryInfo']['flag'],
                                      totalCases: snapshot.data![index]['cases'],
                                      totalDeaths: snapshot.data![index]['deaths'],
                                    ),
                                  ));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text('Cases: ' +
                                  snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    else
                    {
                      return Container();
                    }
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
