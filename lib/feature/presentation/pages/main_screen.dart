import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app/feature/presentation/widgets/category_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white
          )
        ],
      ),
      body: CategoryList(),
    );
  }
}
