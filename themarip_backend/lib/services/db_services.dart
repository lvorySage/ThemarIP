import '../../config/env.dart';
import 'package:postgres/postgres.dart';

class DBService {
  final connection = PostgreSQLConnection(
    env['PG_HOST']!,
    int.parse(env['PG_PORT']!),
    env['PG_DB']!,
    username: env['PG_USER']!,
    password: env['PG_PASS']!,
    useSSL: true,
  );

  Future<void> connect() async {
    await connection.open();
    print('📡 Connected to PostgreSQL');
  }

  Future<void> saveRiskProfile(
      String userId, List<Map<String, String>> answers) async {
    await connection.query(
      'INSERT INTO risk_profiles (user_id, answers) VALUES (@userId, @answers)',
      substitutionValues: {
        'userId': userId,
        'answers': answers.toString(),
      },
    );
  }

  Future<void> close() async {
    await connection.close();
    print('🔌 PostgreSQL connection closed.');
  }
}
