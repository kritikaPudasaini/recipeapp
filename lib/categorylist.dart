import 'package:flutter/material.dart';
import 'package:recipe_app_789/Italianlist.dart';

import 'chineselist.dart';
import 'frenchlist.dart';
import 'newarilist.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomContainer(
            title: 'Italian',
            navigateTo: ItalianList(),
          ),
         
          CustomContainer(
            title: 'French',
            navigateTo: FrenchList(),
          ),
          CustomContainer(
            title: 'Chinese',
            navigateTo: ChineseList(),
          ),
           CustomContainer(
            title: 'Newari',
            navigateTo: NewariList(),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final Widget navigateTo;

  const CustomContainer({required this.title, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, 
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
      color: Color(0xFFD4D4D4), // Light gray
      borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF9CCC65),
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigateTo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
