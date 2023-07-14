import 'package:bks_assignment/base/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key, required this.dataList});

  final List<Map<String, dynamic>> dataList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getTrendingWidget(data: dataList),
      ),
    );
  }

  List<Widget> getTrendingWidget({required List<Map<String, dynamic>> data}) {
    List<Widget> children = [const SizedBox.shrink()];

    for (int i = 0; i < data.length; i++) {
      children.add(
        Stack(
          children: [
            Container(
              height: 80,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: i == 0 ? Colors.black : Colors.black26,
                  width: i == 0 ? 2 : 1,
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        data[i]["title"],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: Colors.black54,
                      )
                    ],
                  ).paddingOnly(bottom: 8),
                  Row(
                    children: [
                      Text(
                        data[i]["price"],
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_upward,
                        size: 20,
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (i == 0)
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                  height: 4,
                ),
              ),
            Positioned(
              top: 0,
              left: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      Strings.live,
                      style: TextStyle(color: Colors.red.shade300),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    return children;
  }
}
