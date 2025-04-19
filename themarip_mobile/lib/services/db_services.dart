import 'package:postgres/postgres.dart';

class DBService {
  final connection = PostgreSQLConnection(
    'localhost', 5432, 'themar_db',
    username: 'themar_user',
    password: 'secure_pw',
  );

  Future<void> connect() async => await connection.open();

  Future<void> saveRiskProfile(String userId, List<Map<String, String>> answers) async {
    await connection.query('INSERT INTO risk_profiles (user_id, answers) VALUES (@userId, @answers)', substitutionValues: {
      'userId': userId,
      'answers': answers.toString(),
    });
  }
}
// most of these are place holders for now