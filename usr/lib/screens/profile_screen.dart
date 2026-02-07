import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
              onPressed: () {
                // Perform delete logic here
                Navigator.of(context).pop();
                // Maybe navigate back to login or show success
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account deleted (simulated)')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        // Requirement 2: Back button automatically appears here because it's pushed onto the stack.
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'User Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: const Text('user@playverse.com'),
              ),
              const Divider(),
              const Spacer(),
              // Requirement 5: Delete Account section with confirmation modal
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red,
                    elevation: 0,
                  ),
                  onPressed: () => _showDeleteConfirmation(context),
                  child: const Text('Delete Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
