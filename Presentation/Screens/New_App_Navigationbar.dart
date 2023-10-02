import 'package:flutter/material.dart';
import 'package:flutter_application_1/News%20App/Presentation/Screens/allnews.dart';
import 'package:flutter_application_1/News%20App/Presentation/Screens/business_category.dart';
import 'package:flutter_application_1/News%20App/Presentation/Screens/health_category.dart';
import 'package:flutter_application_1/News%20App/Presentation/Screens/sport_category.dart';
import 'package:flutter_application_1/News%20App/Presentation/Screens/technology_category.dart';


class Navigation extends StatefulWidget{
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;

final pages  = <StatefulWidget>[
  const Allnews(),
	const Business(),
	const Sport(),
	const Health(),
	const Technology(),
  ];
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
      pageIndex = index ;
      });
    }
   return Scaffold(
  body: Center(
    child: pages.elementAt(pageIndex), //New
  ),
  bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    enableFeedback: false,
    backgroundColor: Colors.white60 ,
    elevation: 0,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'General',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.sports_football_sharp),
        label: 'Sports',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety_sharp),
        label: 'Health',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.phone_iphone_sharp),
        label: 'Technology',
      ),
    ],
    currentIndex: pageIndex,
    onTap: _onItemTapped, 
  ),
  );
  }
}