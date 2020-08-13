import 'package:dio/dio.dart';

void main() async {
  try {
    var response = await Dio().get("https://mixin.one/");
    print(response);
  } catch (e) {
    print(e);
  }
}
