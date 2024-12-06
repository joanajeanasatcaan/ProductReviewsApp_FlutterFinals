import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/review.dart';
import 'add_review_page.dart';
import 'edit_review_page.dart';
import '../widgets/review_card.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<Review> reviews = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/comments';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          reviews = data.take(10).map((reviewJson) {
            return Review(
              id: reviewJson['id'],
              reviewerName: reviewJson['name'],
              content: reviewJson['body'],
              rating: (5 * (reviewJson['id'] % 5) + 1).toDouble(), // Dummy rating
              date: DateTime.now().toLocal().toString().split(' ')[0],
            );
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (error) {
      print('Error fetching reviews: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _addReview(Review review) {
    setState(() {
      reviews.add(review);
    });
  }

  void _editReview(Review updatedReview) {
    setState(() {
      reviews = reviews.map((review) {
        return review.id == updatedReview.id ? updatedReview : review;
      }).toList();
    });
  }

  void _deleteReview(int id) {
    setState(() {
      reviews.removeWhere((review) => review.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Reviews',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : reviews.isEmpty
              ? Center(
                  child: Text(
                    'No reviews available',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return ReviewCard(
                      review: reviews[index],
                      onDelete: () => _deleteReview(reviews[index].id),
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditReviewPage(
                              review: reviews[index],
                              onEditReview: _editReview,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddReviewPage(onAddReview: _addReview),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
