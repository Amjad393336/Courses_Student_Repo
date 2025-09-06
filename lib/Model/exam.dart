// // lib/Model/exam_model.dart

// // موديل الامتحان كما يرسله السيرفر
// // البنية المتوقعة من السؤال: { "status":"success", "exam":[ { ... } ] }

// class Exam {
//   final int id;
//   final int courseId;
//   final int durationMinutes;
//   final List<ExamQuestion> questions;

//   Exam({
//     required this.id,
//     required this.courseId,
//     required this.durationMinutes,
//     required this.questions,
//   });

//   factory Exam.fromMap(Map<String, dynamic> map) {
//     return Exam(
//       id: map['id'] ?? 0,
//       courseId: map['course_id'] ?? 0,
//       durationMinutes: map['duration_minutes'] ?? 0,
//       questions: (map['questions'] as List<dynamic>? ?? [])
//           .map((q) => ExamQuestion.fromMap(q as Map<String, dynamic>))
//           .toList(),
//     );
//   }

//   /// بعض الـ APIs ترجع الامتحان داخل مصفوفة exam
//   /// { "status":"success", "exam":[ {...} ] }
//   static Exam? fromApiRoot(Map<String, dynamic> root) {
//     if (root['exam'] is List && (root['exam'] as List).isNotEmpty) {
//       return Exam.fromMap((root['exam'] as List).first);
//     }
//     // fallback لأنظمة أخرى (لو رجّعوا كائن مباشرة لاحقًا)
//     if (root['exam'] is Map<String, dynamic>) {
//       return Exam.fromMap(root['exam'] as Map<String, dynamic>);
//     }
//     // fallback آخر: بعض السيرفرات تضعه تحت data
//     if (root['data'] is Map<String, dynamic>) {
//       return Exam.fromMap(root['data'] as Map<String, dynamic>);
//     }
//     return null;
//   }
// }

// class ExamQuestion {
//   final int id;
//   final int examId;
//   final String questionText;
//   final List<ExamChoice> choices;

//   ExamQuestion({
//     required this.id,
//     required this.examId,
//     required this.questionText,
//     required this.choices,
//   });

//   factory ExamQuestion.fromMap(Map<String, dynamic> map) {
//     return ExamQuestion(
//       id: map['id'] ?? 0,
//       examId: map['exam_id'] ?? 0,
//       questionText: map['question_text']?.toString() ?? '',
//       choices: (map['choices'] as List<dynamic>? ?? [])
//           .map((c) => ExamChoice.fromMap(c as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

// class ExamChoice {
//   final int id;
//   final int questionId;
//   final String choiceText;

//   ExamChoice({
//     required this.id,
//     required this.questionId,
//     required this.choiceText,
//   });

//   factory ExamChoice.fromMap(Map<String, dynamic> map) {
//     return ExamChoice(
//       id: map['id'] ?? 0,
//       questionId: map['question_id'] ?? 0,
//       choiceText: map['choice_text']?.toString() ?? '',
//     );
//   }
// }
// موديلات الامتحان + محاولة البدء Attempt

// موديلات الامتحان + محاولة البدء Attempt

// class Exam {
//   final int id;
//   final int courseId;
//   final int durationMinutes;
//   final List<ExamQuestion> questions;

//   Exam({
//     required this.id,
//     required this.courseId,
//     required this.durationMinutes,
//     required this.questions,
//   });

//   factory Exam.fromMap(Map<String, dynamic> map) {
//     return Exam(
//       id: map['id'] ?? 0,
//       courseId: map['course_id'] ?? 0,
//       durationMinutes: map['duration_minutes'] ?? 0,
//       questions: (map['questions'] as List<dynamic>? ?? [])
//           .map((q) => ExamQuestion.fromMap(q as Map<String, dynamic>))
//           .toList(),
//     );
//   }

//   static Exam? fromApiRoot(Map<String, dynamic> root) {
//     if (root['exam'] is List && (root['exam'] as List).isNotEmpty) {
//       return Exam.fromMap((root['exam'] as List).first);
//     }
//     if (root['exam'] is Map<String, dynamic>) {
//       return Exam.fromMap(root['exam'] as Map<String, dynamic>);
//     }
//     if (root['data'] is Map<String, dynamic>) {
//       return Exam.fromMap(root['data'] as Map<String, dynamic>);
//     }
//     return null;
//   }
// }

