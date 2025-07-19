import 'package:postgres/postgres.dart';

void main() async {
  final conn = PostgreSQLConnection(
    'themardb.postgres.database.azure.com',
    5432,
    'postgres',
    username: 'plaguo@themardb',
    password: 'Th96116119',
    useSSL: true,
  );

  try {
    await conn.open();
    print('✅ Connected successfully to Azure PostgreSQL');

    // sample: Create table if needed willl be changed later
    await conn.query('''
      CREATE TABLE IF NOT EXISTS risk_profiles (
        id SERIAL PRIMARY KEY,
        user_id TEXT NOT NULL,
        answers TEXT
      );
    ''');

    print('📦 Table check/creation complete.');

    await conn.close();
  } catch (e) {
    print('❌ Connection failed: $e');
  }
}
