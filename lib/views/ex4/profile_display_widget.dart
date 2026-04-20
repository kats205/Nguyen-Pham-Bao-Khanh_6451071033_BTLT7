import 'package:btlt7/data/models/user_profile.dart';
import 'package:flutter/material.dart';

class ProfileDisplayWidget extends StatelessWidget {
  final UserProfileModel profile;

  const ProfileDisplayWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: const Icon(Icons.person, size: 40),
          title: const Text('Họ và Tên'),
          subtitle: Text(profile.fullName, style: const TextStyle(fontSize: 18)),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.phone, size: 40),
          title: const Text('Số Điện Thoại'),
          subtitle: Text(profile.phoneNumber, style: const TextStyle(fontSize: 18)),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.email, size: 40),
          title: const Text('Email'),
          subtitle: Text(profile.email, style: const TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}