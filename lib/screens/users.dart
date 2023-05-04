import 'package:flutter/material.dart';

import '../services/apiservice.dart';

class MonEcran extends StatefulWidget {
   static String routeName = "/users";
  @override
  _MonEcranState createState() => _MonEcranState();
}

class _MonEcranState extends State<MonEcran> {
  Future<String> _fetchData() async {
    final response = await ApiService.get('mes-donnees');

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon écran'),
      ),
      body: FutureBuilder<String>(
        future: _fetchData(),
        builder:  (context, snapshot) {
          if (snapshot.hasData) {
             
            return Text(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
