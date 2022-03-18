// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _Service implements Service {
  _Service(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://ministerial-scale-api.herokuapp.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Scale>> getScales() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Scale>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'scales',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Scale.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Scale> createScale(scale) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scale.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Scale>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'scales',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Scale.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Scale>> getScalesByDate(date) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'date': DateFormat(Strings.dateFormatBrazilian).format(date)
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Scale>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'scales/byDate',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Scale.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
