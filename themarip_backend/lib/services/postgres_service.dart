import 'package:postgres/postgres.dart';

class PostgresService {
  late PostgreSQLConnection connection;

  Future<void> connect() async {
    connection = PostgreSQLConnection(
      'themar-db.postgres.database.azure.com',
      5432,
      'themarip_db',
      username: 'Plaguo@themar-db',
      password: r'Th96116119$$$666',
      useSSL: true,
    );

    await connection.open();
    print('📡 PostgreSQL connected successfully!'); // excuse me for the silly emojies lmao
  }

  Future<void> close() async {
    await connection.close();
    print('🔌 PostgreSQL connection closed.');
  }
}
