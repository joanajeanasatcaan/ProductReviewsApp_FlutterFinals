import 'package:flutter/material.dart';
import '../models/review.dart';

class AddReviewPage extends StatefulWidget {
  final Function(Review) onAddReview;

  AddReviewPage({required this.onAddReview});

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final _formKey = GlobalKey<FormState>();
  final _reviewerNameController = TextEditingController();
  final _contentController = TextEditingController();
  final _ratingController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final review = Review(
        id: DateTime.now().millisecondsSinceEpoch,
        reviewerName: _reviewerNameController.text,
        content: _contentController.text,
        rating: double.parse(_ratingController.text),
        date: DateTime.now().toLocal().toString().split(' ')[0],
      );

      widget.onAddReview(review);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Review',
          style: TextStyle(
            fontFamily: 'Poppins', 
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(  
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _reviewerNameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.teal, fontFamily: 'Poppins'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  style: TextStyle(fontFamily: 'Poppins'), 
                ),
                SizedBox(height: 15),
                
                TextFormField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Review',
                    labelStyle: TextStyle(color: Colors.teal, fontFamily: 'Poppins'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a review';
                    }
                    return null;
                  },
                  maxLines: 4,
                  style: TextStyle(fontFamily: 'Poppins'), 
                ),
                SizedBox(height: 15),
                
                TextFormField(
                  controller: _ratingController,
                  decoration: InputDecoration(
                    labelText: 'Rating (1-5)',
                    labelStyle: TextStyle(color: Colors.teal, fontFamily: 'Poppins'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null || double.parse(value) < 1 || double.parse(value) > 5) {
                      return 'Please enter a valid rating (1-5)';
                    }
                    return null;
                  },
                  style: TextStyle(fontFamily: 'Poppins'), 
                ),
                SizedBox(height: 30),
                
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
