import 'package:bks_assignment/screens/widgets/chart.dart';
import 'package:bks_assignment/screens/widgets/cta.dart';
import 'package:bks_assignment/screens/widgets/page_footer.dart';
import 'package:bks_assignment/screens/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/strings.dart';
import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PageHeader(
              dataList: Data.data,
            ),
            const Flexible(
              child: WebChart(
                webFooterData: Data.chartFooter,
              ),
            ),
            const Flexible(
              child: PageFooter(
                pageFooterData: Data.pageFooter,
              ),
            ),
            const Cta().paddingOnly(top: 8, bottom: 40),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.arrow_back_outlined,
        color: Colors.black,
      ),
      titleSpacing: 0,
      title: const Text(
        Strings.liveGoldTrends,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