// class ExamQuestion {
//   final int id;
//   final int examId;
//   final String questionText;
//   final List<ExamChoice> choices;

//   ExamQuestion({
//     required this.id,
//     required this.examId,
//     required this.questionText,
//     required this.choices,
//   });

//   factory ExamQuestion.fromMap(Map<String, dynamic> map) {
//     return ExamQuestion(
//       id: map['id'] ?? 0,
//       examId: map['exam_id'] ?? 0,
//       questionText: map['question_text']?.toString() ?? '',
//       choices: (map['choices'] as List<dynamic>? ?? [])
//           .map((c) => ExamChoice.fromMap(c as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

// class ExamChoice {
//   final int id;
//   final int questionId;
//   final String choiceText;

//   ExamChoice({
//     required this.id,
//     required this.questionId,
//     required this.choiceText,
//   });

//   factory ExamChoice.fromMap(Map<String, dynamic> map) {
//     return ExamChoice(
//       id: map['id'] ?? 0,
//       questionId: map['question_id'] ?? 0,
//       choiceText: map['choice_text']?.toString() ?? '',
//     );
//   }
// }

// class ExamAttempt {
//   final int id;
//   final int examId;
//   final int studentId;
//   final DateTime? startedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   ExamAttempt({
//     required this.id,
//     required this.examId,
//     required this.studentId,
//     this.startedAt,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory ExamAttempt.fromMap(Map<String, dynamic> map) {
//     DateTime? _p(String? s) {
//       try {
//         if (s == null || s.isEmpty) return null;
//         return DateTime.parse(s);
//       } catch (_) {
//         return null;
//       }
//     }

//     return ExamAttempt(
//       id: map['id'] ?? 0,
//       examId: map['exam_id'] ?? 0,
//       studentId: map['student_id'] ?? 0,
//       startedAt: _p(map['started_at']?.toString()),
//       createdAt: _p(map['created_at']?.toString()),
//       updatedAt: _p(map['updated_at']?.toString()),
//     );
//   }

//   static ExamAttempt? fromApiRoot(Map<String, dynamic> root) {
//     if (root['attempt'] is Map<String, dynamic>) {
//       return ExamAttempt.fromMap(root['attempt'] as Map<String, dynamic>);
//     }
//     return null;
//   }
// }


// class Exam {
//   final int id;
//   final int courseId;
//   final int durationMinutes;
//   final List<ExamQuestion> questions;

//   Exam({
//     required this.id,
//     required this.courseId,
//     required this.durationMinutes,
//     required this.questions,
//   });

//   factory Exam.fromMap(Map<String, dynamic> map) {
//     return Exam(
//       id: map['id'] ?? 0,
//       courseId: map['course_id'] ?? 0,
//       durationMinutes: map['duration_minutes'] ?? 0,
//       questions: (map['questions'] as List<dynamic>? ?? [])
//           .map((q) => ExamQuestion.fromMap(q as Map<String, dynamic>))
//           .toList(),
//     );
//   }

//   static Exam? fromApiRoot(Map<String, dynamic> root) {
//     if (root['exam'] is List && (root['exam'] as List).isNotEmpty) {
//       return Exam.fromMap((root['exam'] as List).first);
//     }
//     if (root['exam'] is Map<String, dynamic>) {
//       return Exam.fromMap(root['exam'] as Map<String, dynamic>);
//     }
//     if (root['data'] is Map<String, dynamic>) {
//       return Exam.fromMap(root['data'] as Map<String, dynamic>);
//     }
//     return null;
//   }
// }

// class ExamQuestion {
//   final int id;
//   final int examId;
//   final String questionText;
//   final List<ExamChoice> choices;

//   ExamQuestion({
//     required this.id,
//     required this.examId,
//     required this.questionText,
//     required this.choices,
//   });

//   factory ExamQuestion.fromMap(Map<String, dynamic> map) {
//     return ExamQuestion(
//       id: map['id'] ?? 0,
//       examId: map['exam_id'] ?? 0,
//       questionText: map['question_text']?.toString() ?? '',
//       choices: (map['choices'] as List<dynamic>? ?? [])
//           .map((c) => ExamChoice.fromMap(c as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

