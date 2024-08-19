import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      backgroundColor: Colors.blue,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         CircularProgressIndicator(backgroundColor: Colors.white,),
         SizedBox(height: 1,),
          Text(
            'Carregando...',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ));
  }
}
