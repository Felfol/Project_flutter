import 'package:flutter/material.dart';

class ManageOrdersPage extends StatefulWidget {
  @override
  _ManageOrdersPageState createState() => _ManageOrdersPageState();
}

class _ManageOrdersPageState extends State<ManageOrdersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Manage Orders"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Active'),
            Tab(text: 'Finished'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildOrderList(context, true), // Active Orders
          _buildOrderList(context, false), // Finished Orders
        ],
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, bool isActive) {
    List<Map<String, String>> orders = isActive ? [
      {'name': 'Mhamad Felfol', 'status': 'In Progress', 'image': 'https://via.placeholder.com/150'},
      {'name': 'Bilal Taleb', 'status': 'In Progress', 'image': 'https://via.placeholder.com/150'},
    ] : [
      {'name': 'Leslie Alexander', 'status': 'Finished', 'image': 'https://via.placeholder.com/150'},
      {'name': 'Kristin Watson', 'status': 'Finished', 'image': 'https://via.placeholder.com/150'},
    ];

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(orders[index]['image']!),
          ),
          title: Text(orders[index]['name']!),
          subtitle: Text(orders[index]['status']!),
          trailing: Icon(Icons.arrow_forward),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

