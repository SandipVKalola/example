import '../model/QuizResponse.dart';
import 'networkCall.dart';

Future<List<QuizResponse>> getQuizList() async {
  List result = await handleResponse(
    await apiCall(
        'questions?apiKey=miKa0AK6KcwHjHIFwG6AVZd4fmyOM05lenRRO78f &category=linux&difficulty=Hard&limit=20',
        request: {},
        method: HttpMethod.GET),
  );

  return result.map((e) => QuizResponse.fromJson(e)).toList();
}
