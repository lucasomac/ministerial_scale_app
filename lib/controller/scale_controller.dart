import 'package:dio/dio.dart';
import 'package:ministerial_scale_app/model/scale.dart';
import 'package:ministerial_scale_app/service/service.dart';

class ScaleController {
  final Dio _dio = Dio();
  late Service _client;

  ScaleController() {
    _dio.options.contentType = "application/json; charset=utf-8";
    _client = Service(_dio);
  }

  Future<List<Scale>> getAllScales() {
    return _client.getScales();
  }

  Future<List<Scale>> getScalesByDate(DateTime date) {
    return _client.getScalesByDate(date);
  }
}
