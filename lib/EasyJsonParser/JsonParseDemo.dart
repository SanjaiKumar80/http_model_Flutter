import 'package:flutter/material.dart';
import 'package:httpmodel/EasyJsonParser/Services.dart';

import 'Users.dart';

class JsonParseDemo extends StatefulWidget {
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User> _users;


  @override
  void initState() {
    super.initState();

    Services.getUsers().then((User) {
      _users = User;;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "User"
      ),
    ),
    body: Container(
    color: Colors.white,
    child: ListView.builder(
    itemCount: null == _users ? 0 : _users.length,
    itemBuilder: (context, index) {
    User user = _users[index];
    return ListTile(
    title: Text(user.name),
    subtitle:Text(user.email),

    );
    },
    )
    ,
    )
    ,
    );
  }
}
