import 'package:flutter/material.dart';
import 'package:pos/constant/dimension.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
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
          child: Center(child: Text('Notification')),
        ),
      ),
    );
  }
}
