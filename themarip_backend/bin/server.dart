import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import '../lib/services/postgres_service.dart'; // ✅

void main() async {
  final db = PostgresService(); // ✅
  await db.connect(); // ✅

  final router = Router();

  router.post('/kys/risk-profile', (Request req) async {
    final body = await req.readAsString();
    print('Received Risk Profile: $body');
    // TODO: Save to DB
    return Response.ok('{"status":"success"}',
        headers: {'Content-Type': 'application/json'});
  });

  router.post('/signup', (Request req) async {
    final body = await req.readAsString();
    print('Signup request received: $body');
    // TODO: Save to DB
    return Response.ok('{"status":"signed_up"}',
        headers: {'Content-Type': 'application/json'});
  });

  router.get('/kyc/status', (Request req) async {
    return Response.ok('{"kyc_status":"pending"}',
        headers: {'Content-Type': 'application/json'});
  });

  router.post('/transactions', (Request req) async {
    final body = await req.readAsString();
    print('Transaction data: $body');
    return Response.ok('{"status":"transaction_received"}',
        headers: {'Content-Type': 'application/json'});
  });

  router.get('/user/profile', (Request req) async {
    return Response.ok('{"username":"demo_user"}',
        headers: {'Content-Type': 'application/json'});
  });

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(router.call);

  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  final server = await io.serve(handler, '0.0.0.0', port);
  print('🚀 Server running on http://${server.address.host}:${server.port}');
}
