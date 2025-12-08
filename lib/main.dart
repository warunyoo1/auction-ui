import 'package:flutter/material.dart';
import 'src/presentation/main_navigation.dart';

void main() {
  runApp(const AuctionApp());
}

class AuctionApp extends StatelessWidget {
  const AuctionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auction UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainNavigation(),
    );
  }
}
