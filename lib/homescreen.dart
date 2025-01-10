import 'package:flutter/material.dart';
import 'package:recipe_app_789/categorylist.dart';
import 'package:recipe_app_789/recommendationlist.dart';

import 'homepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 16),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFf6f6f6),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          icon: Icon(Icons.grid_view),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                flex: 5,
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFf6f6f6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const CategoryList()),
              ),
              SizedBox(height: 16),
              Expanded(
                flex: 4,
                child: Container(
                    decoration: BoxDecoration(
                       color: Color(0XFFf6f6f6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const RecommendationList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
