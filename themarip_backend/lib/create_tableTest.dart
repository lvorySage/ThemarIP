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
    print('✅ Connected to DB. Creating table...');

    await conn.query('''
      CREATE TABLE IF NOT EXISTS risk_profiles (
        id SERIAL PRIMARY KEY,
        user_id TEXT NOT NULL,
        answers TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW()
      );
    ''');

    print('✅ Table created or already exists.');
    await conn.close();
  } catch (e) {
    print('❌ Failed to create table: $e');
  }
}
