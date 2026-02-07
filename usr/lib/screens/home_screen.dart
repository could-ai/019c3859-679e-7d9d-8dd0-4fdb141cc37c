import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data for the list
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  // Requirement 8: Pull-to-refresh logic
  Future<void> _refreshData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // For demo, just reverse the list or shuffle to show change
      _items.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Requirement 1: SafeArea is used to handle padding for notches/home indicators
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlayVerse Home'),
        // Requirement 2: Back button appears on all pages except Home.
        // AppBar automatically implies no back button here because it's the root.
      ),
      // Requirement 6: Drawer component for mobile user settings
      drawer: const AppDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_items[index]),
                onTap: () {
                  // Demo navigation
                },
                // Ensure list items also have good touch targets
                minVerticalPadding: 16,
              );
            },
          ),
        ),
      ),
    );
  }
}
