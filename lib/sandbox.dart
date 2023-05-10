import 'dart:math';

import 'package:sandbox/gateway_client.dart';

Future<void> main() async {
  final url = 'broker.hivemq.com';
  final port = 1883;

  final a = GatewayClient(
      brokerID: 'brokerID',
      url: url,
      port: port,
      account: null,
      password: null);

  await a.connect().then((value) {
    // a.subscribe(topic: 'phongooo', qos: 1);
    while (true) {
      final random = Random().nextInt(10) + 20;
      a.published(
          payload: '{"value": $random}',
          topic: 'phongaaa',
          retain: false,
          qos: 1);
    }
    // a.disconnect();
  });
}
