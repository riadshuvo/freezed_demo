import 'package:flutter/material.dart';
import 'package:freeze_demo/repository/api_repo.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import '../widgets/user_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<User> userList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Freeded'),),
      body: FutureBuilder<List<User>>(
        future: ApiClient(http.Client()).getUsers(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else {
            return ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return UserListTile(
                      title: user.name,
                    subTitle: user.phone,
                    );
                });
          }
        }
      ),
    );
  }
}
