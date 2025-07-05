import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

void main() async {
  final router = Router();

  // === External API: Risk Profiling ===
  router.post('/kys/risk-profile', (Request req) async {
    final body = await req.readAsString();
    print('Received Risk Profile: $body');
    // TODO: Validate & store risk profile to DB
    return Response.ok('{"status":"success"}',
        headers: {'Content-Type': 'application/json'});
  });

  // === Auth: Signup ===
  router.post('/signup', (Request req) async {
    final body = await req.readAsString();
    print('Signup request received: $body');
    // TODO: Parse JSON, validate, store user in DB
    return Response.ok('{"status":"signed_up"}',
        headers: {'Content-Type': 'application/json'});
  });

  // === KYC Status ===
  router.get('/kyc/status', (Request req) async {
    // TODO: Use query params / auth token to identify user
    return Response.ok('{"kyc_status":"pending"}',
        headers: {'Content-Type': 'application/json'});
  });

  // === Transactions Endpoint ===
  router.post('/transactions', (Request req) async {
    final body = await req.readAsString();
    print('Transaction data: $body');
    // TODO: Store transaction and validate amounts/limits
    return Response.ok('{"status":"transaction_received"}',
        headers: {'Content-Type': 'application/json'});
  });

  // === User Profile ===
  router.get('/user/profile', (Request req) async {
    // TODO: Return user profile from DB (requires auth)
    return Response.ok('{"username":"demo_user"}',
        headers: {'Content-Type': 'application/json'});
  });

  // === Middleware & Server Boot ===
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(router.call);

  final server = await io.serve(handler, '0.0.0.0', 8080);
  print('🚀 Server running on http://${server.address.host}:${server.port}');
}
