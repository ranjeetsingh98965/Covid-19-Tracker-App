import 'package:covid_19_tracker_app/View/worls_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name , image;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;
  DetailScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.totalRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      ReusablRow(title: "Total Cases", value: widget.totalCases.toString()),
                      ReusablRow(title: "Recovered", value: widget.totalRecovered.toString()),
                      ReusablRow(title: "Total Deaths", value: widget.totalDeaths.toString()),
                      ReusablRow(title: "Critical", value: widget.critical.toString()),
                      ReusablRow(title: "Active", value: widget.active.toString()),
                      ReusablRow(title: "Today Recovered", value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
