import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_chat/models/user.dart';
import 'package:sample_chat/components/round_icon_button.dart';
import 'package:sample_chat/components/bottom_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              FontAwesomeIcons.xmark,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: const [
            RoundIconButton(icon: FontAwesomeIcons.gift),
            SizedBox(
              width: 15,
            ),
            RoundIconButton(icon: FontAwesomeIcons.gear),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            const Spacer(),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.intro,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white),
            (user.name == me.name) ? _buildMyIcon() : _buildFriendIcon()
          ],
        ),
      ),
    );
  }

  Widget _buildMyIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: '나와의 채팅'),
          SizedBox(width: 50),
          BottomIconButton(icon: FontAwesomeIcons.pen, text: '프로필 편집'),
        ],
      ),
    );
  }

  Widget _buildFriendIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: '1:1 채팅'),
          SizedBox(width: 50),
          BottomIconButton(icon: FontAwesomeIcons.phone, text: '통화하기'),
        ],
      ),
    );
  }
}
