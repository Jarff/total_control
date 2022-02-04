import 'package:flutter/material.dart';
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
    //   await userRepository.getUser();
    //   if (userRepository.currentUser.value.id_user != null) {
    //     Navigator.of(context).pushReplacementNamed(
    //       '/Home',
    //       arguments: userRepository.currentUser.value,
    //     );
    //   } else {
    //   }
    // }
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.of(context).pushReplacementNamed('/Start');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0x84373737),
                        offset: Offset(0, 0),
                        spreadRadius: 4,
                      ),
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(25.0), child: Container()
                    // Image.asset(
                    //   'assets/dart.png',
                    //   width: 150,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
              )
            ],
          )),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
