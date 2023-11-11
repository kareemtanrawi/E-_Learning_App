import 'package:e_learning/model/course.dart';
import 'package:flutter/material.dart';

class FavouriteOption extends StatefulWidget {
  const FavouriteOption({super.key, required this.cource});
  final Course cource;
  @override
  State<FavouriteOption> createState() => _FavouriteOptionState();
}

class _FavouriteOptionState extends State<FavouriteOption> {
  bool isFavourite = false;
  @override
  void initState() {
    super.initState();
    isFavourite = widget.cource.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
          widget.cource.isFavorite = isFavourite;
        });
      },
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
    );
  }
}
