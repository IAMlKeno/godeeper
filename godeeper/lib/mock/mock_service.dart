import 'dart:convert';

import 'package:godeeper/models/sermon.dart';
import 'package:godeeper/utils.dart';

class MockService {
  Sermon getSermon(String id) => Sermon(
      uuid: id,
      name: "A Mocked Sermon",
      date: DateTime.now(),
    );

  Sermon addSermon(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    data.addAll({"id": getRandomUuid()});

    return Sermon.fromMap(data);
  }

  Sermon updateSermon(String json) {
    final data = jsonDecode(json);

    return Sermon.fromMap(data);
  }

  List<Sermon> getSermons(int size, int page) {
    List<Sermon> list = [];

    for (var i = 0; i < size; i++) {
      list.add(
        Sermon(
          uuid: i.toString(),
          name: "A Mocked Sermon ${i.toString()}",
          date: DateTime.now(),
        ),
      );
    }

    return list;
  }

}