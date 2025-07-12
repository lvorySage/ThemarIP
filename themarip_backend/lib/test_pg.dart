import 'package:postgres/postgres.dart';

void main() async {
  final conn = PostgreSQLConnection(
    'themardb.postgres.database.azure.com', //  hostname (no dash)
    5432,
    'themarip_db',
    username: 'Plaguo@themardb', // FIBNALLYYY FIXED username domain to match hostname
    password: 'Th96116119\$\$\$666', // edcaped  correctly if needed
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
