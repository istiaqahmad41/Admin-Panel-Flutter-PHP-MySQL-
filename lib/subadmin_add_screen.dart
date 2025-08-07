import 'dart:convert';
import 'package:admin_subadmin_php/pages/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddSubadminScreen extends StatefulWidget {
  final int adminId;
  const AddSubadminScreen({super.key, required this.adminId});

  @override
  _AddSubadminScreenState createState() => _AddSubadminScreenState();
}

class _AddSubadminScreenState extends State<AddSubadminScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  InputDecoration customInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    );
  }

  Future<void> registerSubadmin() async {
    setState(() => isLoading = true);

    final response = await http.post(
      Uri.parse('http://192.168.1.104/admin_subadmin_php/register.php'),
      body: {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'role': 'subadmin',
      },
    );

    final json = jsonDecode(response.body);
    setState(() => isLoading = false);

    if (json['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Subadmin added successfully")),
      );

      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminHome(adminId: widget.adminId),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(json['message'] ?? "Failed to add Subadmin")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FD),
      appBar: AppBar(
        title: const Text("Add Subadmin",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: customInputDecoration('Name', Icons.person),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: customInputDecoration('Email', Icons.email),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: customInputDecoration('Password', Icons.lock),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: isLoading ? null : registerSubadmin,
              icon: isLoading
                  ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
                  : const Icon(Icons.add,color: Colors.white,),
              label: Text(
                isLoading ? 'Adding...' : 'Add Subadmin',
                style: const TextStyle(fontSize: 16,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blueAccent,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
