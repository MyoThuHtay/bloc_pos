import 'package:flutter/material.dart';
import 'package:pos/constant/dimension.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
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
          child: Center(child: Text('AccountInfo')),
        ),
      ),
    );
  }
}