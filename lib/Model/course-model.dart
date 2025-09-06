// lib/Model/course_model.dart

class Course {
  final int courseId;
  final String courseName;
  final String price;
  final String teacherName;
  final String? categoryName; // اختيارية حسب وجودها في الاستجابة

  Course({
    required this.courseId,
    required this.courseName,
    required this.price,
    required this.teacherName,
    this.categoryName,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'] ?? json['id'] ?? 0,
      courseName: json['course_name'],
      price: json['price'].toString(),
      teacherName: json['teacher_name'],
      categoryName: json['category_name'],
    );
  }
}