// class ExamChoice {
//   final int id;
//   final int questionId;
//   final String choiceText;

//   ExamChoice({
//     required this.id,
//     required this.questionId,
//     required this.choiceText,
//   });

//   factory ExamChoice.fromMap(Map<String, dynamic> map) {
//     return ExamChoice(
//       id: map['id'] ?? 0,
//       questionId: map['question_id'] ?? 0,
//       choiceText: map['choice_text']?.toString() ?? '',
//     );
//   }
// }

// class ExamAttempt {
//   final int id;        // attempt_id (ليس للاستخدام في submit عندك)
//   final int examId;    // هذا هو المطلوب لمسار /exam-attempts/{exam_id}/submit
//   final int studentId;
//   final DateTime? startedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   ExamAttempt({
//     required this.id,
//     required this.examId,
//     required this.studentId,
//     this.startedAt,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory ExamAttempt.fromMap(Map<String, dynamic> map) {
//     DateTime? _p(String? s) {
//       try {
//         if (s == null || s.isEmpty) return null;
//         return DateTime.parse(s);
//       } catch (_) {
//         return null;
//       }
//     }

//     return ExamAttempt(
//       id: map['id'] ?? 0,
//       examId: map['exam_id'] ?? 0,
//       studentId: map['student_id'] ?? 0,
//       startedAt: _p(map['started_at']?.toString()),
//       createdAt: _p(map['created_at']?.toString()),
//       updatedAt: _p(map['updated_at']?.toString()),
//     );
//   }

//   static ExamAttempt? fromApiRoot(Map<String, dynamic> root) {
//     if (root['attempt'] is Map<String, dynamic>) {
//       return ExamAttempt.fromMap(root['attempt'] as Map<String, dynamic>);
//     }
//     return null;
//   }
// }

// /// ===== نتيجة التصحيح =====
// class AnswerDetail {
//   final int questionId;
//   final String questionText;
//   final String? studentChoice; // قد يرجع null من الباك
//   final bool isCorrect;
//   final String? correctChoice;

//   AnswerDetail({
//     required this.questionId,
//     required this.questionText,
//     required this.studentChoice,
//     required this.isCorrect,
//     required this.correctChoice,
//   });

//   factory AnswerDetail.fromMap(Map<String, dynamic> m) {
//     return AnswerDetail(
//       questionId: m['question_id'] ?? 0,
//       questionText: m['question_text']?.toString() ?? '',
//       studentChoice: m['student_choice']?.toString(),
//       isCorrect: m['is_correct'] == true,
//       correctChoice: m['correct_choice']?.toString(),
//     );
//   }
// }

// class ExamSubmitResult {
//   final String message;
//   final String score; // مثال: "0 من 2"
//   final List<AnswerDetail> details;

//   ExamSubmitResult({
//     required this.message,
//     required this.score,
//     required this.details,
//   });

//   factory ExamSubmitResult.fromRoot(Map<String, dynamic> root) {
//     final details = (root['answers_details'] as List<dynamic>? ?? [])
//         .map((e) => AnswerDetail.fromMap(e as Map<String, dynamic>))
//         .toList();
//     return ExamSubmitResult(
//       message: root['message']?.toString() ?? '',
//       score: root['score']?.toString() ?? '',
//       details: details,
//     );
//   }
// }


class Exam {
  final int id;
  final int courseId;
  final int durationMinutes;
  final List<ExamQuestion> questions;

  Exam({
    required this.id,
    required this.courseId,
    required this.durationMinutes,
    required this.questions,
  });

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'] ?? 0,
      courseId: map['course_id'] ?? 0,
      durationMinutes: map['duration_minutes'] ?? 0,
      questions: (map['questions'] as List<dynamic>? ?? [])
          .map((q) => ExamQuestion.fromMap(q as Map<String, dynamic>))
          .toList(),
    );
  }

  static Exam? fromApiRoot(Map<String, dynamic> root) {
    if (root['exam'] is List && (root['exam'] as List).isNotEmpty) {
      return Exam.fromMap((root['exam'] as List).first);
    }
    if (root['exam'] is Map<String, dynamic>) {
      return Exam.fromMap(root['exam'] as Map<String, dynamic>);
    }
    if (root['data'] is Map<String, dynamic>) {
      return Exam.fromMap(root['data'] as Map<String, dynamic>);
    }
    return null;
  }
}

