import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  final String? imageUrl;
  const PromoWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
          height: 200,
          fit: BoxFit.cover,
          imageUrl ??
              "https://media.istockphoto.com/id/1466899592/vector/colorful-poster-cinema-with-popcorn-a-ticket-and-clapperboard.jpg?s=612x612&w=0&k=20&c=JHvcZwSi7gWaqZ3P_22g-WQa0ISLlhRT4Ihi8mKLkJw="),
    );
  }
}
