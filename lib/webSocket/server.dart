import 'dart:io';

void main() async {
  final server = await HttpServer.bind('127.0.0.1', 4040);
  print('✅ WebSocket Server started on ws://127.0.0.1:4040');

  await for (HttpRequest request in server) {
    if (WebSocketTransformer.isUpgradeRequest(request)) {
      WebSocketTransformer.upgrade(request).then(handleClient);
    }
  }
}

final List<WebSocket> clients = [];

void handleClient(WebSocket socket) {
  print('🟢 New client connected!');
  clients.add(socket);

  socket.listen((message) {
    print('💬 Server got: $message');

    // Send to all clients (including sender)
    for (var client in clients) {
      client.add('📢 From server: $message');
    }
  }, onDone: () {
    print('🔴 Client disconnected!');
    clients.remove(socket);
  });
}
