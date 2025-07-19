import 'package:dotenv/dotenv.dart';

final env = DotEnv()..load();

String get jwtSecret => env['JWT_SECRET']!;
