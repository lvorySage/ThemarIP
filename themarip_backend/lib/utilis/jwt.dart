import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const _jwtSecret = 'thEmaR_IP$$^^666'; // Change this to something secure and store it in env

class JwtUtils {
  /// generates a JWT token for a user with given claims
  static String generateToken({
    required String userId,
    String role = 'user',
    Duration expiry = const Duration(hours: 1),
  }) {
    final jwt = JWT(
      {
        'userId': userId,
        'role': role,
      },
      issuer: 'themarip.com',
    );

    return jwt.sign(SecretKey(_jwtSecret), expiresIn: expiry);
  }

  /// verifies a jfwt token and returns the decoded payload
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
``