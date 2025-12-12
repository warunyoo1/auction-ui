import 'package:flutter/material.dart';
import 'package:auction_ui/pages/login_page.dart';
import 'package:auction_ui/themes/app_theme.dart';

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
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
