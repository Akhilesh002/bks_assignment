import 'package:bks_assignment/base/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebChart extends StatelessWidget {
  const WebChart({super.key, required this.webFooterData});

  final List<Map<String, dynamic>> webFooterData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              width: Get.width,
              height: Get.height * 0.30,
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    Constant.MAP_URL,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getFooterWidget(footerData: webFooterData),
            )
          ],
        ).paddingAll(10),
      ),
    );
  }

  List<Widget> getFooterWidget(
      {required List<Map<String, dynamic>> footerData}) {
    List<Widget> children = [const SizedBox.shrink()];

    for (int i = 0; i < footerData.length; i++) {
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(footerData[i]["title"], style: const TextStyle(
                color: Colors.black45
              ),).paddingOnly(bottom: 2),
              Text(
                footerData[i]["value"],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      );
      if (i != footerData.length - 1) {
        children.add(
          Container(
            height: 60,
            width: 1,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black12)),
          ),
        );
      }
    }
    return children;
  }
}
