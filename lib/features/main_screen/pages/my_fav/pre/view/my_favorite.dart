import 'package:flutter/material.dart';

class MyFavorite  extends StatelessWidget {
  const MyFavorite ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("My Favorite", style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
