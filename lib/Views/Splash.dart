import 'package:flutter/material.dart';
import 'package:revolt/utils.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<dynamic> loadingFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingFuture = Utils.loadingFuture();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(65),
                child: Image.asset(
                  'assets/images/error.png',
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => Navigator.pushReplacementNamed(context, '/wellcome'));
          }
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
