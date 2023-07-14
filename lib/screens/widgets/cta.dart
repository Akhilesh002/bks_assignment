import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/strings.dart';

class Cta extends StatelessWidget {
  const Cta({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFF551245),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 16, horizontal: Get.width * 0.38),
        ),
      ),
      child: const Text(
        Strings.buyGold,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
