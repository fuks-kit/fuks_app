import 'package:fuks_app/generated/app_services/google/protobuf/timestamp.pb.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat('dd.MM.yyyy kk:mm');

class GermanDateUtils {
  static String format(Timestamp stamp) => dateFormat.format(
        stamp.toDateTime(),
      );
}
