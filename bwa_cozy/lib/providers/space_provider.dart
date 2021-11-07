import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bwa_cozy/models/space_model.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result = await http.get(
      Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'),
    );
    print(result.statusCode);
    // print(result.body);
    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      print('\n\n\nINI DATA: ${data}');
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      print('\n\n\nINI SPACES: ${spaces}');
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
