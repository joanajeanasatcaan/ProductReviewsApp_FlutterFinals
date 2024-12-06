import 'package:flutter/material.dart';
import '../models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ReviewCard({
    Key? key,
    required this.review,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(review.reviewerName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.content),
            Text('Rating: ${review.rating}'),
            Text('Date: ${review.date}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
