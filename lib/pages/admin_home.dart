import 'dart:convert';
import 'package:admin_subadmin_php/subadmin_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminHome extends StatefulWidget {
  final int adminId;
  const AdminHome({super.key, required this.adminId});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  String adminName = '';
  String adminEmail = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAdminData();
  }

  Future<void> fetchAdminData() async {
    final url = 'http://192.168.1.104/admin_subadmin_php/get_admin.php?id=${widget.adminId}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          setState(() {
            adminName = data['user']['name'];
            adminEmail = data['user']['email'];
            isLoading = false;
          });
        } else {
          setState(() => isLoading = false);
          print('Error: ${data['message']}');
        }
      } else {
        setState(() => isLoading = false);
        print('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => isLoading = false);
      print('Fetch error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FD),
      appBar: AppBar(
        title: const Text('Admin Home',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.blueAccent))
          : Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 360,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.blueAccent),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            adminName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.blueAccent),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            adminEmail,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline, size: 24,color: Colors.white,),
                  label: const Text(
                    'Add a SubAdmin',
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddSubadminScreen(adminId: widget.adminId),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
