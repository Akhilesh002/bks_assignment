import 'package:flutter/material.dart';

class Data {
  static const List<Map<String, dynamic>> data = [
    {"title": "Gold Buy Rate", "price": "₹5,220.89"},
    {"title": "LBMA Rate", "price": "\$1089/oz."},
    {"title": "Dollar Rate", "price": "\$87.72"}
  ];

  static const List<Map<String, dynamic>> chartFooter = [
    {"title": "Live", "value": "1957.54"},
    {"title": "Open", "value": "1957.74"},
    {"title": "Volum", "value": "67.069k"},
    {"title": "Days Range", "value": "1955.17 - 1987.08"},
  ];

  static const List<Map<String, dynamic>> pageFooter = [
    {
      "icon": "assets/images/gold.png",
      "title": "Sell Old Gold",
      "subTitle": "Sell Your Old Jewelery for Markets best Price",
      "cardColor": Color(0xFFFFF7EC),
    },
    {
      "icon": "assets/images/gold.png",
      "title": "Gold Saving Plan",
      "subTitle": "Sell Your Old Jewelery for Markets best Price",
      "cardColor": Color(0xFFF3EBFB),
    },
    {
      "icon": "assets/images/gold.png",
      "title": "Bid Buy Gold",
      "subTitle": "Sell Your Old Jewelery for Markets best Price",
      "cardColor": Color(0xFFFFEDEB),
    },
  ];
}
