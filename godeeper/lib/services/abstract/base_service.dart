import 'package:godeeper/mock/mock_service.dart';

abstract class BaseService {

  final api = MockService();

  getOne(String id);
  getAll([int page = 1, int size = 50]);
  create(String json);
  update(String json);
  delete(String id);

}
