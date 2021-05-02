import 'package:flutter/material.dart';
import 'package:flutter_survey_demo/ui/pages/loginpage.dart';
import 'package:flutter_survey_demo/ui/pages/survey_first_page.dart';
import '../store/homepage_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _screens = <Widget>[
    Container(),
    ProfilePage(),
  ];
  var store;
  @override
  void didChangeDependencies() {
    store = HomepageStore();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Report'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.sync), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              store.logout();
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) => Center(
          child: _screens.elementAt(store.index),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          currentIndex: store.index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            store.changeIndex(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            SurveyFirstPage.routeName
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var store;
  @override

  void initState(){
    store = HomepageStore();
    super.initState();
  }
  void didChangeDependencies(){
    
    store.getUsername();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Username:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Observer(
                  builder: (_)=>Text(
                    store.username!=null?store.username:"",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                ),
                )
                
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Role:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Field Officer',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
