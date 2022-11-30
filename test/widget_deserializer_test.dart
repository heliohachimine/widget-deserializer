import 'package:flutter_test/flutter_test.dart';

import 'package:widget_deserializer/widget_deserializer.dart';

void main() {
  test('deserialize', () {
    Deserializer.deserialize('{"type":"column","data":{"children":[{"type":"container","data":{"backgroundColor":{"value":"#10103D"},"child":{"type":"label","data":{"text":"Hello World","aligment":"CENTER"},"padding":20}}},{"type":"button","data":{"text":"Click here","action":{"type":"NAVIGATE","route":"https://www.google.com"}}},{"type":"label","data":{"text":"Hello World"},"padding":20}]}}');
  });
}
