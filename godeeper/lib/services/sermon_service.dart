import 'package:godeeper/models/sermon.dart';
import 'package:godeeper/services/abstract/base_service.dart';

class SermonService extends BaseService {

  @override
  Sermon getOne(String id) => api.getSermon(id);

  @override
  List<Sermon> getAll([int page = 1, int size = 50]) => api.getSermons(page, size);

  @override
  Sermon create(String json) => api.addSermon(json);

  @override
  Sermon update(String json) => api.updateSermon(json);

  @override
  Sermon delete(String id) => throw Exception('not implemented');

}
