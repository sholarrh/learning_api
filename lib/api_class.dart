
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart';
import 'dart:convert';

import 'get_class.dart';

class apiCalls extends ChangeNotifier {

  Future<apiModel> api_class() async {
    var url = Uri.parse('https://reqres.in/api/unknown');
    var response = await get(url);

    // Status code of 200 means successful
    print('Response status: ${response.statusCode}');

    // The output of this print statement shows the response in double quotes
    // which means it is encoded.
    print('Response body: ${response.body}');

    var responseData = getCLassModelFromJson(response.body);

    // The output of this print statement shows the response in no quotes
    // which means it is decoded and the values or keys in the body
    // can be assesed.
    print(responseData);
    print(responseData.data![1].name);

    return responseData;
  }

}
