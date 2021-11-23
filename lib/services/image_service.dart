import 'dart:convert';

import 'package:cubit_practice/model/item_Model.dart';
import 'package:http/http.dart' as http;

class ImageService {
  Future<List<ItemModel>> fetchItem() async {
    try {
      final response =
          await http.get(Uri.parse('https://picsum.photos/v2/list?limit=10'));

      print(response.body);
      List<ItemModel> items = ItemModelFromJson(response.body);

      return items;
    } catch (e) {
      throw e;
    }
  }
}
