import 'dart:io';

/// 启动服务器
Future<void> startServer() async {
  /// 创建服务器
  final server = await _createServer();
  //print('服务器启动: ${server.address} port ${server.port}');
  /// 启动服务
  _handleRequests(server);
}

///这将创建一个监听本地主机IP地址(127.0.0.1)、端口为4040的服务器。
Future<HttpServer> _createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 4040;
  return await HttpServer.bind(address, port);
}

Future<void> _handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    switch (request.method) {
      case 'GET':
        _handleGet(request);
        break;
      case 'POST':
        _handlePost(request);
        break;
      default:
        _handleDefault(request);
    }
  }
}

Future<void> _handleGet(HttpRequest request) async {
  request.response
    ..write("handleGet")
    ..close();
}

Future<void> _handlePost(HttpRequest request) async {
  request.response
    ..write("handlePost")
    ..close();
}

Future<void> _handleDefault(HttpRequest request) async {
  request.response
    ..write("handleDefault")
    ..close();
}
