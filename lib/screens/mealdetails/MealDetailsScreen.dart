import 'package:flutter/material.dart';
import 'package:food_app/api/API.dart';
import 'package:food_app/models/MealDetails.dart';

class MealDetailsScreen extends StatefulWidget {
  final String title;
  MealDetailsScreen(this.title);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState(this.title);
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final String title;
  _MealDetailsScreenState(this.title);

  Future<MealDetails> _mealDetailsFuture;

  @override
  void initState() {
    super.initState();
    _mealDetailsFuture = API.getMealDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: FutureBuilder<MealDetails>(
          future: _mealDetailsFuture,
          builder: (context, response) {
            if (response.hasData) {
              return ListView(
                padding: EdgeInsets.only(bottom: 20),
                children: [
                  Image.network(
                    response.data.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(color: Colors.black, fontSize: 21),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.amber, width: 3),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemCount: response.data.ingredients.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(4)),
                                child: ListTile(
                                    title: Text(
                                  response.data.ingredients[index],
                                )));
                          },
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Steps",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 21),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.amber, width: 3),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemCount: response.data.steps.length,
                          itemBuilder: (context, index) {
                            return Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                child: Text("# ${index+1}"),
                              ),
                              Text("  " + response.data.steps[index],
                              style: TextStyle(fontSize: 18),
                              ),
                            ]
                          );
                        },
                        ),
                      ))
                ],
              );
            } else if (response.hasError) {
              return Text("${response.error}");
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
