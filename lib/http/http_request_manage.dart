class HttpRequestManage {
  HttpRequestManage._privateConstructor();

  static final HttpRequestManage _instance =
      HttpRequestManage._privateConstructor();

  static HttpRequestManage get instance {
    return _instance;
  }
}

extension RequestBussiness on HttpRequestManage {}
