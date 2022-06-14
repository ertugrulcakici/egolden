class ResponseModel {
  late ResponseType status;
  late String _message;
  late dynamic data;

  bool get isSuccess => status == ResponseType.success;
  String get message =>
      status == ResponseType.error ? _message : "Sunucu hatası";
  String get debugMessage => _message;

  ResponseModel.error(this._message,
      {this.status = ResponseType.connectionError, this.data = const {}});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['success'] == 1 ? ResponseType.success : ResponseType.error;
    _message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() =>
      {"success": status, "message": _message, "data": data};

  @override
  String toString() => toJson().toString();
}

enum ResponseType {
  success,
  error,
  connectionError,
}
