import 'package:moor/moor.dart';

import 'tables/index.dart';

part 'database.g.dart';

@UseMoor(tables: tables)
class Database {}
