import 'package:flutter/material.dart';
import 'package:sample_chat/screens/profile_screen.dart';
import '../models/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen(user: user)),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            user.backgroundImage,
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          user.intro,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
