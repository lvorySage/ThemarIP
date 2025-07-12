import 'package:postgres/postgres.dart';

void main() {
  final conn = PostgreSQLConnection('localhost', 5432, 'testdb');
  print('If you see this, the postgres package is working ✅');
}