class ExamQuestion {
  final int id;
  final int examId;
  final String questionText;
  final List<ExamChoice> choices;

  ExamQuestion({
    required this.id,
    required this.examId,
    required this.questionText,
    required this.choices,
  });

  factory ExamQuestion.fromMap(Map<String, dynamic> map) {
    return ExamQuestion(
      id: map['id'] ?? 0,
      examId: map['exam_id'] ?? 0,
      questionText: map['question_text']?.toString() ?? '',
      choices: (map['choices'] as List<dynamic>? ?? [])
          .map((c) => ExamChoice.fromMap(c as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ExamChoice {
  final int id;
  final int questionId;
  final String choiceText;

  ExamChoice({
    required this.id,
    required this.questionId,
    required this.choiceText,
  });

  factory ExamChoice.fromMap(Map<String, dynamic> map) {
    return ExamChoice(
      id: map['id'] ?? 0,
      questionId: map['question_id'] ?? 0,
      choiceText: map['choice_text']?.toString() ?? '',
    );
  }
}

class ExamAttempt {
  final int id;        // attempt_id
  final int examId;    // مطلوب لمسار submit عندك
  final int studentId;
  final DateTime? startedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ExamAttempt({
    required this.id,
    required this.examId,
    required this.studentId,
    this.startedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ExamAttempt.fromMap(Map<String, dynamic> map) {
    DateTime? _p(String? s) {
      try {
        if (s == null || s.isEmpty) return null;
        return DateTime.parse(s);
      } catch (_) {
        return null;
      }
    }

    return ExamAttempt(
      id: map['id'] ?? 0,
      examId: map['exam_id'] ?? 0,
      studentId: map['student_id'] ?? 0,
      startedAt: _p(map['started_at']?.toString()),
      createdAt: _p(map['created_at']?.toString()),
      updatedAt: _p(map['updated_at']?.toString()),
    );
  }

  static ExamAttempt? fromApiRoot(Map<String, dynamic> root) {
    if (root['attempt'] is Map<String, dynamic>) {
      return ExamAttempt.fromMap(root['attempt'] as Map<String, dynamic>);
    }
    return null;
  }
}

/// ----- تفاصيل التصحيح من الباك -----
class AnswerDetail {
  final int questionId;
  final String questionText;
  final String? studentChoice; // قد يرجع null
  final bool isCorrect;
  final String? correctChoice;

  AnswerDetail({
    required this.questionId,
    required this.questionText,
    required this.studentChoice,
    required this.isCorrect,
    required this.correctChoice,
  });

  factory AnswerDetail.fromMap(Map<String, dynamic> m) {
    return AnswerDetail(
      questionId: m['question_id'] ?? 0,
      questionText: m['question_text']?.toString() ?? '',
      studentChoice: m['student_choice']?.toString(),
      isCorrect: m['is_correct'] == true,
      correctChoice: m['correct_choice']?.toString(),
    );
  }
}

class ExamSubmitResult {
  final String message;
  final String score; // "0 من 2"
  final List<AnswerDetail> details;

  ExamSubmitResult({
    required this.message,
    required this.score,
    required this.details,
  });

  factory ExamSubmitResult.fromRoot(Map<String, dynamic> root) {
    final details = (root['answers_details'] as List<dynamic>? ?? [])
        .map((e) => AnswerDetail.fromMap(e as Map<String, dynamic>))
        .toList();
    return ExamSubmitResult(
      message: root['message']?.toString() ?? '',
      score: root['score']?.toString() ?? '',
      details: details,
    );
  }
}

/// ----- View Model لعرض سؤال بعد التصحيح -----
class AnswerView {
  final int questionId;
  final String questionText;
  final String? studentChoiceText;
  final String? correctChoiceText;
//  final bool? isCorrect;

  AnswerView({
    required this.questionId,
    required this.questionText,
    required this.studentChoiceText,
    required this.correctChoiceText,
   // required this.isCorrect,
  });
}


