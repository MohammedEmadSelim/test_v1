import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  /// call bmi api
  Future<void> calBMI() async {
    emit(TestLoading());

    /// call by dio
    var dio = Dio();
    try {
      var res = await dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {"weight": 70, "height": 120, "unit": "metric"},
        options: Options(
          headers: {"x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},
        ),
      );
      // StudentModel().fromJson(j);

      emit(TestSuccess());
    } catch (e) {
      emit(TestFailure(e.toString()));
    }

    /// arrange my states
    /// error handling
    /// serialization (convert json to object)
  }
}

Map<String, dynamic> j = {
  "name": "salma",
  "age": "21",
  "work": {"place": "shbien", "salary": 20000.0},
};

class StudentModel {
  final String name;
  final String age;

  StudentModel({required this.name, required this.age});

  StudentModel fromJson(Map<String, dynamic> j) {
    return StudentModel(age: j["name"], name: j["age"]);
  }
}

class WorkModel {
  final String place;
  final double salary;
  factory WorkModel.fromJson(Map<String, dynamic> o) => WorkModel();

  WorkModel({required this.place, required this.salary});
}
