import 'package:bks_assignment/base/constant.dart';
import 'package:bks_assignment/controller/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebChart extends StatelessWidget {
  WebChart({super.key, required this.webFooterData});

  final List<Map<String, dynamic>> webFooterData;

  final thisController = Get.put(WebChartController());

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
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  width: Get.width,
                  height: Get.height * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InAppWebView(
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        thisController.showLoader.value = false;
                      }
                    },
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(
                        Constant.MAP_URL,
                      ),
                    ),
                  ),
                ),
                buildLoader()
              ],
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

  Widget buildLoader() {
    return Obx(() {
      final loader = thisController.showLoader.value;
      return loader
          ? const Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const SizedBox.shrink();
    });
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
              Text(
                footerData[i]["title"],
                style: const TextStyle(color: Colors.black45),
              ).paddingOnly(bottom: 2),
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
