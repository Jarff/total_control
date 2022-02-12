import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:v_card/src/repository/user_repository.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  // UserRepository userRepository = UserRepository();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    bool skipTurorial = prefs.getBool('tutorialDone') ?? false;
    if (skipTurorial) {
      await Navigator.of(context).pushReplacementNamed('/Pages');
    } else {
      await Navigator.of(context).pushReplacementNamed('/Start');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
