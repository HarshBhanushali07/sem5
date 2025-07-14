import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;
  final String testUid = "testuser2";

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(testUid).get();
      if (doc.exists) {
        setState(() {
          userData = doc.data();
        });
      } else {
        print("❌ No such user found.");
      }
    } catch (e) {
      print("🔥 Firestore fetch error: $e");
    }
  }

  Widget buildUserAvatar({required String? imageUrl,required String userName,bool useRandom = false}) {
      if (imageUrl != null && imageUrl.isNotEmpty) {
        return CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(imageUrl),
        );
      }
      // else if (useRandom) {
      //   final randomId = DateTime.now().millisecondsSinceEpoch % 1000;
      //   final randomAvatarUrl = "https://robohash.org/$randomId.png";
      //   return CircleAvatar(
      //     radius: 35,
      //     backgroundImage: NetworkImage(randomAvatarUrl),
      //   );
      //
      // }
      else {
        String initial = userName.isNotEmpty ? userName[0].toUpperCase() : "?";
        return CircleAvatar(
          radius: 35,
          backgroundColor: Colors.amber,
          child: Text(
            initial,
            style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      }
  }

  Widget buildOptionTile(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Profile")),
          backgroundColor: Colors.yellow[700],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
                    const SizedBox(width: 15),
                    const Text('My profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text("Personal details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text("Update", style: TextStyle(color: Colors.yellow[700], fontSize: 14)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        buildUserAvatar(
                          imageUrl: userData!['profile_image'],
                          userName: userData!['name']?.toString() ?? "",
                          useRandom: true,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData!['name']?.toString() ?? "No Name",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                userData!['email']?.toString() ?? "No Email",
                                style: const TextStyle(color: Colors.deepPurpleAccent),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                userData!['phone']?.toString() ?? "No Phone",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                userData!['address']?.toString() ?? "No Address",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                userData!['pinCode']?.toString() ?? "No Pin",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                buildOptionTile("Order History", Icons.history, () {}),
                buildOptionTile("Help", Icons.help_outline, () {}),
                buildOptionTile("Logout", Icons.logout, () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
