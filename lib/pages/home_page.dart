import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'reviews_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Review App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: "Poppins", 
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Product Review App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontFamily: "Poppins", 
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, 
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'View Reviews',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poppins", 
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, 
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Profile Page',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poppins", 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
