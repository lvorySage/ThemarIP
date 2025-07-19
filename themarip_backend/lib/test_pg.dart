import 'package:postgres/postgres.dart';

void main() async {
  final conn = PostgreSQLConnection(
    'themardb.postgres.database.azure.com',
    5432,
    'postgres',
    username: 'Plaguo@themardb',
    password: 'Th96116119',
    useSSL: true,
  );

  try {
    await conn.open();
    print('✅ Connected successfully to Azure PostgreSQL');
    await conn.close();
  } catch (e) {
    print('❌ Connection failed: $e');
  }
}
