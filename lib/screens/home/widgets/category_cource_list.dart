import './category_list.dart';
import './cource_list.dart';
import 'package:e_learning/notifier/cource_category_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CategoryCourceList extends StatelessWidget {
  const CategoryCourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => courceCategoryChangeNotifier(),
      child: const Column(
        children: [
          CategoryList(),
          CourceList(),
        ],
      ),
    );
  }
}
