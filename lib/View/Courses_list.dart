// // lib/View/courses_by_category_view.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';

// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({Key? key, required this.categoryName, required this.categoryId}) : super(key: key);

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   final DashboardController controller = Get.find();
//   late Future<void> _future;

//   @override
//   void initState() {
//     super.initState();
//     // استدعِ الدالة فقط مرة واحدة قبل البناء، ولا تربطها بـObx أبداً
//     _future = controller.fetchCoursesByCategoryId(widget.categoryId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('كورسات \${widget.categoryName}'),
//         backgroundColor: Colors.blue.shade300,
//       ),
//       body: FutureBuilder(
//         future: _future,
//         builder: (context, snapshot) {
//           return Obx(() {
//             if (controller.isLoading.value) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (controller.noResults.value) {
//               return const Center(
//                 child: Text('لا يوجد كورسات في هذا التصنيف', style: TextStyle(fontSize: 18)),
//               );
//             } else if (controller.coursesByCategory.isEmpty) {
//               return const Center(child: Text('لا يوجد بيانات'));
//             } else {
//               return ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: controller.coursesByCategory.length,
//                 itemBuilder: (ctx, i) {
//                   final course = controller.coursesByCategory[i];
//                   return Card(
//                     elevation: 2,
//                     margin: const EdgeInsets.only(bottom: 12),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     child: ListTile(
//                       title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                       subtitle: Text(
//                         "Teacher: \${course.teacherName}" +
//                             (course.categoryName != null ? " | Category: \${course.categoryName}" : ""),
//                       ),
//                       trailing: Text("\${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                     ),
//                   );
//                 },
//               );
//             }
//           });
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
//
//
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId); // جلب الكورسات عند فتح الصفحة
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Courses OF $categoryName'),
//         backgroundColor: Colors.blue.shade400,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.coursesByCategory.isEmpty) {
//           return const Center(child: Text('No Courses', style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: controller.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     child: Text(course.courseName.substring(0, 1)),
//                   ),
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text('Teacher ${course.teacherName}\n '),
//                   trailing: Text('${course.price} S.P', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
//
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId); // جلب الكورسات عند فتح الصفحة
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Courses OF $categoryName'),
//         backgroundColor: Colors.blue.shade400,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.coursesByCategory.isEmpty) {
//           return const Center(child: Text('No Courses', style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: controller.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 color: Colors.grey[50],
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Colors.blue.shade50,
//                             child: Text(course.courseName.substring(0, 1), style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}', style: const TextStyle(fontSize: 14)),
//
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () {
//
//                               },
//                               icon: Icon(Icons.check_circle_outline, color: Colors.white),
//                               label: const Text('Register', style: TextStyle(color: Colors.white)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700, // زر أزرق قوي
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           OutlinedButton.icon(
//                             onPressed: () {
//                               Get.defaultDialog(
//                                 title: course.courseName,
//                                 content: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Teacher ${course.teacherName}'),
//                                     Text('Price ${course.price} S.P'),
//                                     if (course.categoryName != null)
//                                       Text('Category ${course.categoryName}'),
//                                   ],
//                                 ),
//                               );
//                             },
//                             icon: Icon(Icons.info_outline, color: Colors.blue.shade700),
//                             label: Text('Details', style: TextStyle(color: Colors.blue.shade700)),
//                             style: OutlinedButton.styleFrom(
//                               side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                               backgroundColor: Colors.blue.shade50,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Courses OF $categoryName'),
//         backgroundColor: Colors.blue.shade400,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.coursesByCategory.isEmpty) {
//           return const Center(child: Text('No Courses', style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: controller.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 color: Colors.grey[50],
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Colors.blue.shade50,
//                             child: Text(course.courseName.substring(0, 1), style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}', style: const TextStyle(fontSize: 14)),
//                                 if (course.categoryName != null)
//                                   Text('Category: ${course.categoryName}', style: const TextStyle(fontSize: 13, color: Colors.grey)),
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//
//                               },
//                               icon: Icon(Icons.check_circle_outline, color: Colors.white),
//                               label: const Text('Register', style: TextStyle(color: Colors.white)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           OutlinedButton.icon(
//                             onPressed: () {
//                               Get.defaultDialog(
//                                 title: course.courseName,
//                                 content: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Teacher : ${course.teacherName}'),
//                                     Text('Price : ${course.price} S.P'),
//                                     if (course.categoryName != null)
//                                       Text('Category : ${course.categoryName}'),
//
//                                   ],
//                                 ),
//                               );
//                             },
//                             icon: Icon(Icons.info_outline, color: Colors.blue.shade700),
//                             label: Text('Details', style: TextStyle(color: Colors.blue.shade700)),
//                             style: OutlinedButton.styleFrom(
//                               side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                               backgroundColor: Colors.blue.shade50,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class CoursesByCategoryView extends StatelessWidget {
  final String categoryName;
  final int categoryId;
  CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});

  final DashboardController controller = Get.find<DashboardController>();

  // تسجيل الطالب على كورس
  Future<void> registerOnCourse(BuildContext context, int courseId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final tokenType = prefs.getString('token_type') ?? '';

      if (token.isEmpty || tokenType.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
        );
        return;
      }

      final response = await Dio().post(
        'http://192.168.1.5:8000/api/courses/register',
        data: {
          'course_id': courseId.toString(),
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': '$tokenType $token',
          },
        ),
      );
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
        );
      } else {
        final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
        );
      }
    } on DioException catch (e) {
      final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchCoursesByCategoryId(categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses OF $categoryName'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.coursesByCategory.isEmpty) {
          return const Center(child: Text('No Courses', style: TextStyle(fontSize: 18, color: Colors.grey)));
        } else {
          return ListView.builder(
            itemCount: controller.coursesByCategory.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (ctx, i) {
              final course = controller.coursesByCategory[i];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Colors.grey[50],
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue.shade50,
                            child: Text(course.courseName.substring(0, 1), style: TextStyle(color: Colors.blue.shade700)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                                Text('Teacher: ${course.teacherName}', style: const TextStyle(fontSize: 14)),
                                if (course.categoryName != null)
                                  Text('Category: ${course.categoryName}', style: const TextStyle(fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Text('${course.price} S.P', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                await registerOnCourse(context, course.courseId);
                              },
                              icon: Icon(Icons.check_circle_outline, color: Colors.white),
                              label: const Text('Register', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                shadowColor: Colors.blue.shade100,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          OutlinedButton.icon(
                            onPressed: () {
                              Get.defaultDialog(
                                title: course.courseName,
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Teacher : ${course.teacherName}'),
                                    Text('Price : ${course.price} S.P'),
                                    if (course.categoryName != null)
                                      Text('Category : ${course.categoryName}'),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.info_outline, color: Colors.blue.shade700),
                            label: Text('Details', style: TextStyle(color: Colors.blue.shade700)),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.blue.shade200, width: 1.3),
                              backgroundColor: Colors.blue.shade50,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}



