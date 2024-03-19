import 'package:flutter/material.dart';
import 'package:pos/constant/dimension.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.width45,
        height: Dimensions.height30,
        decoration: BoxDecoration(
            border: const Border.symmetric(),
            borderRadius: BorderRadius.circular(10)),
        child: const Card(
          child: Center(child: Text('Search')),
        ),
      ),
    );
  }
}
