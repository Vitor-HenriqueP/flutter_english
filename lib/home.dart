import 'package:flutter/material.dart';
import 'package:flutter_ingles/animal.dart';
import 'package:flutter_ingles/numbers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,  
    );
    
    
    _tabController!.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index; 
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn English"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          controller: _tabController,
          tabs: <Widget>[
            _buildFadeTransitionTab("Animal", 0),
            _buildFadeTransitionTab("Numbers", 1),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Animal(),
          Numbers(),
        ],
      ),
    );
  }

  
  Widget _buildFadeTransitionTab(String label, int index) {
    bool isSelected = _selectedIndex == index;  
    double opacity = isSelected ? 0.5 : 1.0; 
    Color tabColor = Colors.red;
    return FadeTransition(
      opacity: Tween(begin: 1.0, end: opacity).animate(
        CurvedAnimation(
          parent: _tabController!.animation!,
          curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
        ),
      ),
      child: Tab(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index; 
            });
            _tabController!.animateTo(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              label,
              style: TextStyle(
                color: tabColor.withOpacity(isSelected ? 0.5 : 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
