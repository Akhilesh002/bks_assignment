import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({super.key, required this.pageFooterData});

  final List<Map<String, dynamic>> pageFooterData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: pageFooterData.length,
        itemBuilder: (context, index) =>
            buildFooterWidget(pageFooterData[index]),
      ),
    );
  }

  Widget buildFooterWidget(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 5,
        color: data["cardColor"],
        child: ListTile(
          leading: Image.asset(
            data["icon"],
            fit: BoxFit.cover,
            height: 40,
            width: 40,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data["title"],
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 32,
              ),
            ],
          ),
          subtitle: Text(
            data["subTitle"],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
