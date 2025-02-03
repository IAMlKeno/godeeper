import 'package:intl/intl.dart';
import 'package:uuid/v4.dart';

String getRandomUuid() => const UuidV4().generate();

String cleanDate(DateTime date) => DateFormat('yyyy/MM/dd').format(date);