import 'package:postgres/postgres.dart';

class PostgresService {
  late PostgreSQLConnection connection;

  Future<void> connect() async {
    connection = PostgreSQLConnection(
      'themar-db.postgres.database.azure.com', // Azure PostgreSQL FQDN
      5432,
      'themarip_db', // your DB name
      username: 'themaradmin@themar-db', // full username required by Azure
      password: 'ThemarIP_DB$$$66', // change this securely
      useSSL: true,
    );

    await connection.open();
    print('📡 PostgreSQL connected successfully!');
  }

  Future<void> close() async {
    await connection.close();
    print('🔌 PostgreSQL connection closed.');
  }
}
