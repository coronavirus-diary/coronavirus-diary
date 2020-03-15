import 'package:moor/moor.dart';

import 'package:coronavirus_diary/src/data/models/subjective_questions.dart';
import 'package:coronavirus_diary/src/data/models/vitals.dart';
import 'tables/index.dart';

part 'database.g.dart';

@UseMoor(tables: tables)
class Database {}
