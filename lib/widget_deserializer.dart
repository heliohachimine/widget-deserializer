library widget_deserializer;

import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Deserializer {
  static deserialize(String jsonString) {
    try{
      Map<String, dynamic> root = jsonDecode(jsonString);
      List<Widget> lista = [];
      root.forEach((key, value) {
        switch(key) {
          case 'type':
            print('Call Widget Builder to $value');
            break;
          case 'data':
          case 'child':
          case 'action':
            Deserializer.deserialize(jsonEncode(value));
            break;
          case 'children':
            Deserializer.deserializeList(jsonEncode(value));
            break;
          default:
            print('key: $key, value: $value');
            break;
        }
      });
    }catch(e){
      print(e);
    }
  }
  static deserializeList(String jsonString) {
    try{
      List<dynamic> root = jsonDecode(jsonString);
      root.forEach((subRoot) {
        subRoot.forEach((key, value) {
          switch(key) {
            case 'type' :
              print('Call Widget Builder to $value');
              break;
            case 'child':
            case 'data':
                Deserializer.deserialize(jsonEncode(value));
                break;
            case 'children':
              Deserializer.deserializeList(jsonEncode(value));
              break;
            default:
              print('key: $key, value: $value');
              break;
          }
        });
      });
    }catch(e){
      print(e);
    }
  }
}
