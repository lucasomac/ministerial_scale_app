import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:ministerial_scale_app/utils/strings.dart';
import 'package:retrofit/retrofit.dart';

import '../model/scale.dart';

part 'service.g.dart';

@RestApi(baseUrl: "https://ministerial-scale-api.herokuapp.com/")
abstract class Service {
  factory Service(Dio dio, {String baseUrl}) = _Service;

  @GET("scales")
  Future<List<Scale>> getScales();

  @POST("scales")
  Future<Scale> createScale(@Body() Scale scale);

  @GET("scales/byDate")
  Future<List<Scale>> getScalesByDate(@Query("date", encoded: true) DateTime date);
}
