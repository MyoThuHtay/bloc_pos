import 'package:flutter/material.dart';
import 'package:pos/constant/dimension.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          child: Center(child: Text('History')),
        ),
      ),
    );
  }
}