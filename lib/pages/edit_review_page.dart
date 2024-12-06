import 'package:flutter/material.dart';
import '../models/review.dart';

class EditReviewPage extends StatefulWidget {
  final Review review;
  final Function(Review) onEditReview;

  const EditReviewPage({
    Key? key,
    required this.review,
    required this.onEditReview,
  }) : super(key: key);

  @override
  _EditReviewPageState createState() => _EditReviewPageState();
}

class _EditReviewPageState extends State<EditReviewPage> {
  late TextEditingController _nameController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.review.reviewerName);
    _contentController = TextEditingController(text: widget.review.content);
  }

  void _submitEditedReview() {
    final updatedReview = Review(
      id: widget.review.id,
      reviewerName: _nameController.text,
      content: _contentController.text,
      rating: widget.review.rating,
      date: widget.review.date,
    );

    widget.onEditReview(updatedReview);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Review',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Reviewer Name',
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 15),
              
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Review Content',
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                maxLines: 5,
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitEditedReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
