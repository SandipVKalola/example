class QuizResponse {
  int? id;
  String? question;
  Answers? answers;
  String? multipleCorrectAnswers;
  CorrectAnswers? correctAnswers;
  String? correctAnswer;
  List<Tags>? tags;
  String? category;
  String? difficulty;
  String? selectedAns="";

  QuizResponse(
      {this.id,
      this.question,
      this.answers,
      this.multipleCorrectAnswers,
      this.correctAnswers,
      this.correctAnswer,
      this.tags,
      this.category,
      this.difficulty});

  QuizResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answers =
        json['answers'] != null ? new Answers.fromJson(json['answers']) : null;
    multipleCorrectAnswers = json['multiple_correct_answers'];
    correctAnswers = json['correct_answers'] != null
        ? new CorrectAnswers.fromJson(json['correct_answers'])
        : null;
    correctAnswer = json['correct_answer'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    category = json['category'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.toJson();
    }
    data['multiple_correct_answers'] = this.multipleCorrectAnswers;
    if (this.correctAnswers != null) {
      data['correct_answers'] = this.correctAnswers!.toJson();
    }
    data['correct_answer'] = this.correctAnswer;

    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['category'] = this.category;
    data['difficulty'] = this.difficulty;
    data['selectedAns'] = this.selectedAns;
    return data;
  }
}

class Answers {
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;

  Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
  });

  Answers.fromJson(Map<String, dynamic> json) {
    answerA = json['answer_a'];
    answerB = json['answer_b'];
    answerC = json['answer_c'];
    answerD = json['answer_d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_a'] = this.answerA;
    data['answer_b'] = this.answerB;
    data['answer_c'] = this.answerC;
    data['answer_d'] = this.answerD;

    return data;
  }
}

class CorrectAnswers {
  String? answerACorrect;
  String? answerBCorrect;
  String? answerCCorrect;
  String? answerDCorrect;
  String? answerECorrect;
  String? answerFCorrect;

  CorrectAnswers(
      {this.answerACorrect,
      this.answerBCorrect,
      this.answerCCorrect,
      this.answerDCorrect,
      this.answerECorrect,
      this.answerFCorrect});

  CorrectAnswers.fromJson(Map<String, dynamic> json) {
    answerACorrect = json['answer_a_correct'];
    answerBCorrect = json['answer_b_correct'];
    answerCCorrect = json['answer_c_correct'];
    answerDCorrect = json['answer_d_correct'];
    answerECorrect = json['answer_e_correct'];
    answerFCorrect = json['answer_f_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_a_correct'] = this.answerACorrect;
    data['answer_b_correct'] = this.answerBCorrect;
    data['answer_c_correct'] = this.answerCCorrect;
    data['answer_d_correct'] = this.answerDCorrect;
    data['answer_e_correct'] = this.answerECorrect;
    data['answer_f_correct'] = this.answerFCorrect;
    return data;
  }
}

class Tags {
  String? name;

  Tags({this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
