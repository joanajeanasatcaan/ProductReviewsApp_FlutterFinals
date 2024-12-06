import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(ProductReviewApp());
}

class ProductReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
