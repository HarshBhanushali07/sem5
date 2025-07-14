import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String testUid = "testUser";
  final Color yellow = Colors.amber;

  String formatDate(dynamic joinedDate) {
    try {
      final date = (joinedDate as Timestamp).toDate();
      return "${date.day}/${date.month}/${date.year}";
    } catch (_) {
      return "Invalid Date";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        
        centerTitle: true,
        backgroundColor: yellow,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(testUid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Profile not found"));
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    userData['profileImage'] ??
                        "https://i.ibb.co/yWZqz6v/profile-placeholder.png",
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 25),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person, color: yellow),
                        title: Text(userData['name'] ?? "No Name"),
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.email, color: yellow),
                        title: Text(userData['email'] ?? "No Email"),
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.phone_android, color: yellow),
                        title: Text(userData['phone'] ?? "No Phone"),
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.calendar_today, color: yellow),
                        title: Text(
                          userData['joinedDate'] != null
                              ? formatDate(userData['joinedDate'])
                              : "No Join Date",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
