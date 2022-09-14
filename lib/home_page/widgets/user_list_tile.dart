import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final String title, subTitle;

  const UserListTile({Key? key, required this.subTitle, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}
