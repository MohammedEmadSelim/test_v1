import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/bmi_model.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  /// call bmi api
  Future<void> calBMI() async {
    print("1234");
    emit(TestLoading());

    /// call by dio
    var dio = Dio();
    try {
      var res = await dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {"weight": 70, "height": 120, "unit": "metric"},
        options: Options(
          headers: {"x-api-key": "ff870e7d-5d78-4309-82bc-0b5e0347db0f"},
        ),
      );
      var data = BmiResponse.fromJson(res.data);
      print('Success');
      emit(TestSuccess(data));
    } catch (e) {
      emit(TestFailure(e.toString()));
      throw e;

    }

    /// arrange my states
    /// error handling
    /// serialization (convert json to object)
  }
}

