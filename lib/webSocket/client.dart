import 'dart:io';

void main() async {
  final socket = await WebSocket.connect('ws://127.0.0.1:4040');
  print('✅ Connected to server!');

  // Listen for messages from server
  socket.listen((message) {
    print('📩 New message: $message');
  });

  // Send test messages
  while (true) {
    stdout.write('Enter message: ');
    final msg = stdin.readLineSync();
    if (msg == 'exit') break;
    socket.add(msg);
  }

  socket.close();
}
