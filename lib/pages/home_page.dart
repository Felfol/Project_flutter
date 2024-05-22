import 'package:flutter/material.dart';
import 'package:project_flutter/pages/saved_netizen.dart';
import '../components/my_hometab.dart';
import 'manage_orders_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTab(),
          ManageOrdersPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.list_alt)),
            Tab(icon: Icon(Icons.account_circle_rounded)),
          ],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
