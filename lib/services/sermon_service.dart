import 'package:godeeper/models/sermon.dart';
import 'package:godeeper/services/abstract/base_service.dart';

class SermonService extends BaseService {

  static Sermon getSermon(String id) => Sermon(
      uuid: id,
      name: "Sermon 1",
      date: DateTime.now(),
    );
  static Sermon addSermon(Sermon data) {
    data.toJson();

    return data;
  }

  static Sermon updateSermon(Sermon data) {
    data.toJson();

    return data;
  }

}
