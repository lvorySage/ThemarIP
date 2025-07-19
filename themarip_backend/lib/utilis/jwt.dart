import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import '../../config/env.dart';

final _jwtSecret = env['JWT_SECRET']!;

class JwtUtils {
  static String generateToken({
    required String userId,
    String role = 'user',
    Duration expiry = const Duration(hours: 1),
  }) {
    final jwt = JWT({'userId': userId, 'role': role}, issuer: 'themarip.com');

    return jwt.sign(SecretKey(_jwtSecret), expiresIn: expiry);
  }

  static Map<String, dynamic> verifyToken(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey(_jwtSecret));
      return jwt.payload;
    } on JWTExpiredError {
      throw Exception('Token expired');
    } on JWTError catch (e) {
      throw Exception('Token verification failed: ${e.message}');
    }
  }
}
