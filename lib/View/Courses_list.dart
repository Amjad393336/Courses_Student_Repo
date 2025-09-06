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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
//
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//   // تسجيل الطالب على كورس
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {
//           'course_id': courseId.toString(),
//         },
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId);
//     return Scaffold(
//       appBar: AppBar(
//         //title: Text('Courses OF $categoryName'),
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
//                                 await registerOnCourse(context, course.courseId);
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
// import 'package:dio/dio.dart';
//
// // شاشة عرض فيديوهات الكورس
// class CourseVideosScreen extends StatelessWidget {
//   final int courseId;
//   final List<dynamic> videos;
//   const CourseVideosScreen({super.key, required this.courseId, required this.videos});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Course Videos'),
//         backgroundColor: Colors.blue.shade400,
//       ),
//       body: videos.isEmpty
//           ? const Center(child: Text('لا يوجد فيديوهات لهذا الكورس', style: TextStyle(fontSize: 16)))
//           : ListView.separated(
//         padding: const EdgeInsets.all(16),
//         itemCount: videos.length,
//         separatorBuilder: (ctx, i) => const SizedBox(height: 18),
//         itemBuilder: (ctx, i) {
//           final v = videos[i];
//           return Card(
//             color: Colors.white,
//             elevation: 2,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('اسم الملف: ${v['original_filename']}', style: const TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 6),
//                   Text('الرابط: ${v['video_url']}', style: const TextStyle(color: Colors.blue)),
//                   const SizedBox(height: 8),
//                   Text('تاريخ الرفع: ${v['uploaded_at']}', style: const TextStyle(color: Colors.grey)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//   // تسجيل الطالب على كورس
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {
//           'course_id': courseId.toString(),
//         },
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   // استدعاء فيديوهات الكورس
//   Future<void> fetchCourseVideos(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         Get.to(() => CourseVideosScreen(courseId: courseId, videos: videos));
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId);
//     return Scaffold(
//       appBar: AppBar(
//         //title: Text('Courses OF $categoryName'),
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
//                                 await registerOnCourse(context, course.courseId);
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
//                           const SizedBox(width: 10),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               await fetchCourseVideos(context, course.courseId);
//                             },
//                             icon: Icon(Icons.play_circle_outline, color: Colors.white),
//                             label: const Text('Watch', style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple.shade400,
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
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';
//
// // شاشة مشغل الفيديو - تعرض فيديو واحد فقط
// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;
//   const VideoPlayerScreen({super.key, required this.videoUrl});
//
//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   bool _isInitialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {
//           _isInitialized = true;
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade400,
//         title: const Text('مشاهدة الفيديو'),
//       ),
//       body: Center(
//         child: _isInitialized
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             ),
//             VideoProgressIndicator(_controller, allowScrubbing: true),
//             const SizedBox(height: 20),
//             IconButton(
//               icon: Icon(
//                 _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
//                 color: Colors.white,
//                 size: 60,
//               ),
//               onPressed: () {
//                 setState(() {
//                   if (_controller.value.isPlaying) {
//                     _controller.pause();
//                   } else {
//                     _controller.play();
//                   }
//                 });
//               },
//             ),
//           ],
//         )
//             : const CircularProgressIndicator(color: Colors.white),
//       ),
//     );
//   }
// }
//
// // شاشة عرض الكورسات، عند الضغط على Watch يعرض فيديو واحد فقط
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//   // تسجيل الطالب على كورس
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {
//           'course_id': courseId.toString(),
//         },
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   // استدعاء فيديوهات الكورس (ومشاهدة أول فيديو فقط)
//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId);
//     return Scaffold(
//       appBar: AppBar(
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
//                                 await registerOnCourse(context, course.courseId);
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
//                           const SizedBox(width: 10),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               await fetchAndShowFirstCourseVideo(context, course.courseId);
//                             },
//                             icon: Icon(Icons.play_circle_outline, color: Colors.white),
//                             label: const Text('Watch', style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple.shade400,
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
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';
//
// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl;
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});
//
//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }
//
// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   late VideoPlayerController _controller;
//   bool _isLoading = true;
//   double _loadingProgress = 0.0;
//   String? _error;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
//
//       ..addListener(_videoListener)
//       ..initialize().then((_) {
//         setState(() {
//           _isLoading = false;
//         });
//       }).catchError((e) {
//         setState(() {
//           _isLoading = false;
//           _error = 'فشل تحميل الفيديو أو الرابط غير صحيح';
//         });
//       });
//   }
//
//   void _videoListener() {
//     // قد لا يدعم video_player التقدم الدقيق بالتحميل دائماً لكن يمكن مراقبة isBuffering والجاهزية
//     if (_controller.value.hasError) {
//       setState(() {
//         _isLoading = false;
//         _error = 'حدث خطأ أثناء تحميل الفيديو: ${_controller.value.errorDescription ?? ''}';
//       });
//     }
//     // لا يوجد progress حقيقي لكن يمكن إظهار Buffering أو انتظار الـ initialized فقط
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade400,
//         title: const Text('مشاهدة الفيديو'),
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.92,
//             padding: const EdgeInsets.all(16),
//             child: _error != null
//                 ? Center(
//               child: Text(_error!, style: const TextStyle(color: Colors.red, fontSize: 18)),
//             )
//                 : _isLoading
//                 ? Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text('جارٍ تحميل الفيديو...', style: TextStyle(color: Colors.white, fontSize: 17)),
//                 const SizedBox(height: 24),
//                 CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                 ),
//                 const SizedBox(height: 18),
//                 // إذا تريد إظهار progress text وهمي
//                 Text(
//                   "انتظر قليلاً حتى يتم تحميل الفيديو بالكامل",
//                   style: TextStyle(color: Colors.white70, fontSize: 14),
//                 ),
//               ],
//             )
//                 : Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: VideoPlayer(_controller),
//                   ),
//                 ),
//                 VideoProgressIndicator(_controller, allowScrubbing: true),
//                 const SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause_circle
//                             : Icons.play_circle,
//                         color: Colors.deepPurple,
//                         size: 54,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           if (_controller.value.isPlaying) {
//                             _controller.pause();
//                           } else {
//                             _controller.play();
//                           }
//                         });
//                       },
//                     ),
//                     const SizedBox(width: 12),
//                     Text(
//                       _controller.value.isPlaying ? 'إيقاف مؤقت' : 'تشغيل',
//                       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // استدعاء فيديو واحد فقط عند الضغط على Watch
// class CoursesByCategoryView extends StatelessWidget {
//   final String categoryName;
//   final int categoryId;
//   CoursesByCategoryView({super.key, required this.categoryName, required this.categoryId});
//
//   final DashboardController controller = Get.find<DashboardController>();
//
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.fetchCoursesByCategoryId(categoryId);
//     return Scaffold(
//       appBar: AppBar(
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
//                                 await registerOnCourse(context, course.courseId);
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
//                           const SizedBox(width: 10),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               await fetchAndShowFirstCourseVideo(context, course.courseId);
//                             },
//                             icon: Icon(Icons.play_circle_outline, color: Colors.white),
//                             label: const Text('Watch', style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple.shade400,
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
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';
//
// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl;
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});
//
//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }
//
// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   late VideoPlayerController _controller;
//   bool _isLoading = true;
//   double _loadingProgress = 0.0;
//   String? _error;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
//       ..addListener(_videoListener)
//       ..initialize().then((_) {
//         setState(() {
//           _isLoading = false;
//         });
//       }).catchError((e) {
//         setState(() {
//           _isLoading = false;
//           _error = 'فشل تحميل الفيديو أو الرابط غير صحيح';
//         });
//       });
//   }
//
//   void _videoListener() {
//     if (_controller.value.hasError) {
//       setState(() {
//         _isLoading = false;
//         _error = 'حدث خطأ أثناء تحميل الفيديو: ${_controller.value.errorDescription ?? ''}';
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade400,
//         title: const Text('مشاهدة الفيديو'),
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.92,
//             padding: const EdgeInsets.all(16),
//             child: _error != null
//                 ? Center(
//               child: Text(_error!, style: const TextStyle(color: Colors.red, fontSize: 18)),
//             )
//                 : _isLoading
//                 ? Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text('جارٍ تحميل الفيديو...', style: TextStyle(color: Colors.white, fontSize: 17)),
//                 const SizedBox(height: 24),
//                 CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                 ),
//                 const SizedBox(height: 18),
//                 Text(
//                   "انتظر قليلاً حتى يتم تحميل الفيديو بالكامل",
//                   style: TextStyle(color: Colors.white70, fontSize: 14),
//                 ),
//               ],
//             )
//                 : Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: VideoPlayer(_controller),
//                   ),
//                 ),
//                 VideoProgressIndicator(_controller, allowScrubbing: true),
//                 const SizedBox(height: 12),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause_circle
//                             : Icons.play_circle,
//                         color: Colors.deepPurple,
//                         size: 54,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           if (_controller.value.isPlaying) {
//                             _controller.pause();
//                           } else {
//                             _controller.play();
//                           }
//                         });
//                       },
//                     ),
//                     const SizedBox(width: 12),
//                     Text(
//                       _controller.value.isPlaying ? 'إيقاف مؤقت' : 'تشغيل',
//                       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;
//
//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });
//
//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }
//
// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     // استدعاء دالة جلب الكورسات مرة واحدة فقط عند بداية فتح الصفحة
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }
//
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                                 await registerOnCourse(context, course.courseId);
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
//                           const SizedBox(width: 10),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               await fetchAndShowFirstCourseVideo(context, course.courseId);
//                             },
//                             icon: Icon(Icons.play_circle_outline, color: Colors.white),
//                             label: const Text('Watch', style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple.shade400,
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

// فيديو زابط بس محلي
// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';
//
// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});
//
//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }
//
// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }
//
//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//
//       await _controller!.initialize();
//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             // إذا بدكها 5 دقائق غيّر لـ Duration(minutes: 5)
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }
//
//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 340,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         if (!_controller!.value.isPlaying)
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _controller!.play();
//                               });
//                             },
//                             child: CircleAvatar(
//                               radius: 44,
//                               backgroundColor: Colors.white.withOpacity(0.13),
//                               child: const Icon(
//                                 Icons.play_circle_fill,
//                                 color: Colors.white,
//                                 size: 88,
//                               ),
//                             ),
//                           ),
//                         Positioned(
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: VideoProgressIndicator(
//                             _controller!,
//                             allowScrubbing: true,
//                             colors: VideoProgressColors(
//                               backgroundColor: Colors.grey.shade800,
//                               playedColor: Colors.blue.shade300,
//                               bufferedColor: Colors.blue.shade100,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;
//
//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });
//
//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }
//
// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }
//
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // ===== زر Register مضبوط (لا يتكسّر وارتفاع موحّد) =====
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 //overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 48),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//
//                           // ===== زر Details مضبوط =====
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//
//                           // ===== زر Watch مضبوط =====
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 // ✅ تشغيل فيديو من الأصول (assets)
//                                 Get.to(() => const VideoPlayerCardScreen(
//                                   videoUrl: 'assets/videos/a.mp4',
//                                 ));
//
//                                 // أبقينا الدالة كما هي بدون حذف لو حبيت ترجع تستخدم API لاحقًا:
//                                 // await fetchAndShowFirstCourseVideo(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             // إذا بدكها 5 دقائق غيّر لـ Duration(minutes: 5)
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 340,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         if (!_controller!.value.isPlaying)
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _controller!.play();
//                               });
//                             },
//                             child: CircleAvatar(
//                               radius: 44,
//                               backgroundColor: Colors.white.withOpacity(0.13),
//                               child: const Icon(
//                                 Icons.play_circle_fill,
//                                 color: Colors.white,
//                                 size: 88,
//                               ),
//                             ),
//                           ),
//                         Positioned(
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: VideoProgressIndicator(
//                             _controller!,
//                             allowScrubbing: true,
//                             colors: VideoProgressColors(
//                               backgroundColor: Colors.grey.shade800,
//                               playedColor: Colors.blue.shade300,
//                               bufferedColor: Colors.blue.shade100,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   /// ✅ مسار المشاهدة: أولًا نحاول التسجيل (أو التأكد إنو مسجّل)،
//   /// إذا نجح أو كان Already Registered → نجيب الفيديوهات ونفتح المشغل.
//   Future<void> watchCourseFlow(BuildContext context, int courseId) async {
//     String? blockingError;

//     // 1) نحاول استدعاء API التسجيل للتحقق/التسجيل
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         blockingError = 'لم يتم العثور على توكن الطالب!';
//         throw 'no-token';
//       }

//       final res = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: {
//           'Accept': 'application/json',
//           'Authorization': '$tokenType $token',
//         }),
//       );

//       // success → تمام، نكمل للفيديوهات
//       if (!(res.statusCode == 200 && res.data['status'] == 'success')) {
//         final msg = (res.data['message'] ?? '').toString().toLowerCase();
//         // إذا كان مسجّل أصلًا نكمل مشاهدة
//         if (!(msg.contains('already') || msg.contains('مسجل'))) {
//           blockingError = res.data['message']?.toString() ?? 'فشل في التسجيل على الكورس';
//         }
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message']?.toString().toLowerCase() ?? '';
//       // نسمح بالمتابعة إذا رجع “already registered”
//       final canContinue = msg.contains('already') || msg.contains('مسجل');
//       if (!canContinue) {
//         blockingError = e.response?.data['message']?.toString() ?? 'فشل الاتصال بالخادم';
//       }
//     } catch (e) {
//       if (e.toString() != 'no-token') {
//         blockingError = 'حدث خطأ أثناء محاولة التسجيل';
//       }
//     }

//     if (blockingError != null) {
//       // غير مسموح بالمشاهدة → اعرض تنبيه
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('$blockingError\nالرجاء التسجيل قبل مشاهدة الكورس.'),
//           backgroundColor: Colors.orange.shade700,
//           duration: const Duration(seconds: 15),
//         ),
//       );
//       return;
//     }

//     // 2) طالما التسجيل ناجح أو Already Registered → نجيب الفيديوهات
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';

//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: {
//           'Accept': 'application/json',
//           'Authorization': '$tokenType $token',
//         }),
//       );

//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           // افتح المشغل على أول فيديو
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديو متاح للكورس حالياً!'),
//               backgroundColor: Colors.orange,
//               duration: Duration(seconds: 10),
//             ),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     // (أبقيناها كما هي عندك بدون حذف)
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // ===== زر Register مضبوط =====
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // ===== زر Details مضبوط =====
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // ===== زر Watch مضبوط — يستدعي التسجيل أولًا ثم يفتح الفيديو =====
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await watchCourseFlow(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// }
//كود زابط بس ناقصو فيديوهات محلية

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // إرجاع 10 ثواني
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           // تشغيل/إيقاف
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           // تقديم 10 ثواني
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           // تغيير السرعة
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           // ملء الشاشة
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   // ⬅️ تخزين آخر course_id ناجح بالتسجيل
//   Future<void> _saveLastCourseId(int courseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('last_course_id', courseId);
//   }

//   // ⬅️ إرجاع مسار الأصول حسب courseId
//   String? _assetPathForCourseId(int courseId) {
//     if (courseId == 3) return 'assets/videos/a.mp4';
//     if (courseId == 4) return 'assets/videos/b.mp4';
//     return null;
//   }

//   // ⬅️ التحقق من السماح بالمشاهدة عبر API الفيديوهات
//   Future<bool> _verifyAccessToCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return false;
//       }

//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': '$tokenType $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List vids = response.data['videos'] ?? [];
//         if (vids.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديوهات لهذا الكورس حالياً'), backgroundColor: Colors.orange),
//           );
//           return false;
//         }
//         // مسموح بالمشاهدة
//         return true;
//       } else {
//         final msg = response.data['message'] ?? 'غير مسموح بالمشاهدة';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//         );
//         return false;
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//       return false;
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//       return false;
//     }
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         // ✅ خزّن آخر course_id
//         await _saveLastCourseId(courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ⬅️ الدالة المستخدمة سابقاً (أبقيناها كما هي إن رغبت ترجع تستعملها)
//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch مضبوط: يتحقق أولاً من الأهلية عبر API، ثم يعرض asset المناسب
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 final canWatch = await _verifyAccessToCourse(context, course.courseId);
//                                 if (!canWatch) return;

//                                 // اختر مسار الأصول حسب course_id المخزّن، وإن لم يوجد فحسب courseId الحالي
//                                 final prefs = await SharedPreferences.getInstance();
//                                 final savedId = prefs.getInt('last_course_id') ?? course.courseId;

//                                 final String? assetPath = _assetPathForCourseId(savedId);
//                                 if (assetPath != null) {
//                                   Get.to(() => VideoPlayerCardScreen(videoUrl: assetPath));
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text('لا يوجد ملف فيديو أصول مخصص لهذا الكورس'),
//                                       backgroundColor: Colors.orange,
//                                     ),
//                                   );
//                                 }
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     if (token.isEmpty || tokenType.isEmpty) {
//       throw 'لم يتم العثور على توكن الطالب!';
//     }
//     return {
//       'Accept': 'application/json',
//       'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         // حفظ الـ course_id آخر تسجيل
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ التحقق أولاً من حالة التسجيل، ثم التحقق من وجود فيديوهات
//   Future<void> _onWatchPressed(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();

//       // (1) تحقق إذا كان الطالب مسجّل أصلاً
//       // نفترض أن الـ API يعيد 403 إن لم يكن الطالب مسجلاً عند طلب الفيديوهات
//       final checkResp = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: headers),
//       );

//       // إذا ما كانت 200، بنعالج لاحقاً ضمن الكاتش، بس إن كانت 200 فمبدئياً الطالب مسجل
//       if (checkResp.statusCode == 200 && checkResp.data['status'] == 'success') {
//         final List<dynamic> vids = checkResp.data['videos'] ?? [];

//         // (2) إن كان مسجل، نتحقق من وجود فيديوهات
//         if (vids.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديوهات متاحة لهذا الكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         // (3) يوجد فيديوهات → نختار Asset حسب الـ courseId (كما طلبت)
//         String assetPath;
//         if (courseId == 3) {
//           assetPath = 'assets/videos/a.mp4';
//         } else if (courseId == 4) {
//           assetPath = 'assets/videos/b.mp4';
//         } else {
//           assetPath = 'assets/videos/a.mp4';
//         }

//         // نروح لواجهة المشاهدة
//         Get.to(() => VideoPlayerCardScreen(videoUrl: assetPath));
//       } else {
//         // أي حالة غير success اعتبره غير مسجل
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('يجب التسجيل في الكورس أولاً.'), backgroundColor: Colors.red),
//         );
//       }
//     } on DioException catch (e) {
//       // لو غير مسجل يتوقع 403 أو رسالة من الباك توضح
//       final code = e.response?.statusCode ?? 0;
//       if (code == 403) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('يجب التسجيل في الكورس أولاً.'), backgroundColor: Colors.red),
//         );
//       } else {
//         final msg = e.response?.data['message'] ?? 'فشل التحقق من حالة التسجيل';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     // ملاحظة: أبقينا هذه الدالة كما هي لو احتجتها لاحقاً،
//     // لكن زر Watch صار يستخدم _onWatchPressed بالأولوية المطلوبة.
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch — منطق الأولوية: تسجيل -> فيديوهات -> تشغيل Asset حسب courseId
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await _onWatchPressed(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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
//نص زبطة

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       if (!headers.containsKey('Authorization')) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         // حفظ الـ course_id آخر تسجيل (اختياري)
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   /// ✅ منطق المشاهدة:
//   /// 1) نسأل API الفيديوهات أولاً كاختبار تسجيل (403 = غير مسجّل).
//   /// 2) إذا مسجّل: إن كان في فيديوهات نفتح الـ asset حسب courseId، وإلا نخبره ما في فيديوهات.
//   Future<void> watchFlow(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       if (!headers.containsKey('Authorization')) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }

//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: headers,
//           // نسمح بقراءة 4xx بدون رمي استثناء
//           validateStatus: (code) => code != null && code >= 200 && code < 500,
//         ),
//       );

//       if (response.statusCode == 403) {
//         // غير مسجّل في الكورس
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يجب التسجيل في هذا الكورس أولًا قبل المشاهدة.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       if (response.statusCode == 200 && response.data is Map && response.data['status'] == 'success') {
//         final List<dynamic> videos = (response.data['videos'] ?? []) as List<dynamic>;

//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديوهات متاحة لهذا الكورس حالياً!'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//           return;
//         }

//         // مسجّل + يوجد فيديوهات → نفتح الـ asset حسب courseId
//         String assetPath;
//         if (courseId == 3) {
//           assetPath = 'assets/videos/a.mp4';
//         } else if (courseId == 4) {
//           assetPath = 'assets/videos/b.mp4';
//         } else {
//           assetPath = 'assets/videos/a.mp4';
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: assetPath));
//         return;
//       }

//       final msg = response.data is Map
//           ? (response.data['message'] ?? 'حصل خطأ أثناء التحقق')
//           : 'حصل خطأ أثناء التحقق';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//       );
//     } on DioException catch (e) {
//       final msg = e.response?.data is Map ? (e.response?.data['message'] ?? 'فشل الاتصال بالخادم') : 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch مضبوط (يستدعي منطق الأولوية)
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await watchFlow(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         // حفظ الـ course_id آخر تسجيل
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ خريطة course_id → asset path
//   String _assetForCourse(int courseId) {
//     if (courseId == 4) return 'assets/b.mp4';
//     return 'assets/a.mp4'; // الافتراضي ولـ 3
//   }

//   // ✅ الترتيب المطلوب:
//   // 1) نجرب نعمل register
//   //    - إذا رجع خطأ برسالة "Student is already registered for this course" => مسموح مشاهدة
//   //    - غير ذلك => نقول لازم تسجّل أولًا (ولا نكمل)
//   // 2) (فقط عند السماح بالمشاهدة) نتحقق من وجود فيديوهات
//   // 3) إن وُجدت => ننتقل للمشغل (assets حسب courseId)
//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';

//     try {
//       // 1) محاولة التسجيل
//       final headers = await _authHeaders();
//       final regResp = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final regStatus = regResp.statusCode ?? 0;
//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       // مسموح مشاهدة فقط إذا كانت الرسالة حرفياً هي:
//       // "Student is already registered for this course"
//       final isAllowed = serverMsg.contains(alreadyMsg);

//       if (!isAllowed) {
//         // ليس مسجلاً مسبقاً → أخبره بالتسجيل أولاً
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يلزم التسجيل في الكورس أولًا'),
//             backgroundColor: Colors.orange,
//             duration: Duration(seconds: 3),
//           ),
//         );
//         return;
//       }

//       // 2) التحقق من وجود فيديوهات
//       final videosResp = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//           return;
//         }

//         // 3) ننتقل للمشغل (من الأصول حسب courseId)
//         final assetPath = _assetForCourse(courseId);
//         Get.to(() => VideoPlayerCardScreen(videoUrl: assetPath));
//       } else {
//         final msg = (videosResp.data is Map && videosResp.data['message'] != null)
//             ? videosResp.data['message'].toString()
//             : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch وفق المنطق الجديد
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await _watchFlow(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// زابطة بس عكورس واحد
// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة (في حال احتجته لاحقًا)
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي (مصدر الشبكة)
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // رابط فيديو من الـ API
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // 👇 تشغيل من الشبكة (الرابط قادم من الـ API)
//       _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة (مصدر الشبكة)
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ======================
// //   CoursesByCategoryView
// // ======================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // 👇 التدفّق: تسجيل (يُسمح فقط إذا الرسالة = already registered) → جلب فيديوهات → فتح المشغل بفيديو الشبكة
//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';

//     try {
//       final headers = await _authHeaders();

//       // 1) محاولة التسجيل أولاً
//       final regResp = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يلزم التسجيل في الكورس أولًا'),
//             backgroundColor: Colors.orange,
//             duration: Duration(seconds: 3),
//           ),
//         );
//         return;
//       }

//       // 2) التحقق من وجود فيديوهات لهذا الكورس
//       final videosResp = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//           return;
//         }

//         // 3) افتح المشغل باستخدام أول video_url من الـ API
//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('رابط الفيديو غير صالح من الخادم'),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg = (videosResp.data is Map && videosResp.data['message'] != null)
//             ? videosResp.data['message'].toString()
//             : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch وفق منطق API
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await _watchFlow(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// زابطة بس مشكلة overflow

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة (في حال احتجته لاحقًا)
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي (مصدر الشبكة)
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // رابط فيديو من الـ API
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // 👇 تشغيل من الشبكة (الرابط قادم من الـ API)
//       _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة (مصدر الشبكة)
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ======================
// //   CoursesByCategoryView
// // ======================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // 👇 التدفّق: تسجيل (يُسمح فقط إذا الرسالة = already registered) → جلب فيديوهات → فتح المشغل بفيديو الشبكة
//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';

//     try {
//       final headers = await _authHeaders();

//       // 1) محاولة التسجيل أولاً
//       final regResp = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يلزم التسجيل في الكورس أولًا'),
//             backgroundColor: Colors.orange,
//             duration: Duration(seconds: 3),
//           ),
//         );
//         return;
//       }

//       // 2) التحقق من وجود فيديوهات لهذا الكورس
//       final videosResp = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//           return;
//         }

//         // 3) افتح المشغل باستخدام أول video_url من الـ API
//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('رابط الفيديو غير صالح من الخادم'),
//               backgroundColor: Colors.red,
//             ),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg = (videosResp.data is Map && videosResp.data['message'] != null)
//             ? videosResp.data['message'].toString()
//             : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch وفق منطق API
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await _watchFlow(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// زابط بدون ربط
// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String
//       videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') ||
//         p.contains(':/') ||
//         (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller =
//             VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start ? start : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip:
//                 _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(
//                   color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null &&
//                     _controller!.value.isInitialized)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AspectRatio(
//                         aspectRatio: _controller!.value.aspectRatio,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: VideoPlayer(_controller!),
//                         ),
//                       ),
//                       VideoProgressIndicator(
//                         _controller!,
//                         allowScrubbing: true,
//                         colors: VideoProgressColors(
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controls(),
//                     ],
//                   )
//                 else
//                   _buildPlayButton(),
//                 if (_showPlayButton &&
//                     !_isLoading &&
//                     (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') ||
//         p.contains(':/') ||
//         (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty)
//         'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('تم تسجيلك في الكورس بنجاح!'),
//               backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(msg.toString()),
//               backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ خريطة course_id → asset path (ثابتة)
//   String _assetForCourse(int courseId) {
//     if (courseId == 4) return 'assets/videos/b.mp4';
//     return 'assets/videos/a.mp4'; // الافتراضي ولـ 3
//   }

//   // ✅ التسجيل أولاً، ثم التحقق من الفيديوهات، ثم فتح مشغل الأصول
//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';

//     try {
//       final headers = await _authHeaders();
//       final regResp = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);

//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يلزم التسجيل في الكورس أولًا'),
//             backgroundColor: Colors.orange,
//             duration: Duration(seconds: 3),
//           ),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//           return;
//         }

//         final assetPath = _assetForCourse(courseId);
//         Get.to(() => VideoPlayerCardScreen(videoUrl: assetPath));
//       } else {
//         final msg =
//             (videosResp.data is Map && videosResp.data['message'] != null)
//                 ? videosResp.data['message'].toString()
//                 : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade400,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.coursesByCategory.isEmpty) {
//           return const Center(
//               child: Text('No Courses',
//                   style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: controller.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}',
//                                     style: const TextStyle(fontSize: 14)),
//                                 if (course.categoryName != null)
//                                   Text('Category: ${course.categoryName}',
//                                       style: const TextStyle(
//                                           fontSize: 13, color: Colors.grey)),
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(
//                                     context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline,
//                                   color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text(
//                                             'Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline,
//                                   color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.blue.shade700,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(
//                                     color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await _watchFlow(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline,
//                                   color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(9)),
//                               ),
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

<<<<<<< HEAD
// import 'dart:io'; // ✅ إذا احتجته لاحقًا
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// ===============================
// /// شاشة مشغل الفيديو (مصدر الشبكة)
// /// ===============================
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // رابط الفيديو القادم من الـ API (/storage/...)
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   // أعلى الستيت
// final RxBool _isPlaying = false.obs;

//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   double _speed = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     // نبدأ التحميل مباشرة بدل انتظار ضغطة أولى
//     _startLoadingVideo();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//     });
//     try {
//       _controller =
//           VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _controller!.initialize();

//       await _controller!.setPlaybackSpeed(_speed);
//       setState(() => _isLoading = false);
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//       });
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     final c = _controller;
//     if (c == null) return;
//     setState(() => c.value.isPlaying ? c.pause() : c.play());
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     final c = _controller;
//     if (c == null || !c.value.isInitialized) return;
//     final dur = c.value.duration;
//     final pos = c.value.position + offset;
//     final target =
//         pos < Duration.zero ? Duration.zero : (pos > dur ? dur : pos);
//     await c.seekTo(target);
//   }

//   Future<void> _cycleSpeed() async {
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     _speed = speeds[(idx + 1) % speeds.length];
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('السرعة: ${_speed}x'),
//               duration: const Duration(seconds: 1)),
//         );
//         setState(() {});
//       }
//     }
//   }

//   void _openFullscreen() {
//     final c = _controller;
//     if (c == null || !c.value.isInitialized) return;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: widget.videoUrl,
//           initialPosition: c.value.position,
//           speed: _speed,
//           autoPlay: c.value.isPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _controlsBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//           ),
//           IconButton(
//             tooltip: (_controller?.value.isPlaying ?? false)
//                 ? 'إيقاف مؤقت'
//                 : 'تشغيل',
//             iconSize: 34,
//             onPressed: _togglePlay,
//             icon: Icon(
//               (_controller?.value.isPlaying ?? false)
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text('${_speed}x',
//                 style: const TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold)),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             onPressed: _openFullscreen,
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // منع الـ overflow: لا ارتفاعات ثابتة، واستخدم تخطيط مرن
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//           backgroundColor: Colors.black, title: const Text('مشاهدة الفيديو')),
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (ctx, constraints) {
//             final maxW = constraints.maxWidth;
//             // نجعل ارتفاع منطقة الفيديو مناسب (16:9) ومقيّد بنسبة من الشاشة
//             final maxH = MediaQuery.of(context).size.height;
//             final videoHeight = (maxW * 9 / 16).clamp(180.0, maxH * 0.5);

//             if (_hasError) {
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(_errorMsg ?? 'حدث خطأ',
//                       style: const TextStyle(color: Colors.red)),
//                 ),
//               );
//             }

//             if (_isLoading ||
//                 _controller == null ||
//                 !_controller!.value.isInitialized) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation(Colors.deepPurple)),
//               );
//             }

//             // محتوى قابل للتمرير لو كانت المساحة صغيرة
//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(12),
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 800),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(
//                         width: maxW,
//                         height: videoHeight,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: AspectRatio(
//                             aspectRatio: _controller!.value.aspectRatio,
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       VideoProgressIndicator(
//                         _controller!,
//                         allowScrubbing: true,
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         colors: VideoProgressColors(
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controlsBar(),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ===============================
// /// شاشة ملء الشاشة
// /// ===============================
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;
//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//           backgroundColor: Colors.black, title: const Text('ملء الشاشة')),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Center(
//                     child: AspectRatio(
//                       aspectRatio: _ctrl!.value.aspectRatio,
//                       child: VideoPlayer(_ctrl!),
//                     ),
//                   ),
//                   VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                 ],
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// /// =======================================
// /// CoursesByCategoryView (watch flow عبر API)
// /// =======================================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(
//         () => controller.fetchCoursesByCategoryId(widget.categoryId));
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty)
//         'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('تم تسجيلك في الكورس بنجاح!'),
//               backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(msg.toString()),
//               backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   /// 1) محاولة التسجيل
//   ///    - يسمح بالمشاهدة فقط إذا رسالة الباك حرفيًّا:
//   ///      "Student is already registered for this course"
//   /// 2) عند السماح → جلب الفيديوهات
//   /// 3) إذا وُجدت روابط → افتح المشغل بأول رابط
//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';
//     try {
//       final headers = await _authHeaders();

//       final regResp = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يلزم التسجيل في الكورس أولًا'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//                 backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('رابط الفيديو غير صالح من الخادم'),
//                 backgroundColor: Colors.red),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg =
//             (videosResp.data is Map && videosResp.data['message'] != null)
//                 ? videosResp.data['message'].toString()
//                 : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue.shade400),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.coursesByCategory.isEmpty) {
//           return const Center(
//               child: Text('No Courses',
//                   style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: controller.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}',
//                                     style: const TextStyle(fontSize: 14)),
//                                 if (course.categoryName != null)
//                                   Text('Category: ${course.categoryName}',
//                                       style: const TextStyle(
//                                           fontSize: 13, color: Colors.grey)),
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async =>
//                                   registerOnCourse(context, course.courseId),
//                               icon: const Icon(Icons.check_circle_outline,
//                                   color: Colors.white, size: 20),
//                               label: const Text('Register',
//                                   maxLines: 1,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text(
//                                             'Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline,
//                                   color: Colors.blue.shade700, size: 20),
//                               label: Text('Details',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       color: Colors.blue.shade700,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600)),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(
//                                     color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async =>
//                                   _watchFlow(context, course.courseId),
//                               icon: const Icon(Icons.play_circle_outline,
//                                   color: Colors.white, size: 20),
//                               label: const Text('Watch',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(9)),
//                               ),
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
// import 'dart:io'; // ✅ إذا احتجته لاحقًا
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// ===============================
// /// شاشة مشغل الفيديو (مصدر الشبكة)
// /// ===============================
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // رابط الفيديو القادم من الـ API (/storage/...)
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   // أعلى الستيت
//   final RxBool _isPlaying = false.obs;

//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   double _speed = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     // نبدأ التحميل مباشرة بدل انتظار ضغطة أولى
//     _startLoadingVideo();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//     });
//     try {
//       _controller =
//           VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _controller!.initialize();

//       await _controller!.setPlaybackSpeed(_speed);
//       setState(() => _isLoading = false);
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//       });
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     final c = _controller;
//     if (c == null) return;
//     setState(() => c.value.isPlaying ? c.pause() : c.play());
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     final c = _controller;
//     if (c == null || !c.value.isInitialized) return;
//     final dur = c.value.duration;
//     final pos = c.value.position + offset;
//     final target =
//         pos < Duration.zero ? Duration.zero : (pos > dur ? dur : pos);
//     await c.seekTo(target);
//   }

//   Future<void> _cycleSpeed() async {
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     _speed = speeds[(idx + 1) % speeds.length];
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('السرعة: ${_speed}x'),
//               duration: const Duration(seconds: 1)),
//         );
//         setState(() {});
//       }
//     }
//   }

//   void _openFullscreen() {
//     final c = _controller;
//     if (c == null || !c.value.isInitialized) return;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: widget.videoUrl,
//           initialPosition: c.value.position,
//           speed: _speed,
//           autoPlay: c.value.isPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _controlsBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//             icon: const Icon(Icons.replay, color: Colors.white), // كان replay_10 — ويمكن إبقاؤها
//           ),
//           IconButton(
//             tooltip: (_controller?.value.isPlaying ?? false)
//                 ? 'إيقاف مؤقت'
//                 : 'تشغيل',
//             iconSize: 34,
//             onPressed: _togglePlay,
//             icon: Icon(
//               (_controller?.value.isPlaying ?? false)
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text('${_speed}x',
//                 style: const TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold)),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             onPressed: _openFullscreen,
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // منع الـ overflow: لا ارتفاعات ثابتة، واستخدم تخطيط مرن
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//           backgroundColor: Colors.black, title: const Text('مشاهدة الفيديو')),
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (ctx, constraints) {
//             final maxW = constraints.maxWidth;
//             // نجعل ارتفاع منطقة الفيديو مناسب (16:9) ومقيّد بنسبة من الشاشة
//             final maxH = MediaQuery.of(context).size.height;
//             final videoHeight = (maxW * 9 / 16).clamp(180.0, maxH * 0.5);

//             if (_hasError) {
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(_errorMsg ?? 'حدث خطأ',
//                       style: const TextStyle(color: Colors.red)),
//                 ),
//               );
//             }

//             if (_isLoading ||
//                 _controller == null ||
//                 !_controller!.value.isInitialized) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation(Colors.deepPurple)),
//               );
//             }

//             // محتوى قابل للتمرير لو كانت المساحة صغيرة
//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(12),
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 800),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(
//                         width: maxW,
//                         height: videoHeight,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: AspectRatio(
//                             aspectRatio: _controller!.value.aspectRatio,
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       VideoProgressIndicator(
//                         _controller!,
//                         allowScrubbing: true,
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         colors: VideoProgressColors(
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controlsBar(),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ===============================
// /// شاشة ملء الشاشة
// /// ===============================
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;
//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//           backgroundColor: Colors.black, title: const Text('ملء الشاشة')),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Center(
//                     child: AspectRatio(
//                       aspectRatio: _ctrl!.value.aspectRatio,
//                       child: VideoPlayer(_ctrl!),
//                     ),
//                   ),
//                   VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                 ],
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// /// =======================================
// /// CoursesByCategoryView (watch flow عبر API)
// /// =======================================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(
//         () => controller.fetchCoursesByCategoryId(widget.categoryId));
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty)
//         'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('تم تسجيلك في الكورس بنجاح!'),
//               backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(msg.toString()),
//               backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   /// 1) محاولة التسجيل
//   ///    - يسمح بالمشاهدة فقط إذا رسالة الباك حرفيًّا:
//   ///      "Student is already registered for this course"
//   /// 2) عند السماح → جلب الفيديوهات
//   /// 3) إذا وُجدت روابط → افتح المشغل بأول رابط
//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';
//     try {
//       final headers = await _authHeaders();

//       final regResp = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يلزم التسجيل في الكورس أولًا'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//                 backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('رابط الفيديو غير صالح من الخادم'),
//                 backgroundColor: Colors.red),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg =
//             (videosResp.data is Map && videosResp.data['message'] != null)
//                 ? videosResp.data['message'].toString()
//                 : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ زر الامتحان (Exam) — Placeholder الآن
//   void _onExamPressed(BuildContext context, String courseName, int courseId) {
//     // لاحقًا سنربطه بواجهة الامتحان أو API كما تريد
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Exam for "$courseName" (ID: $courseId) — Soon'),
//         backgroundColor: Colors.deepOrange,
//       ),
//     );
//   }

//   // ✅ مُنشئ أزرار تفاعلي Responsive: Row على الشاشات الواسعة، Column على الضيقة
//   Widget _buildActionButtons(BuildContext context, dynamic course) {
//     return LayoutBuilder(
//       builder: (ctx, constraints) {
//         final isWide = constraints.maxWidth >= 520; // نقطة تحوّل بسيطة
//         final buttonHeight = 46.0;

//         final registerBtn = ElevatedButton.icon(
//           onPressed: () async => registerOnCourse(context, course.courseId),
//           icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//           label: const Text('Register',
//               maxLines: 1,
//               style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue.shade700,
//             elevation: 0,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final detailsBtn = OutlinedButton.icon(
//           onPressed: () {
//             Get.defaultDialog(
//               title: course.courseName,
//               content: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Teacher : ${course.teacherName}'),
//                   Text('Price : ${course.price} S.P'),
//                   if (course.categoryName != null)
//                     Text('Category : ${course.categoryName}'),
//                 ],
//               ),
//             );
//           },
//           icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//           label: Text('Details',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//             backgroundColor: Colors.blue.shade50,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final watchBtn = ElevatedButton.icon(
//           onPressed: () async => _watchFlow(context, course.courseId),
//           icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//           label: const Text('Watch',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple.shade400,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         // ⭐ الزر الجديد: Exam
//         final examBtn = ElevatedButton.icon(
//           onPressed: () => _onExamPressed(context, course.courseName, course.courseId),
//           icon: const Icon(Icons.quiz_outlined, color: Colors.white, size: 20),
//           label: const Text('Exam',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         if (isWide) {
//           // شاشة واسعة: صف بأربع أزرار متساوية
//           return Row(
//             children: [
//               Expanded(child: registerBtn),
//               const SizedBox(width: 10),
//               Expanded(child: detailsBtn),
//               const SizedBox(width: 10),
//               Expanded(child: watchBtn),
//               const SizedBox(width: 10),
//               Expanded(child: examBtn),
//             ],
//           );
//         } else {
//           // شاشة ضيّقة: عمود بأزرار ممتدة
//           return Column(
//             children: [
//               SizedBox(width: double.infinity, child: registerBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: detailsBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: watchBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: examBtn),
//             ],
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue.shade400),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.coursesByCategory.isEmpty) {
//           return const Center(
//               child: Text('No Courses',
//                   style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: controller.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}',
//                                     style: const TextStyle(fontSize: 14)),
//                                 if (course.categoryName != null)
//                                   Text('Category: ${course.categoryName}',
//                                       style: const TextStyle(
//                                           fontSize: 13, color: Colors.grey)),
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       // ✅ الأزرار بعد تحسين الاستجابة + إضافة Exam
//                       _buildActionButtons(context, course),
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

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/View/Exam_Screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';
// // ✅ الصفحة الجديدة

// /// ===============================
// /// شاشة مشغل الفيديو (مصدر الشبكة)
// /// ===============================
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl;
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   final RxBool _isPlaying = false.obs;

//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   double _speed = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _startLoadingVideo();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//     });
//     try {
//       _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);
//       setState(() => _isLoading = false);
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//       });
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     final c = _controller;
//     if (c == null) return;
//     setState(() => c.value.isPlaying ? c.pause() : c.play());
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     final c = _controller;
//     if (c == null || !c.value.isInitialized) return;
//     final dur = c.value.duration;
//     final pos = c.value.position + offset;
//     final target = pos < Duration.zero ? Duration.zero : (pos > dur ? dur : pos);
//     await c.seekTo(target);
//   }

//   Future<void> _cycleSpeed() async {
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     _speed = speeds[(idx + 1) % speeds.length];
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('السرعة: ${_speed}x'), duration: const Duration(seconds: 1)),
//         );
//         setState(() {});
//       }
//     }
//   }

//   void _openFullscreen() {
//     final c = _controller;
//     if (c == null || !c.value.isInitialized) return;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: widget.videoUrl,
//           initialPosition: c.value.position,
//           speed: _speed,
//           autoPlay: c.value.isPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _controlsBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//             icon: const Icon(Icons.replay_10, color: Colors.white), // ✅
//           ),
//           IconButton(
//             tooltip: (_controller?.value.isPlaying ?? false) ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             onPressed: _togglePlay,
//             icon: Icon(
//               (_controller?.value.isPlaying ?? false)
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text('${_speed}x', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             onPressed: _openFullscreen,
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(backgroundColor: Colors.black, title: const Text('مشاهدة الفيديو')),
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (ctx, constraints) {
//             final maxW = constraints.maxWidth;
//             final maxH = MediaQuery.of(context).size.height;
//             final videoHeight = (maxW * 9 / 16).clamp(180.0, maxH * 0.5);

//             if (_hasError) {
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(_errorMsg ?? 'حدث خطأ', style: const TextStyle(color: Colors.red)),
//                 ),
//               );
//             }

//             if (_isLoading || _controller == null || !_controller!.value.isInitialized) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color?>(Colors.deepPurple), // ✅ ثابت
//                 ),
//               );
//             }

//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(12),
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 800),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(
//                         width: maxW,
//                         height: videoHeight,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: AspectRatio(
//                             aspectRatio: _controller!.value.aspectRatio,
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       VideoProgressIndicator(
//                         _controller!,
//                         allowScrubbing: true,
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         colors: VideoProgressColors(
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controlsBar(),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ===============================
// /// شاشة ملء الشاشة
// /// ===============================
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;
//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(backgroundColor: Colors.black, title: const Text('ملء الشاشة')),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Center(
//                     child: AspectRatio(
//                       aspectRatio: _ctrl!.value.aspectRatio,
//                       child: VideoPlayer(_ctrl!),
//                     ),
//                   ),
//                   VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                 ],
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// /// =======================================
// /// CoursesByCategoryView
// /// =======================================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() => controller.fetchCoursesByCategoryId(widget.categoryId));
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';
//     try {
//       final headers = await _authHeaders();

//       final regResp = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('يلزم التسجيل في الكورس أولًا'), backgroundColor: Colors.orange),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('رابط الفيديو غير صالح من الخادم'), backgroundColor: Colors.red),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg = (videosResp.data is Map && videosResp.data['message'] != null)
//             ? videosResp.data['message'].toString()
//             : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ زر الامتحان: يحدد courseId حسب القاعدة ثم يفتح ExamScreen
//   void _onExamPressed(BuildContext context, dynamic course) {
//     final controller = Get.find<DashboardController>();
//     final resolvedId = controller.resolveCourseIdForExam(
//       categoryName: course.categoryName ?? widget.categoryName,
//       courseName: course.courseName,
//       fallbackCourseId: course.courseId,
//     );

//     Get.to(() => ExamScreen(
//           courseId: resolvedId,
//           courseTitle: course.courseName,
//         ));
//   }

//   // ✅ أزرار Responsive (مع Exam)
//   Widget _buildActionButtons(BuildContext context, dynamic course) {
//     return LayoutBuilder(
//       builder: (ctx, constraints) {
//         final isWide = constraints.maxWidth >= 640;
//         final buttonHeight = 46.0;

//         final registerBtn = ElevatedButton.icon(
//           onPressed: () async => registerOnCourse(context, course.courseId),
//           icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//           label: const Text('Register',
//               maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue.shade700,
//             elevation: 0,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final detailsBtn = OutlinedButton.icon(
//           onPressed: () {
//             Get.defaultDialog(
//               title: course.courseName,
//               content: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Teacher : ${course.teacherName}'),
//                   Text('Price : ${course.price} S.P'),
//                   if (course.categoryName != null) Text('Category : ${course.categoryName}'),
//                 ],
//               ),
//             );
//           },
//           icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//           label: Text('Details',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//             backgroundColor: Colors.blue.shade50,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final watchBtn = ElevatedButton.icon(
//           onPressed: () async => _watchFlow(context, course.courseId),
//           icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//           label: const Text('Watch',
//               maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple.shade400,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final examBtn = ElevatedButton.icon(
//           onPressed: () => _onExamPressed(context, course),
//           icon: const Icon(Icons.fact_check_outlined, color: Colors.white, size: 20),
//           label: const Text('Exam',
//               maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         if (isWide) {
//           return Row(
//             children: [
//               Expanded(child: registerBtn),
//               const SizedBox(width: 10),
//               Expanded(child: detailsBtn),
//               const SizedBox(width: 10),
//               Expanded(child: watchBtn),
//               const SizedBox(width: 10),
//               Expanded(child: examBtn),
//             ],
//           );
//         } else {
//           return Column(
//             children: [
//               SizedBox(width: double.infinity, child: registerBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: detailsBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: watchBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: examBtn),
//             ],
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue.shade400),
//       body: Obx(() {
//         final c = controller;
//         if (c.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (c.coursesByCategory.isEmpty) {
//           return const Center(child: Text('No Courses', style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: c.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = c.coursesByCategory[i];
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
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
//                       _buildActionButtons(context, course),
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
=======
import 'dart:io'; // ✅ إذا احتجته لاحقًا
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:video_player/video_player.dart';

/// ===============================
/// شاشة مشغل الفيديو (مصدر الشبكة)
/// ===============================
class VideoPlayerCardScreen extends StatefulWidget {
  final String videoUrl; // رابط الفيديو القادم من الـ API (/storage/...)
  const VideoPlayerCardScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
}

class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
  VideoPlayerController? _controller;
  // أعلى الستيت
final RxBool _isPlaying = false.obs;

  bool _isLoading = false;
  bool _hasError = false;
  String? _errorMsg;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    // نبدأ التحميل مباشرة بدل انتظار ضغطة أولى
    _startLoadingVideo();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _startLoadingVideo() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _errorMsg = null;
    });
    try {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _controller!.initialize();
      
      await _controller!.setPlaybackSpeed(_speed);
      setState(() => _isLoading = false);
      _controller!.play();
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _togglePlay() {
    final c = _controller;
    if (c == null) return;
    setState(() => c.value.isPlaying ? c.pause() : c.play());
  }

  Future<void> _seekRelative(Duration offset) async {
    final c = _controller;
    if (c == null || !c.value.isInitialized) return;
    final dur = c.value.duration;
    final pos = c.value.position + offset;
    final target =
        pos < Duration.zero ? Duration.zero : (pos > dur ? dur : pos);
    await c.seekTo(target);
  }

  Future<void> _cycleSpeed() async {
    const speeds = [1.0, 1.25, 1.5, 2.0];
    final idx = speeds.indexOf(_speed);
    _speed = speeds[(idx + 1) % speeds.length];
    if (_controller != null) {
      await _controller!.setPlaybackSpeed(_speed);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('السرعة: ${_speed}x'),
              duration: const Duration(seconds: 1)),
        );
        setState(() {});
      }
    }
  }

  void _openFullscreen() {
    final c = _controller;
    if (c == null || !c.value.isInitialized) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FullscreenVideoScreen(
          videoUrl: widget.videoUrl,
          initialPosition: c.value.position,
          speed: _speed,
          autoPlay: c.value.isPlaying,
        ),
      ),
    );
  }

  Widget _controlsBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: 'رجوع 10 ثواني',
            onPressed: () => _seekRelative(const Duration(seconds: -10)),
            icon: const Icon(Icons.replay_10, color: Colors.white),
          ),
          IconButton(
            tooltip: (_controller?.value.isPlaying ?? false)
                ? 'إيقاف مؤقت'
                : 'تشغيل',
            iconSize: 34,
            onPressed: _togglePlay,
            icon: Icon(
              (_controller?.value.isPlaying ?? false)
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_fill,
              color: Colors.white,
            ),
          ),
          IconButton(
            tooltip: 'تقديم 10 ثواني',
            onPressed: () => _seekRelative(const Duration(seconds: 10)),
            icon: const Icon(Icons.forward_10, color: Colors.white),
          ),
          TextButton(
            onPressed: _cycleSpeed,
            child: Text('${_speed}x',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          IconButton(
            tooltip: 'ملء الشاشة',
            onPressed: _openFullscreen,
            icon: const Icon(Icons.fullscreen, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // منع الـ overflow: لا ارتفاعات ثابتة، واستخدم تخطيط مرن
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black, title: const Text('مشاهدة الفيديو')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            final maxW = constraints.maxWidth;
            // نجعل ارتفاع منطقة الفيديو مناسب (16:9) ومقيّد بنسبة من الشاشة
            final maxH = MediaQuery.of(context).size.height;
            final videoHeight = (maxW * 9 / 16).clamp(180.0, maxH * 0.5);

            if (_hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(_errorMsg ?? 'حدث خطأ',
                      style: const TextStyle(color: Colors.red)),
                ),
              );
            }

            if (_isLoading ||
                _controller == null ||
                !_controller!.value.isInitialized) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.deepPurple)),
              );
            }

            // محتوى قابل للتمرير لو كانت المساحة صغيرة
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: maxW,
                        height: videoHeight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      VideoProgressIndicator(
                        _controller!,
                        allowScrubbing: true,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        colors: VideoProgressColors(
                          backgroundColor: Colors.grey.shade800,
                          playedColor: Colors.blue.shade300,
                          bufferedColor: Colors.blue.shade100,
                        ),
                      ),
                      _controlsBar(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ===============================
/// شاشة ملء الشاشة
/// ===============================
class FullscreenVideoScreen extends StatefulWidget {
  final String videoUrl;
  final Duration initialPosition;
  final double speed;
  final bool autoPlay;
  const FullscreenVideoScreen({
    super.key,
    required this.videoUrl,
    required this.initialPosition,
    required this.speed,
    required this.autoPlay,
  });

  @override
  State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
}

class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
  VideoPlayerController? _ctrl;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _ctrl!.initialize();
      await _ctrl!.setPlaybackSpeed(widget.speed);
      await _ctrl!.seekTo(widget.initialPosition);
      if (widget.autoPlay) _ctrl!.play();
      setState(() => _ready = true);
    } catch (_) {
      setState(() => _ready = false);
    }
  }

  @override
  void dispose() {
    _ctrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black, title: const Text('ملء الشاشة')),
      body: Center(
        child: _ready && _ctrl != null && _ctrl!.value.isInitialized
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: _ctrl!.value.aspectRatio,
                      child: VideoPlayer(_ctrl!),
                    ),
                  ),
                  VideoProgressIndicator(_ctrl!, allowScrubbing: true),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

/// =======================================
/// CoursesByCategoryView (watch flow عبر API)
/// =======================================
class CoursesByCategoryView extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  const CoursesByCategoryView({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  @override
  State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
}

class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
  late DashboardController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DashboardController>();
    Future.microtask(
        () => controller.fetchCoursesByCategoryId(widget.categoryId));
  }

  Future<Map<String, String>> _authHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final tokenType = prefs.getString('token_type') ?? '';
    return {
      'Accept': 'application/json',
      if (token.isNotEmpty && tokenType.isNotEmpty)
        'Authorization': '$tokenType $token',
    };
  }

  Future<void> registerOnCourse(BuildContext context, int courseId) async {
    try {
      final headers = await _authHeaders();
      final response = await Dio().post(
        'http://192.168.1.5:8000/api/courses/register',
        data: {'course_id': courseId.toString()},
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('last_registered_course_id', courseId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('تم تسجيلك في الكورس بنجاح!'),
              backgroundColor: Colors.blue.shade700),
        );
      } else {
        final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(msg.toString()),
              backgroundColor: Colors.orange.shade700),
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

  /// 1) محاولة التسجيل
  ///    - يسمح بالمشاهدة فقط إذا رسالة الباك حرفيًّا:
  ///      "Student is already registered for this course"
  /// 2) عند السماح → جلب الفيديوهات
  /// 3) إذا وُجدت روابط → افتح المشغل بأول رابط
  Future<void> _watchFlow(BuildContext context, int courseId) async {
    const alreadyMsg = 'Student is already registered for this course';
    try {
      final headers = await _authHeaders();

      final regResp = await Dio().post(
        'http://192.168.1.5:8000/api/courses/register',
        data: {'course_id': courseId.toString()},
        options: Options(headers: headers, validateStatus: (_) => true),
      );

      final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
          ? regResp.data['message'].toString()
          : '';

      final isAllowed = serverMsg.contains(alreadyMsg);
      if (!isAllowed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يلزم التسجيل في الكورس أولًا'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final videosResp = await Dio().get(
        'http://192.168.1.5:8000/api/courses/$courseId/videos',
        options: Options(headers: headers, validateStatus: (_) => true),
      );

      if (videosResp.statusCode == 200 &&
          videosResp.data is Map &&
          videosResp.data['status'] == 'success') {
        final List<dynamic> videos = videosResp.data['videos'] ?? [];
        if (videos.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
                backgroundColor: Colors.orange),
          );
          return;
        }

        final String firstUrl = videos.first['video_url']?.toString() ?? '';
        if (firstUrl.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('رابط الفيديو غير صالح من الخادم'),
                backgroundColor: Colors.red),
          );
          return;
        }

        Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
      } else {
        final msg =
            (videosResp.data is Map && videosResp.data['message'] != null)
                ? videosResp.data['message'].toString()
                : 'فشل في جلب الفيديوهات';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade400),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.coursesByCategory.isEmpty) {
          return const Center(
              child: Text('No Courses',
                  style: TextStyle(fontSize: 18, color: Colors.grey)));
        } else {
          return ListView.builder(
            itemCount: controller.coursesByCategory.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (ctx, i) {
              final course = controller.coursesByCategory[i];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                            child: Text(course.courseName.substring(0, 1),
                                style: TextStyle(color: Colors.blue.shade700)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(course.courseName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text('Teacher: ${course.teacherName}',
                                    style: const TextStyle(fontSize: 14)),
                                if (course.categoryName != null)
                                  Text('Category: ${course.categoryName}',
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Text('${course.price} S.P',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () async =>
                                  registerOnCourse(context, course.courseId),
                              icon: const Icon(Icons.check_circle_outline,
                                  color: Colors.white, size: 20),
                              label: const Text('Register',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                elevation: 0,
                                minimumSize: const Size(0, 46),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  title: course.courseName,
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Teacher : ${course.teacherName}'),
                                      Text('Price : ${course.price} S.P'),
                                      if (course.categoryName != null)
                                        Text(
                                            'Category : ${course.categoryName}'),
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.info_outline,
                                  color: Colors.blue.shade700, size: 20),
                              label: Text('Details',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: Colors.blue.shade200, width: 1.3),
                                backgroundColor: Colors.blue.shade50,
                                minimumSize: const Size(0, 46),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () async =>
                                  _watchFlow(context, course.courseId),
                              icon: const Icon(Icons.play_circle_outline,
                                  color: Colors.white, size: 20),
                              label: const Text('Watch',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple.shade400,
                                minimumSize: const Size(0, 46),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                              ),
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

>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     // تحرّي بسيط لمسار ويندوز مثل C:\... أو يحتوي باك-سلاش
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       // ✅ دعم تشغيل من الأصول (assets)
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       }
//       // ✅ إذا كان مسار ملف محلّي → استخدم VideoPlayerController.file
//       else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         // خلاف ذلك نتعامل معه كرابط شبكة
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start
//         ? start
//         : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     // 1.0 → 1.25 → 1.5 → 2.0 → 1.0
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // إرجاع 10 ثواني
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           // تشغيل/إيقاف
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           // تقديم 10 ثواني
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           // تغيير السرعة
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           // ملء الشاشة
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: VideoPlayer(_controller!),
//                           ),
//                         ),
//                         VideoProgressIndicator(
//                           _controller!,
//                           allowScrubbing: true,
//                           colors: VideoProgressColors(
//                             backgroundColor: Colors.grey.shade800,
//                             playedColor: Colors.blue.shade300,
//                             bufferedColor: Colors.blue.shade100,
//                           ),
//                         ),
//                         _controls(),
//                       ],
//                     )
//                   else
//                     _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//           onTap: () {
//             setState(() {
//               if (_ctrl!.value.isPlaying) {
//                 _ctrl!.pause();
//               } else {
//                 _ctrl!.play();
//               }
//             });
//           },
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Center(
//                 child: AspectRatio(
//                   aspectRatio: _ctrl!.value.aspectRatio,
//                   child: VideoPlayer(_ctrl!),
//                 ),
//               ),
//               VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//             ],
//           ),
//         )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> fetchAndShowFirstCourseVideo(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isNotEmpty && videos[0]['video_url'] != null) {
//           Get.to(() => VideoPlayerCardScreen(videoUrl: videos[0]['video_url']));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديو متاح للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//         }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                               // overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch مضبوط (يبقى كما هو – يستخدم الأصول)
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 // تشغيل فيديو من الأصول (assets) دائماً
//                                 Get.to(() => const VideoPlayerCardScreen(
//                                   videoUrl: 'assets/videos/a.mp4',
//                                 ));
//                                 // أو لو بدك تتحقق من التسجيل أولاً:
//                                 // await fetchAndShowFirstCourseVideo(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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

// import 'dart:io'; // ✅ لدعم قراءة الملفات المحليّة
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:video_player/video_player.dart';

// /// شاشة مشغل فيديو داخل كارد مع تحميل وتحقق من الرابط بشكل احترافي
// class VideoPlayerCardScreen extends StatefulWidget {
//   final String videoUrl; // قد يكون رابط شبكة أو مسار ملف محلّي (ويندوز) أو asset
//   const VideoPlayerCardScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState();
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;
//   bool _isLoading = false;
//   bool _hasError = false;
//   String? _errorMsg;
//   bool _showPlayButton = true;
//   double _speed = 1.0;

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   Future<void> _startLoadingVideo() async {
//     setState(() {
//       _isLoading = true;
//       _hasError = false;
//       _errorMsg = null;
//       _showPlayButton = false;
//     });
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _controller = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         final file = File(widget.videoUrl);
//         if (!file.existsSync()) {
//           throw 'لم يتم العثور على الملف على هذا المسار:\n${widget.videoUrl}';
//         }
//         _controller = VideoPlayerController.file(file);
//       } else {
//         _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }

//       await _controller!.initialize();
//       await _controller!.setPlaybackSpeed(_speed);

//       setState(() {
//         _isLoading = false;
//         _showPlayButton = false;
//       });
//       _controller!.play();
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _hasError = true;
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}';
//         _showPlayButton = true;
//       });
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_errorMsg!),
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 15),
//           ),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//     });
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final current = _controller!.value.position;
//     final target = current + offset;
//     final start = Duration.zero;
//     final end = _controller!.value.duration;
//     final clamped = target < start ? start : (target > end ? end : target);
//     await _controller!.seekTo(clamped);
//   }

//   Future<void> _cycleSpeed() async {
//     const speeds = [1.0, 1.25, 1.5, 2.0];
//     final idx = speeds.indexOf(_speed);
//     final next = speeds[(idx + 1) % speeds.length];
//     _speed = next;
//     if (_controller != null) {
//       await _controller!.setPlaybackSpeed(_speed);
//       if (mounted) setState(() {});
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('السرعة: ${_speed}x'),
//           duration: const Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   void _openFullscreen() {
//     if (_controller == null || !_controller!.value.isInitialized) return;
//     final currentPos = _controller!.value.position;
//     final wasPlaying = _controller!.value.isPlaying;
//     final url = widget.videoUrl;
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(
//           videoUrl: url,
//           initialPosition: currentPos,
//           speed: _speed,
//           autoPlay: wasPlaying,
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayButton() {
//     return Center(
//       child: GestureDetector(
//         onTap: _startLoadingVideo,
//         child: CircleAvatar(
//           radius: 44,
//           backgroundColor: Colors.white.withOpacity(0.08),
//           child: const Icon(
//             Icons.play_circle_fill,
//             color: Colors.white,
//             size: 90,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _controls() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',
//             icon: const Icon(Icons.replay_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: -10)),
//           ),
//           IconButton(
//             tooltip: _controller?.value.isPlaying == true ? 'إيقاف مؤقت' : 'تشغيل',
//             iconSize: 34,
//             icon: Icon(
//               _controller?.value.isPlaying == true
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//             onPressed: _togglePlay,
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',
//             icon: const Icon(Icons.forward_10, color: Colors.white),
//             onPressed: () => _seekRelative(const Duration(seconds: 10)),
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,
//             child: Text(
//               '${_speed}x',
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',
//             icon: const Icon(Icons.fullscreen, color: Colors.white),
//             onPressed: _openFullscreen,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('مشاهدة الفيديو'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Card(
//           color: Colors.black,
//           elevation: 8,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.94,
//             height: 360,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (_hasError)
//                   const Center(
//                     child: Icon(Icons.error, color: Colors.red, size: 64),
//                   )
//                 else if (_isLoading)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
//                       ),
//                       SizedBox(height: 20),
//                       Text('جاري تحميل الفيديو ...',
//                           style: TextStyle(color: Colors.white, fontSize: 18)),
//                     ],
//                   )
//                 else if (_controller != null && _controller!.value.isInitialized)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AspectRatio(
//                         aspectRatio: _controller!.value.aspectRatio,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: VideoPlayer(_controller!),
//                         ),
//                       ),
//                       VideoProgressIndicator(
//                         _controller!,
//                         allowScrubbing: true,
//                         colors: VideoProgressColors(
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controls(),
//                     ],
//                   )
//                 else
//                   _buildPlayButton(),
//                 if (_showPlayButton && !_isLoading && (_controller == null || !_controller!.value.isInitialized))
//                   _buildPlayButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// شاشة ملء الشاشة
// class FullscreenVideoScreen extends StatefulWidget {
//   final String videoUrl;
//   final Duration initialPosition;
//   final double speed;
//   final bool autoPlay;

//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;
//   bool _ready = false;

//   bool _looksLikeLocalFilePath(String p) {
//     return p.contains(':\\') || p.contains(':/') || (Platform.isWindows && p.contains('\\'));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       if (widget.videoUrl.startsWith('assets/')) {
//         _ctrl = VideoPlayerController.asset(widget.videoUrl);
//       } else if (_looksLikeLocalFilePath(widget.videoUrl)) {
//         _ctrl = VideoPlayerController.file(File(widget.videoUrl));
//       } else {
//         _ctrl = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       }
//       await _ctrl!.initialize();
//       await _ctrl!.setPlaybackSpeed(widget.speed);
//       await _ctrl!.seekTo(widget.initialPosition);
//       if (widget.autoPlay) _ctrl!.play();
//       setState(() => _ready = true);
//     } catch (_) {
//       setState(() => _ready = false);
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('ملء الشاشة'),
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     if (_ctrl!.value.isPlaying) {
//                       _ctrl!.pause();
//                     } else {
//                       _ctrl!.play();
//                     }
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Center(
//                       child: AspectRatio(
//                         aspectRatio: _ctrl!.value.aspectRatio,
//                         child: VideoPlayer(_ctrl!),
//                       ),
//                     ),
//                     VideoProgressIndicator(_ctrl!, allowScrubbing: true),
//                   ],
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // ✅ تحويل CoursesByCategoryView إلى StatefulWidget لمعالجة البطء
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() {
//       controller.fetchCoursesByCategoryId(widget.categoryId);
//     });
//   }

//   // ✅ تعديل: عند نجاح التسجيل نخزّن course_id من الـ response في الكاش
//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';
//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }
//       final response = await Dio().post(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/register',
=======
//         'http://192.168.1.5:8000/api/courses/register',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         data: {'course_id': courseId.toString()},
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );

//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         // استخراج course_id من أكثر من احتمال
//         final data = response.data;
//         int? cid;

//         if (data['course_id'] is int) {
//           cid = data['course_id'];
//         } else if (data['data'] is Map && data['data']['course_id'] is int) {
//           cid = data['data']['course_id'];
//         } else if (data['registration'] is Map && data['registration']['course_id'] is int) {
//           cid = data['registration']['course_id'];
//         } else if (data['course'] is Map && data['course']['id'] is int) {
//           cid = data['course']['id'];
//         } else {
//           // كاحتياط: استخدم الـ courseId الذي سجّلنا به
//           cid = courseId;
//         }

//         await prefs.setInt('course_id', cid!);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('تم تسجيلك في الكورس بنجاح! (ID: $cid)'),
//             backgroundColor: Colors.blue.shade700,
//           ),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ التحقق قبل عرض الفيديو: (1) هل الطالب مسجّل (من الكاش)؟ (2) هل توجد فيديوهات في الباك؟
//   Future<void> verifyAndShowVideo(BuildContext context, int pressedCourseId) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final savedCourseId = prefs.getInt('course_id');
//       final token = prefs.getString('token') ?? '';
//       final tokenType = prefs.getString('token_type') ?? '';

//       if (savedCourseId == null || savedCourseId != pressedCourseId) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('يجب التسجيل في هذا الكورس أولاً قبل المشاهدة'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//         return;
//       }

//       if (token.isEmpty || tokenType.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لم يتم العثور على توكن الطالب!'), backgroundColor: Colors.red),
//         );
//         return;
//       }

//       // استدعاء الـ API للتحقق من وجود فيديوهات للكورس
//       final response = await Dio().get(
<<<<<<< HEAD
//         'http://192.168.137.1:8000:8000/api/courses/$pressedCourseId/videos',
=======
//         'http://192.168.1.5:8000/api/courses/$pressedCourseId/videos',
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
//         options: Options(
//           headers: {'Accept': 'application/json', 'Authorization': '$tokenType $token'},
//         ),
//       );

//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final List<dynamic> videos = response.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('لا يوجد فيديوهات متاحة لهذا الكورس حالياً'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//           return;
//         }

//         // توجد فيديوهات → نعرض من الأصول حسب الـ id المخزّن
//         String? assetPath;
//         if (savedCourseId == 3) {
//           assetPath = 'assets/a.mp4';
//         } else if (savedCourseId == 4) {
//           assetPath = 'assets/b.mp4';
//         }

//         if (assetPath != null) {
//   Get.to(() => VideoPlayerCardScreen(videoUrl: assetPath!));
// } else {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('لا يوجد فيديو أصول لهذا الكورس')),
//   );
// }
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ أثناء جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لا تستدعي fetchCoursesByCategoryId هنا أبداً
//     return Scaffold(
//       appBar: AppBar(
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
//                           // زر Register مضبوط
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await registerOnCourse(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Register',
//                                 maxLines: 1,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue.shade700,
//                                 shadowColor: Colors.blue.shade100,
//                                 elevation: 0,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Details مضبوط
//                           Expanded(
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 Get.defaultDialog(
//                                   title: course.courseName,
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Teacher : ${course.teacherName}'),
//                                       Text('Price : ${course.price} S.P'),
//                                       if (course.categoryName != null)
//                                         Text('Category : ${course.categoryName}'),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                               label: Text(
//                                 'Details',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//                                 backgroundColor: Colors.blue.shade50,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),

//                           // زر Watch: تحقق من التسجيل + تحقق من وجود فيديوهات + عرض من الأصول حسب course_id
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () async {
//                                 await verifyAndShowVideo(context, course.courseId);
//                               },
//                               icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//                               label: const Text(
//                                 'Watch',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple.shade400,
//                                 minimumSize: const Size(0, 46),
//                                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                               ),
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
<<<<<<< HEAD

// زابط كلشي بس قصة تسريع وارجاع لا
// استيراد مكتبات Dart و Flutter والحزم اللازمة
// import 'dart:io';                                     // قد تحتاجه للتعامل مع نظام الملفات/المنصّة (موجود هنا كما في كودك)
// import 'package:flutter/material.dart';               // عناصر واجهة Flutter
// import 'package:get/get.dart';                       // GetX لإدارة الحالة والتنقل
// import 'package:project_2/Controller/dashboard_controller.dart'; // الكنترولر (إن احتجته في هذه الشاشة)
// import 'package:project_2/View/Exam_Screen.dart';    // شاشة الامتحان (مستوردة هنا كما في الكود)
// import 'package:shared_preferences/shared_preferences.dart'; // للتخزين المحلي (مستوردة إن احتجتها)
// import 'package:dio/dio.dart';                       // Dio لطلبات الشبكة (مستوردة إن احتجتها)
// import 'package:video_player/video_player.dart';     // حزمة مشغل الفيديو

// /// ===============================
// /// شاشة مشغل الفيديو (مصدر الشبكة)
// /// ===============================
// class VideoPlayerCardScreen extends StatefulWidget {  // ويدجت حالته متغيرة لوجود مشغل فيديو
//   final String videoUrl;                              // رابط الفيديو الشبكي الذي سنعرضه
//   const VideoPlayerCardScreen({super.key, required this.videoUrl}); // مُنشئ، يستقبل الرابط إجباريًا

//   @override
//   State<VideoPlayerCardScreen> createState() => _VideoPlayerCardScreenState(); // إنشاء حالة الودجت
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController? _controller;                 // متحكم مشغل الفيديو (قد يكون null لحين التهيئة)
//   final RxBool _isPlaying = false.obs;                // حالة تشغيل (Observable) إن أردت مراقبتها بـ GetX

//   bool _isLoading = false;                            // هل نحن في طور التحميل؟
//   bool _hasError = false;                             // هل حدث خطأ أثناء التحميل؟
//   String? _errorMsg;                                  // نص رسالة الخطأ إن وجدت
//   double _speed = 1.0;                                // سرعة التشغيل الحالية (1x افتراضيًا)

//   @override
//   void initState() {
//     super.initState();
//     _startLoadingVideo();                             // عند إنشاء الشاشة ابدأ تحميل الفيديو
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();                           // تخلّص من متحكم الفيديو عند غلق الشاشة لتفادي التسريبات
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {           // دالة تهيئة وتحميل الفيديو من الشبكة
//     setState(() {
//       _isLoading = true;                              // فعّل مؤشّر التحميل
//       _hasError = false;                              // نظّف حالة الخطأ
//       _errorMsg = null;                               // نظّف رسالة الخطأ
//     });
//     try {
//       _controller = VideoPlayerController.networkUrl( // أنشئ المتحكم برابط الشبكة (باستخدام Uri)
//         Uri.parse(widget.videoUrl),
//       );
//       await _controller!.initialize();                // انتظر تهيئة المشغل (تعرّف على المدة/الأبعاد...إلخ)
//       await _controller!.setPlaybackSpeed(_speed);    // ضبط سرعة التشغيل الأولية
//       setState(() => _isLoading = false);             // أوقف مؤشّر التحميل
//       _controller!.play();                            // ابدأ التشغيل مباشرةً
//     } catch (e) {
//       setState(() {
//         _isLoading = false;                           // أوقف التحميل
//         _hasError = true;                             // علّم بوجود خطأ
//         _errorMsg = 'فشل تحميل الفيديو: ${e.toString()}'; // خزن رسالة الخطأ للعرض
//       });
//       if (mounted) {                                  // تأكد أن الودجت ما زال على الشاشة
//         ScaffoldMessenger.of(context).showSnackBar(   // اعرض SnackBar بالخطأ
//           SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
//         );
//       }
//     }
//   }

//   void _togglePlay() {                                // دالة تبديل التشغيل/الإيقاف المؤقت
//     final c = _controller;                             // اختصار للمتحكم
//     if (c == null) return;                             // إن لم يكن مهيّأ بعد، لا تفعل شيئًا
//     setState(() => c.value.isPlaying ? c.pause() : c.play()); // إن كان يشغّل، أوقفه مؤقتًا؛ والعكس
//   }

//   Future<void> _seekRelative(Duration offset) async { // تقديم/ترجيع بمقدار زمني نسبي
//     final c = _controller;                             // اختصار
//     if (c == null || !c.value.isInitialized) return;   // تأكد من الجاهزية
//     final dur = c.value.duration;                      // مدة الفيديو الكلية
//     final pos = c.value.position + offset;             // الموقع الجديد المراد الذهاب إليه
//     final target = pos < Duration.zero                 // لا تتجاوز البداية
//         ? Duration.zero
//         : (pos > dur ? dur : pos);                     // ولا تتجاوز نهاية الفيديو
//     await c.seekTo(target);                            // قفز إلى الموضع الهدف
//   }

//   Future<void> _cycleSpeed() async {                   // تدوير سرعة التشغيل بين مجموعة قيم
//     const speeds = [1.0, 1.25, 1.5, 2.0];             // سرعات مدعومة
//     final idx = speeds.indexOf(_speed);                // موقع السرعة الحالية
//     _speed = speeds[(idx + 1) % speeds.length];        // انتقل للسرعة التالية (بشكل دائري)
//     if (_controller != null) {                         // إن كان المتحكم جاهزًا
//       await _controller!.setPlaybackSpeed(_speed);     // حدّث سرعة التشغيل
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(    // أظهر تنبيه صغير بالسرعة الجديدة
//           SnackBar(content: Text('السرعة: ${_speed}x'), duration: const Duration(seconds: 1)),
//         );
//         setState(() {});                                // أعد البناء ليتحدث عرض الزر
//       }
//     }
//   }

//   void _openFullscreen() {                             // فتح شاشة ملء الشاشة بالفيديو الحالي
//     final c = _controller;                             // اختصار
//     if (c == null || !c.value.isInitialized) return;   // تأكد من الجاهزية
//     Navigator.of(context).push(                        // ادفع صفحة جديدة (ملء الشاشة)
//       MaterialPageRoute(
//         builder: (_) => FullscreenVideoScreen(         // انتقل لـ FullscreenVideoScreen مع تمرير الحالة الحالية
//           videoUrl: widget.videoUrl,                   // نفس رابط الفيديو
//           initialPosition: c.value.position,           // موقع التشغيل الحالي
//           speed: _speed,                               // السرعة الحالية
//           autoPlay: c.value.isPlaying,                 // إن كان الفيديو يشغّل، استمر بالتشغيل في الملء
//         ),
//       ),
//     );
//   }

//   Widget _controlsBar() {                              // شريط عناصر التحكم أسفل الفيديو
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8), // مسافة عمودية حول الشريط
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,    // توسيط العناصر
//         children: [
//           IconButton(
//             tooltip: 'رجوع 10 ثواني',                   // نص مساعد
//             onPressed: () => _seekRelative(const Duration(seconds: -10)), // ارجع 10 ثواني
//             icon: const Icon(Icons.replay_10, color: Colors.white),       // أيقونة الرجوع
//           ),
//           IconButton(
//             tooltip: (_controller?.value.isPlaying ?? false) ? 'إيقاف مؤقت' : 'تشغيل', // نص حسب الحالة
//             iconSize: 34,                               // حجم الأيقونة
//             onPressed: _togglePlay,                     // بدّل التشغيل/الإيقاف
//             icon: Icon(
//               (_controller?.value.isPlaying ?? false)   // اختر الأيقونة حسب حالة التشغيل
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             tooltip: 'تقديم 10 ثواني',                  // نص مساعد
//             onPressed: () => _seekRelative(const Duration(seconds: 10)), // تقدّم 10 ثواني
//             icon: const Icon(Icons.forward_10, color: Colors.white),     // أيقونة التقديم
//           ),
//           TextButton(
//             onPressed: _cycleSpeed,                     // بدّل السرعة
//             child: Text(
//               '${_speed}x',                             // عرض السرعة الحالية
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//           IconButton(
//             tooltip: 'ملء الشاشة',                      // نص مساعد
//             onPressed: _openFullscreen,                 // افتح وضع ملء الشاشة
//             icon: const Icon(Icons.fullscreen, color: Colors.white), // أيقونة ملء الشاشة
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {                  // بناء واجهة الشاشة
//     return Scaffold(
//       backgroundColor: Colors.black,                   // خلفية سوداء مناسبة للفيديو
//       appBar: AppBar(
//         backgroundColor: Colors.black,                 // شريط علوي أسود ليتماشى مع الخلفية
//         title: const Text('مشاهدة الفيديو'),          // عنوان الصفحة
//       ),
//       body: SafeArea(                                   // تجنّب التداخل مع المناطق الآمنة
//         child: LayoutBuilder(                           // لبناء واجهة تتأقلم مع القياسات المتاحة
//           builder: (ctx, constraints) {
//             final maxW = constraints.maxWidth;          // أعرض عرض متاح
//             final maxH = MediaQuery.of(context).size.height; // ارتفاع الشاشة
//             final videoHeight = (maxW * 9 / 16).clamp(  // حساب ارتفاع فيديو بنسبة 16:9
//               180.0,                                    // لا يقل عن 180
//               maxH * 0.5,                               // ولا يزيد عن نصف ارتفاع الشاشة
//             );

//             if (_hasError) {                            // إن وجد خطأ في التحميل
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(_errorMsg ?? 'حدث خطأ',   // اعرض رسالة الخطأ
//                       style: const TextStyle(color: Colors.red)),
//                 ),
//               );
//             }

//             if (_isLoading || _controller == null || !_controller!.value.isInitialized) {
//               // أثناء التحميل أو قبل تهيئة المتحكم: اعرض مؤشّر دائري
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color?>(Colors.deepPurple), // لون المؤشّر
//                 ),
//               );
//             }

//             // في الحالة الطبيعية: اعرض الفيديو مع عناصر التحكم
//             return SingleChildScrollView(               // تمكين التمرير عموديًا عند الحاجة
//               padding: const EdgeInsets.all(12),        // حواف داخلية
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 800), // لا تتجاوز 800 عرضًا
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,     // خذ أقل مساحة مطلوبة رأسيًا
//                     children: [
//                       SizedBox(
//                         width: maxW,                     // نفس عرض المساحة المتاحة
//                         height: videoHeight,             // ارتفاع محسوب بنسبة 16:9
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(12), // زوايا دائرية للفيديو
//                           child: AspectRatio(
//                             aspectRatio: _controller!.value.aspectRatio, // استخدم نسبة الفيديو الحقيقية
//                             child: VideoPlayer(_controller!),            // عنصر عرض الفيديو
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),         // مسافة أسفل الفيديو
//                       VideoProgressIndicator(
//                         _controller!,                     // مؤشّر تقدم الفيديو
//                         allowScrubbing: true,             // السماح بالسحب لتغيير التقدّم
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         colors: VideoProgressColors(      // تخصيص الألوان
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controlsBar(),                     // شريط أدوات التحكم (تشغيل/تقديم/سرعة/ملء)
//                     ].toList(),                           // كما بالكود الأصلي: تحويل إلى List (لا تغيير)
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ===============================
// /// شاشة ملء الشاشة
// /// ===============================
// class FullscreenVideoScreen extends StatefulWidget {    // ويدجت حالة متغيرة لوضع ملء الشاشة
//   final String videoUrl;                                // نفس رابط الفيديو
//   final Duration initialPosition;                       // الموضع الذي كنا عنده في شاشة الكارد
//   final double speed;                                   // سرعة التشغيل الحالية
//   final bool autoPlay;                                  // هل نبدأ تشغيل تلقائيًا؟
//   const FullscreenVideoScreen({
//     super.key,
//     required this.videoUrl,
//     required this.initialPosition,
//     required this.speed,
//     required this.autoPlay,
//   });

//   @override
//   State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState(); // إنشاء الحالة
// }

// class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
//   VideoPlayerController? _ctrl;                         // متحكم الفيديو في وضع الملء
//   bool _ready = false;                                  // هل أصبح جاهزًا للعرض؟

//   @override
//   void initState() {
//     super.initState();
//     _init();                                            // ابدأ تهيئة الفيديو
//   }

//   Future<void> _init() async {                          // تهيئة المتحكم والإعدادات الأولية
//     try {
//       _ctrl = VideoPlayerController.networkUrl(         // أنشئ المتحكم بالرابط
//         Uri.parse(widget.videoUrl),
//       );
//       await _ctrl!.initialize();                        // انتظر التهيئة
//       await _ctrl!.setPlaybackSpeed(widget.speed);      // اضبط السرعة كما في الشاشة السابقة
//       await _ctrl!.seekTo(widget.initialPosition);      // ابدأ من الموضع السابق
//       if (widget.autoPlay) _ctrl!.play();               // إن كان تشغيل تلقائي مطلوب، شغّل
//       setState(() => _ready = true);                    // أصبح جاهزًا للعرض
//     } catch (_) {
//       setState(() => _ready = false);                   // في حال الفشل، علّم أنه غير جاهز
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl?.dispose();                                   // تخلّص من المتحكم
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {                  // بناء واجهة وضع ملء الشاشة
//     return Scaffold(
//       backgroundColor: Colors.black,                    // خلفية سوداء
//       appBar: AppBar(
//         backgroundColor: Colors.black,                  // شريط علوي أسود
//         title: const Text('ملء الشاشة'),               // عنوان
//       ),
//       body: Center(
//         child: _ready && _ctrl != null && _ctrl!.value.isInitialized
//             ? Stack(                                    // طبقات: فيديو + مؤشّر تقدم
//                 alignment: Alignment.bottomCenter,      // ضع المؤشر أسفل الفيديو
//                 children: [
//                   Center(
//                     child: AspectRatio(
//                       aspectRatio: _ctrl!.value.aspectRatio, // نسبة أبعاد الفيديو الحقيقية
//                       child: VideoPlayer(_ctrl!),            // عنصر عرض الفيديو
//                     ),
//                   ),
//                   VideoProgressIndicator(_ctrl!, allowScrubbing: true), // شريط تقدم قابل للسحب
//                 ],
//               )
//             : const CircularProgressIndicator(),        // إن لم يكن جاهزًا اعرض مؤشّر تحميل
//       ),
//     );
//   }
// }

// /// =======================================
// /// CoursesByCategoryView
// /// =======================================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(() => controller.fetchCoursesByCategoryId(widget.categoryId));
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty) 'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تسجيلك في الكورس بنجاح!'), backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg.toString()), backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';
//     try {
//       final headers = await _authHeaders();

//       final regResp = await Dio().post(
//         'http://192.168.137.1:8000:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('يلزم التسجيل في الكورس أولًا'), backgroundColor: Colors.orange),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
//         'http://192.168.137.1:8000:8000/api/courses/$courseId/videos',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'), backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('رابط الفيديو غير صالح من الخادم'), backgroundColor: Colors.red),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg = (videosResp.data is Map && videosResp.data['message'] != null)
//             ? videosResp.data['message'].toString()
//             : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ زر الامتحان: الآن يعتمد على API داخل الكنترولر لتحديد courseId تلقائيًا
//   Future<void> _onExamPressed(BuildContext context, dynamic course) async {
//     final controller = Get.find<DashboardController>();
//     await controller.openExamForCourse(
//       courseId: course.courseId,                 // إن كان متوفرًا يستخدمه مباشرة
//       courseName: course.courseName,             // وإلا سيبحث بالاسم
//       categoryName: course.categoryName ?? widget.categoryName, // وقد يطابق عبر الفئة
//       courseTitleForUi: course.courseName,       // للعنوان داخل شاشة الامتحان
//     );
//   }

//   // ✅ أزرار Responsive (مع Exam)
//   Widget _buildActionButtons(BuildContext context, dynamic course) {
//     return LayoutBuilder(
//       builder: (ctx, constraints) {
//         final isWide = constraints.maxWidth >= 640;
//         final buttonHeight = 46.0;

//         final registerBtn = ElevatedButton.icon(
//           onPressed: () async => registerOnCourse(context, course.courseId),
//           icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
//           label: const Text('Register',
//               maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue.shade700,
//             elevation: 0,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final detailsBtn = OutlinedButton.icon(
//           onPressed: () {
//             Get.defaultDialog(
//               title: course.courseName,
//               content: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Teacher : ${course.teacherName}'),
//                   Text('Price : ${course.price} S.P'),
//                   if (course.categoryName != null) Text('Category : ${course.categoryName}'),
//                 ],
//               ),
//             );
//           },
//           icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//           label: Text('Details',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.blue.shade700, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//             backgroundColor: Colors.blue.shade50,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final watchBtn = ElevatedButton.icon(
//           onPressed: () async => _watchFlow(context, course.courseId),
//           icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 20),
//           label: const Text('Watch',
//               maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple.shade400,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final examBtn = ElevatedButton.icon(
//           onPressed: () => _onExamPressed(context, course),
//           icon: const Icon(Icons.fact_check_outlined, color: Colors.white, size: 20),
//           label: const Text('Exam',
//               maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         if (isWide) {
//           return Row(
//             children: [
//               Expanded(child: registerBtn),
//               const SizedBox(width: 10),
//               Expanded(child: detailsBtn),
//               const SizedBox(width: 10),
//               Expanded(child: watchBtn),
//               const SizedBox(width: 10),
//               Expanded(child: examBtn),
//             ],
//           );
//         } else {
//           return Column(
//             children: [
//               SizedBox(width: double.infinity, child: registerBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: detailsBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: watchBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: examBtn),
//             ],
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue.shade400),
//       body: Obx(() {
//         final c = controller;
//         if (c.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (c.coursesByCategory.isEmpty) {
//           return const Center(child: Text('No Courses', style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: c.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = c.coursesByCategory[i];
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
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
//                       _buildActionButtons(context, course),
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

// import 'dart:io'; // قد تحتاجه للتعامل مع نظام الملفات/المنصّة (موجود هنا كما في كودك)
// import 'package:flutter/material.dart'; // عناصر واجهة Flutter
// import 'package:get/get.dart'; // GetX لإدارة الحالة والتنقل
// import 'package:project_2/Controller/dashboard_controller.dart'; // الكنترولر (إن احتجته في هذه الشاشة)
// import 'package:project_2/View/Exam_Screen.dart'; // شاشة الامتحان (مستوردة هنا كما في الكود)
// import 'package:shared_preferences/shared_preferences.dart'; // للتخزين المحلي (مستوردة إن احتجتها)
// import 'package:dio/dio.dart'; // Dio لطلبات الشبكة (مستوردة إن احتجتها)
// import 'package:video_player/video_player.dart'; // حزمة مشغل الفيديو

// /// ===============================
// /// شاشة مشغل الفيديو (مصدر الشبكة)
// /// ===============================
// class VideoPlayerCardScreen extends StatefulWidget {
//   // ويدجت حالته متغيرة لوجود مشغل فيديو
//   final String videoUrl; // رابط الفيديو الشبكي الذي سنعرضه
//   const VideoPlayerCardScreen(
//       {super.key, required this.videoUrl}); // مُنشئ، يستقبل الرابط إجباريًا

//   @override
//   State<VideoPlayerCardScreen> createState() =>
//       _VideoPlayerCardScreenState(); // إنشاء حالة الودجت
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController?
//       _controller; // متحكم مشغل الفيديو (قد يكون null لحين التهيئة)
//   final RxBool _isPlaying =
//       false.obs; // حالة تشغيل (Observable) إن أردت مراقبتها بـ GetX

//   bool _isLoading = false; // هل نحن في طور التحميل؟
//   bool _hasError = false; // هل حدث خطأ أثناء التحميل؟
//   String? _errorMsg; // نص رسالة الخطأ إن وجدت
//   double _speed = 1.0; // سرعة التشغيل الحالية (1x افتراضيًا)

//   @override
//   void initState() {
//     super.initState();
//     _startLoadingVideo(); // عند إنشاء الشاشة ابدأ تحميل الفيديو
//   }

//   @override
//   void dispose() {
//     _controller
//         ?.dispose(); // تخلّص من متحكم الفيديو عند غلق الشاشة لتفادي التسريبات
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     // دالة تهيئة وتحميل الفيديو من الشبكة
//     setState(() {
//       _isLoading = true; // فعّل مؤشّر التحميل
//       _hasError = false; // نظّف حالة الخطأ
//       _errorMsg = null; // نظّف رسالة الخطأ
//     });
//     try {
//       _controller = VideoPlayerController.networkUrl(
//         // أنشئ المتحكم برابط الشبكة (باستخدام Uri)
//         Uri.parse(widget.videoUrl),
//       );
//       await _controller!
//           .initialize(); // انتظر تهيئة المشغل (تعرّف على المدة/الأبعاد...إلخ)
//       await _controller!.setPlaybackSpeed(_speed); // ضبط سرعة التشغيل الأولية
//       setState(() => _isLoading = false); // أوقف مؤشّر التحميل
//       _controller!.play(); // ابدأ التشغيل مباشرةً
//     } catch (e) {
//       setState(() {
//         _isLoading = false; // أوقف التحميل
//         _hasError = true; // علّم بوجود خطأ
//         _errorMsg =
//             'فشل تحميل الفيديو: ${e.toString()}'; // خزن رسالة الخطأ للعرض
//       });
//       if (mounted) {
//         // تأكد أن الودجت ما زال على الشاشة
//         ScaffoldMessenger.of(context).showSnackBar(
//           // اعرض SnackBar بالخطأ
//           SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
//         );
//       }
//     }
//   }

//   void _togglePlay() {
//     // دالة تبديل التشغيل/الإيقاف المؤقت
//     final c = _controller; // اختصار للمتحكم
//     if (c == null) return; // إن لم يكن مهيّأ بعد، لا تفعل شيئًا
//     // ★ لا ننفّذ play/pause داخل setState
//     if (c.value.isPlaying) {
//       c.pause();
//     } else {
//       c.play();
//     }
//     setState(() {}); // حدّث الواجهة بعد التبديل
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     // تقديم/ترجيع بمقدار زمني نسبي
//     final c = _controller; // اختصار
//     if (c == null || !c.value.isInitialized) return; // تأكد من الجاهزية

//     // ★ نحصل على الموضع الحالي بشكل موثوق (بعض المنصات أدق عبر Future)
//     final currentPos = await c.position ?? Duration.zero;

//     // ★ احفظ حالة التشغيل لنرجع لها بعد seek
//     final wasPlaying = c.value.isPlaying;

//     // ★ احسب الهدف ضمن الحدود الصحيحة
//     final total = c.value.duration;
//     Duration target = currentPos + offset;

//     if (target < Duration.zero) {
//       target = Duration.zero;
//     } else if (total != Duration.zero && target > total) {
//       target = total;
//     }

//     await c.seekTo(target); // قفز إلى الموضع الهدف

//     // ★ استعادة حالة التشغيل بعد القفز
//     if (wasPlaying) {
//       await c.play();
//     }

//     setState(() {}); // حدّث الواجهة
//   }

//   Future<void> _cycleSpeed() async {
//     // تدوير سرعة التشغيل بين مجموعة قيم
//     const speeds = [1.0, 1.25, 1.5, 2.0]; // سرعات مدعومة
//     final idx = speeds.indexOf(_speed); // موقع السرعة الحالية
//     _speed =
//         speeds[(idx + 1) % speeds.length]; // انتقل للسرعة التالية (بشكل دائري)
//     if (_controller != null) {
//       // إن كان المتحكم جاهزًا
//       // ★ حافظ على حالة التشغيل بعد تغيير السرعة
//       final wasPlaying = _controller!.value.isPlaying;
//       await _controller!.setPlaybackSpeed(_speed); // حدّث سرعة التشغيل
//       if (wasPlaying) {
//         await _controller!.play(); // بعض المنصات توقف لحظيًا
//       }
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           // أظهر تنبيه صغير بالسرعة الجديدة
//           SnackBar(
//               content: Text('السرعة: ${_speed}x'),
//               duration: const Duration(seconds: 1)),
//         );
//         setState(() {}); // أعد البناء ليتحدث عرض الزر
//       }
//     }
//   }

//   Widget _controlsBar() {
//     // شريط عناصر التحكم أسفل الفيديو
//     return Padding(
//       padding:
//           const EdgeInsets.symmetric(vertical: 8), // مسافة عمودية حول الشريط
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر
//         children: [
//           // IconButton(
//           //   tooltip: 'رجوع 10 ثواني',                   // نص مساعد
//           //   onPressed: () => _seekRelative(const Duration(seconds: -10)), // ارجع 10 ثواني
//           //   icon: const Icon(Icons.replay_10, color: Colors.white),       // أيقونة الرجوع
//           // ),
//           IconButton(
//             tooltip: (_controller?.value.isPlaying ?? false)
//                 ? 'إيقاف مؤقت'
//                 : 'تشغيل', // نص حسب الحالة
//             iconSize: 34, // حجم الأيقونة
//             onPressed: _togglePlay, // بدّل التشغيل/الإيقاف
//             icon: Icon(
//               (_controller?.value.isPlaying ??
//                       false) // اختر الأيقونة حسب حالة التشغيل
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//           ),
//           // IconButton(
//           //   tooltip: 'تقديم 10 ثواني',                  // نص مساعد
//           //   onPressed: () => _seekRelative(const Duration(seconds: 10)), // تقدّم 10 ثواني
//           //   icon: const Icon(Icons.forward_10, color: Colors.white),     // أيقونة التقديم
//           // ),
//           // TextButton(
//           //   onPressed: _cycleSpeed,                     // بدّل السرعة
//           //   child: Text(
//           //     '${_speed}x',                             // عرض السرعة الحالية
//           //     style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           //   ),
//           // ),
//           // IconButton(
//           //   tooltip: 'ملء الشاشة',                      // نص مساعد
//           //   onPressed: _openFullscreen,                 // افتح وضع ملء الشاشة
//           //   icon: const Icon(Icons.fullscreen, color: Colors.white), // أيقونة ملء الشاشة
//           // ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // بناء واجهة الشاشة
//     return Scaffold(
//       backgroundColor: Colors.black, // خلفية سوداء مناسبة للفيديو
//       appBar: AppBar(
//         backgroundColor: Colors.black, // شريط علوي أسود ليتماشى مع الخلفية
//         title: const Text('مشاهدة الفيديو'), // عنوان الصفحة
//       ),
//       body: SafeArea(
//         // تجنّب التداخل مع المناطق الآمنة
//         child: LayoutBuilder(
//           // لبناء واجهة تتأقلم مع القياسات المتاحة
//           builder: (ctx, constraints) {
//             final maxW = constraints.maxWidth; // أعرض عرض متاح
//             final maxH = MediaQuery.of(context).size.height; // ارتفاع الشاشة
//             final videoHeight = (maxW * 9 / 16).clamp(
//               // حساب ارتفاع فيديو بنسبة 16:9
//               180.0, // لا يقل عن 180
//               maxH * 0.5, // ولا يزيد عن نصف ارتفاع الشاشة
//             );

//             if (_hasError) {
//               // إن وجد خطأ في التحميل
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(_errorMsg ?? 'حدث خطأ', // اعرض رسالة الخطأ
//                       style: const TextStyle(color: Colors.red)),
//                 ),
//               );
//             }

//             if (_isLoading ||
//                 _controller == null ||
//                 !_controller!.value.isInitialized) {
//               // أثناء التحميل أو قبل تهيئة المتحكم: اعرض مؤشّر دائري
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color?>(
//                       Colors.deepPurple), // لون المؤشّر
//                 ),
//               );
//             }

//             // في الحالة الطبيعية: اعرض الفيديو مع عناصر التحكم
//             return SingleChildScrollView(
//               // تمكين التمرير عموديًا عند الحاجة
//               padding: const EdgeInsets.all(12), // حواف داخلية
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(
//                       maxWidth: 800), // لا تتجاوز 800 عرضًا
//                   child: Column(
//                     mainAxisSize:
//                         MainAxisSize.min, // خذ أقل مساحة مطلوبة رأسيًا
//                     children: [
//                       SizedBox(
//                         width: maxW, // نفس عرض المساحة المتاحة
//                         height: videoHeight, // ارتفاع محسوب بنسبة 16:9
//                         child: ClipRRect(
//                           borderRadius:
//                               BorderRadius.circular(12), // زوايا دائرية للفيديو
//                           child: AspectRatio(
//                             aspectRatio: _controller!.value
//                                 .aspectRatio, // استخدم نسبة الفيديو الحقيقية
//                             child:
//                                 VideoPlayer(_controller!), // عنصر عرض الفيديو
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8), // مسافة أسفل الفيديو
//                       VideoProgressIndicator(
//                         _controller!, // مؤشّر تقدم الفيديو
//                         allowScrubbing: true, // السماح بالسحب لتغيير التقدّم
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         colors: VideoProgressColors(
//                           // تخصيص الألوان
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controlsBar(), // شريط أدوات التحكم (تشغيل/تقديم/سرعة/ملء)
//                     ].toList(), // كما بالكود الأصلي: تحويل إلى List (لا تغيير)
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ===============================
// /// شاشة ملء الشاشة
// /// ===============================

// /// =======================================
// /// CoursesByCategoryView
// /// =======================================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(
//         () => controller.fetchCoursesByCategoryId(widget.categoryId));
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty)
//         'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
//         'http://192.168.137.1:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('تم تسجيلك في الكورس بنجاح!'),
//               backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(msg.toString()),
//               backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';
//     try {
//       final headers = await _authHeaders();

//       final regResp = await Dio().post(
//         'http://192.168.137.1:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('يلزم التسجيل في الكورس أولًا'),
//               backgroundColor: Colors.orange),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
//         'http://192.168.137.1:8000/api/courses/$courseId/videos',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//                 backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('رابط الفيديو غير صالح من الخادم'),
//                 backgroundColor: Colors.red),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg =
//             (videosResp.data is Map && videosResp.data['message'] != null)
//                 ? videosResp.data['message'].toString()
//                 : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ زر الامتحان: الآن يعتمد على API داخل الكنترولر لتحديد courseId تلقائيًا
//   Future<void> _onExamPressed(BuildContext context, dynamic course) async {
//     final controller = Get.find<DashboardController>();
//     await controller.openExamForCourse(
//       courseId: course.courseId, // إن كان متوفرًا يستخدمه مباشرة
//       courseName: course.courseName, // وإلا سيبحث بالاسم
//       categoryName:
//           course.categoryName ?? widget.categoryName, // وقد يطابق عبر الفئة
//       courseTitleForUi: course.courseName, // للعنوان داخل شاشة الامتحان
//     );
//   }

//   // ✅ أزرار Responsive (مع Exam)
//   Widget _buildActionButtons(BuildContext context, dynamic course) {
//     return LayoutBuilder(
//       builder: (ctx, constraints) {
//         final isWide = constraints.maxWidth >= 640;
//         final buttonHeight = 46.0;

//         final registerBtn = ElevatedButton.icon(
//           onPressed: () async => registerOnCourse(context, course.courseId),
//           icon: const Icon(Icons.check_circle_outline,
//               color: Colors.white, size: 20),
//           label: const Text('Register',
//               maxLines: 1,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue.shade700,
//             elevation: 0,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final detailsBtn = OutlinedButton.icon(
//           onPressed: () {
//             Get.defaultDialog(
//               title: course.courseName,
//               content: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Teacher : ${course.teacherName}'),
//                   Text('Price : ${course.price} S.P'),
//                   if (course.categoryName != null)
//                     Text('Category : ${course.categoryName}'),
//                 ],
//               ),
//             );
//           },
//           icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//           label: Text('Details',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   color: Colors.blue.shade700,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600)),
//           style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//             backgroundColor: Colors.blue.shade50,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final watchBtn = ElevatedButton.icon(
//           onPressed: () async => _watchFlow(context, course.courseId),
//           icon: const Icon(Icons.play_circle_outline,
//               color: Colors.white, size: 20),
//           label: const Text('Watch',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple.shade400,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final examBtn = ElevatedButton.icon(
//           onPressed: () => _onExamPressed(context, course),
//           icon: const Icon(Icons.fact_check_outlined,
//               color: Colors.white, size: 20),
//           label: const Text('Exam',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         if (isWide) {
//           return Row(
//             children: [
//               Expanded(child: registerBtn),
//               const SizedBox(width: 10),
//               Expanded(child: detailsBtn),
//               const SizedBox(width: 10),
//               Expanded(child: watchBtn),
//               const SizedBox(width: 10),
//               Expanded(child: examBtn),
//             ],
//           );
//         } else {
//           return Column(
//             children: [
//               SizedBox(width: double.infinity, child: registerBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: detailsBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: watchBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: examBtn),
//             ],
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue.shade400),
//       body: Obx(() {
//         final c = controller;
//         if (c.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (c.coursesByCategory.isEmpty) {
//           return const Center(
//               child: Text('No Courses',
//                   style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: c.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = c.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}',
//                                     style: const TextStyle(fontSize: 14)),
//                                 if (course.categoryName != null)
//                                   Text('Category: ${course.categoryName}',
//                                       style: const TextStyle(
//                                           fontSize: 13, color: Colors.grey)),
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       _buildActionButtons(context, course),
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

// import 'dart:io'; // قد تحتاجه للتعامل مع نظام الملفات/المنصّة (موجود هنا كما في كودك)
// import 'package:flutter/material.dart'; // عناصر واجهة Flutter
// import 'package:get/get.dart'; // GetX لإدارة الحالة والتنقل
// import 'package:project_2/Controller/dashboard_controller.dart'; // الكنترولر (إن احتجته في هذه الشاشة)
// import 'package:project_2/View/Exam_Screen.dart'; // شاشة الامتحان (مستوردة هنا كما في الكود)
// import 'package:shared_preferences/shared_preferences.dart'; // للتخزين المحلي (مستوردة إن احتجتها)
// import 'package:dio/dio.dart'; // Dio لطلبات الشبكة (مستوردة إن احتجتها)
// import 'package:video_player/video_player.dart'; // حزمة مشغل الفيديو
// import 'package:url_launcher/url_launcher.dart'; // ← لإطلاق الفيديو خارجيًا على الموبايل/الويب

// /// ===============================
// /// شاشة مشغل الفيديو (مصدر الشبكة)
// /// ===============================
// class VideoPlayerCardScreen extends StatefulWidget {
//   // ويدجت حالته متغيرة لوجود مشغل فيديو
//   final String videoUrl; // رابط الفيديو الشبكي الذي سنعرضه
//   const VideoPlayerCardScreen(
//       {super.key, required this.videoUrl}); // مُنشئ، يستقبل الرابط إجباريًا

//   @override
//   State<VideoPlayerCardScreen> createState() =>
//       _VideoPlayerCardScreenState(); // إنشاء حالة الودجت
// }

// class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
//   VideoPlayerController?
//       _controller; // متحكم مشغل الفيديو (قد يكون null لحين التهيئة)
//   final RxBool _isPlaying =
//       false.obs; // حالة تشغيل (Observable) إن أردت مراقبتها بـ GetX

//   bool _isLoading = false; // هل نحن في طور التحميل؟
//   bool _hasError = false; // هل حدث خطأ أثناء التحميل؟
//   String? _errorMsg; // نص رسالة الخطأ إن وجدت
//   double _speed = 1.0; // سرعة التشغيل الحالية (1x افتراضيًا)

//   @override
//   void initState() {
//     super.initState();
//     _startLoadingVideo(); // عند إنشاء الشاشة ابدأ تحميل الفيديو
//   }

//   @override
//   void dispose() {
//     _controller
//         ?.dispose(); // تخلّص من متحكم الفيديو عند غلق الشاشة لتفادي التسريبات
//     super.dispose();
//   }

//   Future<void> _startLoadingVideo() async {
//     // دالة تهيئة وتحميل الفيديو من الشبكة
//     setState(() {
//       _isLoading = true; // فعّل مؤشّر التحميل
//       _hasError = false; // نظّف حالة الخطأ
//       _errorMsg = null; // نظّف رسالة الخطأ
//     });
//     try {
//       _controller = VideoPlayerController.networkUrl(
//         // أنشئ المتحكم برابط الشبكة (باستخدام Uri)
//         Uri.parse(widget.videoUrl),
//       );
//       await _controller!
//           .initialize(); // انتظر تهيئة المشغل (تعرّف على المدة/الأبعاد...إلخ)
//       await _controller!.setPlaybackSpeed(_speed); // ضبط سرعة التشغيل الأولية
//       setState(() => _isLoading = false); // أوقف مؤشّر التحميل
//       _controller!.play(); // ابدأ التشغيل مباشرةً
//     } catch (e) {
//       setState(() {
//         _isLoading = false; // أوقف التحميل
//         _hasError = true; // علّم بوجود خطأ
//         _errorMsg =
//             'فشل تحميل الفيديو: ${e.toString()}'; // خزن رسالة الخطأ للعرض
//       });
//       if (mounted) {
//         // تأكد أن الودجت ما زال على الشاشة
//         ScaffoldMessenger.of(context).showSnackBar(
//           // اعرض SnackBar بالخطأ
//           SnackBar(content: Text(_errorMsg!), backgroundColor: Colors.red),
//         );
//       }
//     }
//   }

//   // ← فتح الفيديو خارجيًا (على أندرويد/iOS في مشغّل النظام، وعلى الويب في تبويب جديد)
//   Future<void> _openExternal() async {
//     final uri = Uri.tryParse(widget.videoUrl);
//     if (uri == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('رابط الفيديو غير صالح'),
//             backgroundColor: Colors.red),
//       );
//       return;
//     }
//     try {
//       final ok = await launchUrl(
//         uri,
//         mode: LaunchMode
//             .externalApplication, // يفتح بالمشغّل/المتصفح الافتراضي على الموبايل
//         webOnlyWindowName: '_blank', // على الويب يفتح تبويب جديد
//       );
//       if (!ok) {
//         final ok2 = await launchUrl(uri, mode: LaunchMode.platformDefault);
//         if (!ok2) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('تعذّر فتح الفيديو خارجيًا'),
//                 backgroundColor: Colors.red),
//           );
//         }
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('خطأ أثناء الفتح الخارجي: $e'),
//             backgroundColor: Colors.red),
//       );
//     }
//   }

//   void _togglePlay() {
//     // دالة تبديل التشغيل/الإيقاف المؤقت
//     final c = _controller; // اختصار للمتحكم
//     if (c == null) return; // إن لم يكن مهيّأ بعد، لا تفعل شيئًا
//     // ★ لا ننفّذ play/pause داخل setState
//     if (c.value.isPlaying) {
//       c.pause();
//     } else {
//       c.play();
//     }
//     setState(() {}); // حدّث الواجهة بعد التبديل
//   }

//   Future<void> _seekRelative(Duration offset) async {
//     // تقديم/ترجيع بمقدار زمني نسبي
//     final c = _controller; // اختصار
//     if (c == null || !c.value.isInitialized) return; // تأكد من الجاهزية

//     // ★ نحصل على الموضع الحالي بشكل موثوق (بعض المنصات أدق عبر Future)
//     final currentPos = await c.position ?? Duration.zero;

//     // ★ احفظ حالة التشغيل لنرجع لها بعد seek
//     final wasPlaying = c.value.isPlaying;

//     // ★ احسب الهدف ضمن الحدود الصحيحة
//     final total = c.value.duration;
//     Duration target = currentPos + offset;

//     if (target < Duration.zero) {
//       target = Duration.zero;
//     } else if (total != Duration.zero && target > total) {
//       target = total;
//     }

//     await c.seekTo(target); // قفز إلى الموضع الهدف

//     // ★ استعادة حالة التشغيل بعد القفز
//     if (wasPlaying) {
//       await c.play();
//     }

//     setState(() {}); // حدّث الواجهة
//   }

//   Future<void> _cycleSpeed() async {
//     // تدوير سرعة التشغيل بين مجموعة قيم
//     const speeds = [1.0, 1.25, 1.5, 2.0]; // سرعات مدعومة
//     final idx = speeds.indexOf(_speed); // موقع السرعة الحالية
//     _speed =
//         speeds[(idx + 1) % speeds.length]; // انتقل للسرعة التالية (بشكل دائري)
//     if (_controller != null) {
//       // إن كان المتحكم جاهزًا
//       // ★ حافظ على حالة التشغيل بعد تغيير السرعة
//       final wasPlaying = _controller!.value.isPlaying;
//       await _controller!.setPlaybackSpeed(_speed); // حدّث سرعة التشغيل
//       if (wasPlaying) {
//         await _controller!.play(); // بعض المنصات توقف لحظيًا
//       }
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           // أظهر تنبيه صغير بالسرعة الجديدة
//           SnackBar(
//               content: Text('السرعة: ${_speed}x'),
//               duration: const Duration(seconds: 1)),
//         );
//         setState(() {}); // أعد البناء ليتحدث عرض الزر
//       }
//     }
//   }

//   Widget _controlsBar() {
//     // شريط عناصر التحكم أسفل الفيديو
//     return Padding(
//       padding:
//           const EdgeInsets.symmetric(vertical: 8), // مسافة عمودية حول الشريط
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر
//         children: [
//           // IconButton(
//           //   tooltip: 'رجوع 10 ثواني',                   // نص مساعد
//           //   onPressed: () => _seekRelative(const Duration(seconds: -10)), // ارجع 10 ثواني
//           //   icon: const Icon(Icons.replay_10, color: Colors.white),       // أيقونة الرجوع
//           // ),
//           IconButton(
//             tooltip: (_controller?.value.isPlaying ?? false)
//                 ? 'إيقاف مؤقت'
//                 : 'تشغيل', // نص حسب الحالة
//             iconSize: 34, // حجم الأيقونة
//             onPressed: _togglePlay, // بدّل التشغيل/الإيقاف
//             icon: Icon(
//               (_controller?.value.isPlaying ??
//                       false) // اختر الأيقونة حسب حالة التشغيل
//                   ? Icons.pause_circle_filled
//                   : Icons.play_circle_fill,
//               color: Colors.white,
//             ),
//           ),
//           // IconButton(
//           //   tooltip: 'تقديم 10 ثواني',                  // نص مساعد
//           //   onPressed: () => _seekRelative(const Duration(seconds: 10)), // تقدّم 10 ثواني
//           //   icon: const Icon(Icons.forward_10, color: Colors.white),     // أيقونة التقديم
//           // ),
//           // TextButton(
//           //   onPressed: _cycleSpeed,                     // بدّل السرعة
//           //   child: Text(
//           //     '${_speed}x',                             // عرض السرعة الحالية
//           //     style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           //   ),
//           // ),
//           // IconButton(
//           //   tooltip: 'ملء الشاشة',                      // نص مساعد
//           //   onPressed: _openFullscreen,                 // افتح وضع ملء الشاشة
//           //   icon: const Icon(Icons.fullscreen, color: Colors.white), // أيقونة ملء الشاشة
//           // ),
//           const SizedBox(width: 8),
//           // ← زر فتح خارجيًا
//           IconButton(
//             tooltip: 'فتح خارجيًا',
//             onPressed: _openExternal,
//             icon: const Icon(Icons.open_in_new, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // بناء واجهة الشاشة
//     return Scaffold(
//       backgroundColor: Colors.black, // خلفية سوداء مناسبة للفيديو
//       appBar: AppBar(
//         backgroundColor: Colors.black, // شريط علوي أسود ليتماشى مع الخلفية
//         title: const Text('مشاهدة الفيديو'), // عنوان الصفحة
//       ),
//       body: SafeArea(
//         // تجنّب التداخل مع المناطق الآمنة
//         child: LayoutBuilder(
//           // لبناء واجهة تتأقلم مع القياسات المتاحة
//           builder: (ctx, constraints) {
//             final maxW = constraints.maxWidth; // أعرض عرض متاح
//             final maxH = MediaQuery.of(context).size.height; // ارتفاع الشاشة
//             final videoHeight = (maxW * 9 / 16).clamp(
//               // حساب ارتفاع فيديو بنسبة 16:9
//               180.0, // لا يقل عن 180
//               maxH * 0.5, // ولا يزيد عن نصف ارتفاع الشاشة
//             );

//             if (_hasError) {
//               // إن وجد خطأ في التحميل
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(_errorMsg ?? 'حدث خطأ', // اعرض رسالة الخطأ
//                           style: const TextStyle(color: Colors.red)),
//                       const SizedBox(height: 12),
//                       ElevatedButton.icon(
//                         onPressed: _openExternal,
//                         icon: const Icon(Icons.open_in_new),
//                         label: const Text('فتح الفيديو خارجيًا'),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }

//             if (_isLoading ||
//                 _controller == null ||
//                 !_controller!.value.isInitialized) {
//               // أثناء التحميل أو قبل تهيئة المتحكم: اعرض مؤشّر دائري
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color?>(
//                       Colors.deepPurple), // لون المؤشّر
//                 ),
//               );
//             }

//             // في الحالة الطبيعية: اعرض الفيديو مع عناصر التحكم
//             return SingleChildScrollView(
//               // تمكين التمرير عموديًا عند الحاجة
//               padding: const EdgeInsets.all(12), // حواف داخلية
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(
//                       maxWidth: 800), // لا تتجاوز 800 عرضًا
//                   child: Column(
//                     mainAxisSize:
//                         MainAxisSize.min, // خذ أقل مساحة مطلوبة رأسيًا
//                     children: [
//                       SizedBox(
//                         width: maxW, // نفس عرض المساحة المتاحة
//                         height: videoHeight, // ارتفاع محسوب بنسبة 16:9
//                         child: ClipRRect(
//                           borderRadius:
//                               BorderRadius.circular(12), // زوايا دائرية للفيديو
//                           child: AspectRatio(
//                             aspectRatio: _controller!.value
//                                 .aspectRatio, // استخدم نسبة الفيديو الحقيقية
//                             child:
//                                 VideoPlayer(_controller!), // عنصر عرض الفيديو
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8), // مسافة أسفل الفيديو
//                       VideoProgressIndicator(
//                         _controller!, // مؤشّر تقدم الفيديو
//                         allowScrubbing: true, // السماح بالسحب لتغيير التقدّم
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         colors: VideoProgressColors(
//                           // تخصيص الألوان
//                           backgroundColor: Colors.grey.shade800,
//                           playedColor: Colors.blue.shade300,
//                           bufferedColor: Colors.blue.shade100,
//                         ),
//                       ),
//                       _controlsBar(), // شريط أدوات التحكم (تشغيل/تقديم/سرعة/ملء)
//                     ].toList(), // كما بالكود الأصلي: تحويل إلى List (لا تغيير)
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ===============================
// /// شاشة ملء الشاشة
// /// ===============================

// /// =======================================
// /// CoursesByCategoryView
// /// =======================================
// class CoursesByCategoryView extends StatefulWidget {
//   final String categoryName;
//   final int categoryId;

//   const CoursesByCategoryView({
//     super.key,
//     required this.categoryName,
//     required this.categoryId,
//   });

//   @override
//   State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
// }

// class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
//   late DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     Future.microtask(
//         () => controller.fetchCoursesByCategoryId(widget.categoryId));
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     final tokenType = prefs.getString('token_type') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty && tokenType.isNotEmpty)
//         'Authorization': '$tokenType $token',
//     };
//   }

//   Future<void> registerOnCourse(BuildContext context, int courseId) async {
//     try {
//       final headers = await _authHeaders();
//       final response = await Dio().post(
//         'http://192.168.1.5:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers),
//       );
//       if (response.statusCode == 200 && response.data['status'] == 'success') {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setInt('last_registered_course_id', courseId);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('تم تسجيلك في الكورس بنجاح!'),
//               backgroundColor: Colors.blue.shade700),
//         );
//       } else {
//         final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(msg.toString()),
//               backgroundColor: Colors.orange.shade700),
//         );
//       }
//     } on DioException catch (e) {
//       final msg = e.response?.data['message'] ?? 'فشل الاتصال بالخادم';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(msg.toString()), backgroundColor: Colors.red),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> _watchFlow(BuildContext context, int courseId) async {
//     const alreadyMsg = 'Student is already registered for this course';
//     try {
//       final headers = await _authHeaders();

//       final regResp = await Dio().post(
//         'http://192.168.1.5:8000/api/courses/register',
//         data: {'course_id': courseId.toString()},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
//           ? regResp.data['message'].toString()
//           : '';

//       final isAllowed = serverMsg.contains(alreadyMsg);
//       if (!isAllowed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('يلزم التسجيل في الكورس أولًا'),
//               backgroundColor: Colors.orange),
//         );
//         return;
//       }

//       final videosResp = await Dio().get(
//         'http://192.168.1.5:8000/api/courses/$courseId/videos',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if (videosResp.statusCode == 200 &&
//           videosResp.data is Map &&
//           videosResp.data['status'] == 'success') {
//         final List<dynamic> videos = videosResp.data['videos'] ?? [];
//         if (videos.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
//                 backgroundColor: Colors.orange),
//           );
//           return;
//         }

//         final String firstUrl = videos.first['video_url']?.toString() ?? '';
//         if (firstUrl.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('رابط الفيديو غير صالح من الخادم'),
//                 backgroundColor: Colors.red),
//           );
//           return;
//         }

//         Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
//       } else {
//         final msg =
//             (videosResp.data is Map && videosResp.data['message'] != null)
//                 ? videosResp.data['message'].toString()
//                 : 'فشل في جلب الفيديوهات';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(msg), backgroundColor: Colors.red),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   // ✅ زر الامتحان: الآن يعتمد على API داخل الكنترولر لتحديد courseId تلقائيًا
//   Future<void> _onExamPressed(BuildContext context, dynamic course) async {
//     final controller = Get.find<DashboardController>();
//     await controller.openExamForCourse(
//       courseId: course.courseId, // إن كان متوفرًا يستخدمه مباشرة
//       courseName: course.courseName, // وإلا سيبحث بالاسم
//       categoryName:
//           course.categoryName ?? widget.categoryName, // وقد يطابق عبر الفئة
//       courseTitleForUi: course.courseName, // للعنوان داخل شاشة الامتحان
//     );
//   }

//   // ✅ أزرار Responsive (مع Exam)
//   Widget _buildActionButtons(BuildContext context, dynamic course) {
//     return LayoutBuilder(
//       builder: (ctx, constraints) {
//         final isWide = constraints.maxWidth >= 640;
//         final buttonHeight = 46.0;

//         final registerBtn = ElevatedButton.icon(
//           onPressed: () async => registerOnCourse(context, course.courseId),
//           icon: const Icon(Icons.check_circle_outline,
//               color: Colors.white, size: 20),
//           label: const Text('Register',
//               maxLines: 1,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue.shade700,
//             elevation: 0,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final detailsBtn = OutlinedButton.icon(
//           onPressed: () {
//             Get.defaultDialog(
//               title: course.courseName,
//               content: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Teacher : ${course.teacherName}'),
//                   Text('Price : ${course.price} S.P'),
//                   if (course.categoryName != null)
//                     Text('Category : ${course.categoryName}'),
//                 ],
//               ),
//             );
//           },
//           icon: Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//           label: Text('Details',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   color: Colors.blue.shade700,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600)),
//           style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.blue.shade200, width: 1.3),
//             backgroundColor: Colors.blue.shade50,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final watchBtn = ElevatedButton.icon(
//           onPressed: () async => _watchFlow(context, course.courseId),
//           icon: const Icon(Icons.play_circle_outline,
//               color: Colors.white, size: 20),
//           label: const Text('Watch',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple.shade400,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         final examBtn = ElevatedButton.icon(
//           onPressed: () => _onExamPressed(context, course),
//           icon: const Icon(Icons.fact_check_outlined,
//               color: Colors.white, size: 20),
//           label: const Text('Exam',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal.shade600,
//             minimumSize: Size(0, buttonHeight),
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//           ),
//         );

//         if (isWide) {
//           return Row(
//             children: [
//               Expanded(child: registerBtn),
//               const SizedBox(width: 10),
//               Expanded(child: detailsBtn),
//               const SizedBox(width: 10),
//               Expanded(child: watchBtn),
//               const SizedBox(width: 10),
//               Expanded(child: examBtn),
//             ],
//           );
//         } else {
//           return Column(
//             children: [
//               SizedBox(width: double.infinity, child: registerBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: detailsBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: watchBtn),
//               const SizedBox(height: 10),
//               SizedBox(width: double.infinity, child: examBtn),
//             ],
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue.shade400),
//       body: Obx(() {
//         final c = controller;
//         if (c.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (c.coursesByCategory.isEmpty) {
//           return const Center(
//               child: Text('No Courses',
//                   style: TextStyle(fontSize: 18, color: Colors.grey)));
//         } else {
//           return ListView.builder(
//             itemCount: c.coursesByCategory.length,
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (ctx, i) {
//               final course = c.coursesByCategory[i];
//               return Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 14),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
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
//                             child: Text(course.courseName.substring(0, 1),
//                                 style: TextStyle(color: Colors.blue.shade700)),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(course.courseName,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17)),
//                                 Text('Teacher: ${course.teacherName}',
//                                     style: const TextStyle(fontSize: 14)),
//                                 if (course.categoryName != null)
//                                   Text('Category: ${course.categoryName}',
//                                       style: const TextStyle(
//                                           fontSize: 13, color: Colors.grey)),
//                               ],
//                             ),
//                           ),
//                           Text('${course.price} S.P',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.green)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       _buildActionButtons(context, course),
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

import 'dart:io'; // قد تحتاجه للتعامل مع نظام الملفات/المنصّة (موجود هنا كما في كودك)
import 'package:flutter/material.dart'; // عناصر واجهة Flutter
import 'package:get/get.dart'; // GetX لإدارة الحالة والتنقل
import 'package:project_2/Controller/dashboard_controller.dart'; // الكنترولر (إن احتجته في هذه الشاشة)
import 'package:project_2/View/Exam_Screen.dart'; // شاشة الامتحان (مستوردة هنا كما في الكود)
import 'package:shared_preferences/shared_preferences.dart'; // للتخزين المحلي (مستوردة إن احتجتها)
import 'package:dio/dio.dart'; // Dio لطلبات الشبكة (مستوردة إن احتجتها)
import 'package:video_player/video_player.dart'; // حزمة مشغل الفيديو
import 'package:url_launcher/url_launcher.dart'; // لفتح الفيديو خارجيًا

/// ===============================
/// شاشة مشغل الفيديو (مصدر الشبكة)
/// ===============================
class VideoPlayerCardScreen extends StatefulWidget {
  // ويدجت حالته متغيرة لوجود مشغل فيديو
  final String videoUrl; // رابط الفيديو الشبكي الذي سنعرضه
  const VideoPlayerCardScreen(
      {super.key, required this.videoUrl}); // مُنشئ، يستقبل الرابط إجباريًا

  @override
  State<VideoPlayerCardScreen> createState() =>
      _VideoPlayerCardScreenState(); // إنشاء حالة الودجت
}

class _VideoPlayerCardScreenState extends State<VideoPlayerCardScreen> {
  VideoPlayerController?
      _controller; // متحكم مشغل الفيديو (قد يكون null لحين التهيئة)
  final RxBool _isPlaying =
      false.obs; // حالة تشغيل (Observable) إن أردت مراقبتها بـ GetX

  bool _isLoading = false; // هل نحن في طور التحميل؟
  bool _hasError = false; // هل حدث خطأ أثناء التحميل؟
  String? _errorMsg; // نص رسالة الخطأ إن وجدت
  double _speed = 1.0; // سرعة التشغيل الحالية (1x افتراضيًا)

  @override
  void initState() {
    super.initState();
    _startLoadingVideo(); // عند إنشاء الشاشة ابدأ تحميل الفيديو
  }

  @override
  void dispose() {
    _controller
        ?.dispose(); // تخلّص من متحكم الفيديو عند غلق الشاشة لتفادي التسريبات
    super.dispose();
  }

  Future<void> _startLoadingVideo() async {
    // دالة تهيئة وتحميل الفيديو من الشبكة
    setState(() {
      _isLoading = true; // فعّل مؤشّر التحميل
      _hasError = false; // نظّف حالة الخطأ
      _errorMsg = null; // نظّف رسالة الخطأ
    });
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl), // أنشئ المتحكم برابط الشبكة (باستخدام Uri)
        httpHeaders: {
          // ↓ تقليل مشاكل keep-alive/chunked على بعض الأجهزة
          'Connection': 'close',
          'User-Agent': 'MyApp/1.0 (ExoPlayer)',
        },
      );
      await _controller!
          .initialize(); // انتظر تهيئة المشغل (تعرّف على المدة/الأبعاد...إلخ)
      await _controller!.setPlaybackSpeed(_speed); // ضبط سرعة التشغيل الأولية
      setState(() => _isLoading = false); // أوقف مؤشّر التحميل
      _controller!.play(); // ابدأ التشغيل مباشرةً
    } catch (e) {
      // محاولة Retry تلقائية لمرة واحدة مع نفس الترويسات
      try {
        _controller?.dispose();
        _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.videoUrl),
          httpHeaders: {
            'Connection': 'close',
            'User-Agent': 'MyApp/1.0 (ExoPlayer)'
          },
        );
        await _controller!.initialize();
        await _controller!.setPlaybackSpeed(_speed);
        setState(() => _isLoading = false);
        _controller!.play();
        return;
      } catch (_) {
        setState(() {
          _isLoading = false; // أوقف التحميل
          _hasError = true; // علّم بوجود خطأ
          _errorMsg =
              'تعذّر تشغيل الفيديو داخليًا.'; // رسالة مختصرة بدل الاستثناء الكامل
        });
        if (mounted) {
          // تأكد أن الودجت ما زال على الشاشة
          ScaffoldMessenger.of(context).showSnackBar(
            // SnackBar مختصرة بدون طباعة الاستثناء
            const SnackBar(
                content: Text('تعذّر تشغيل الفيديو داخليًا'),
                backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  // فتح الفيديو خارجيًا (أندرويد/iOS مشغّل النظام، وبالويب تبويب جديد)
  Future<void> _openExternal() async {
    final uri = Uri.tryParse(widget.videoUrl);
    if (uri == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('رابط الفيديو غير صالح'),
            backgroundColor: Colors.red),
      );
      return;
    }
    try {
      final ok = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
      if (!ok) {
        final ok2 = await launchUrl(uri, mode: LaunchMode.platformDefault);
        if (!ok2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('تعذّر فتح الفيديو خارجيًا'),
                backgroundColor: Colors.red),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('خطأ أثناء الفتح الخارجي: $e'),
            backgroundColor: Colors.red),
      );
    }
  }

  void _togglePlay() {
    // دالة تبديل التشغيل/الإيقاف المؤقت
    final c = _controller; // اختصار للمتحكم
    if (c == null) return; // إن لم يكن مهيّأ بعد، لا تفعل شيئًا
    if (c.value.isPlaying) {
      c.pause();
    } else {
      c.play();
    }
    setState(() {}); // حدّث الواجهة بعد التبديل
  }

  Future<void> _seekRelative(Duration offset) async {
    // تقديم/ترجيع بمقدار زمني نسبي
    final c = _controller; // اختصار
    if (c == null || !c.value.isInitialized) return; // تأكد من الجاهزية

    final currentPos = await c.position ?? Duration.zero; // موقع دقيق
    final wasPlaying = c.value.isPlaying; // احفظ حالة التشغيل

    final total = c.value.duration;
    Duration target = currentPos + offset;

    if (target < Duration.zero) {
      target = Duration.zero;
    } else if (total != Duration.zero && target > total) {
      target = total;
    }

    await c.seekTo(target); // قفز إلى الموضع الهدف
    if (wasPlaying) await c.play(); // استعادة الحالة
    setState(() {}); // حدّث الواجهة
  }

  Future<void> _cycleSpeed() async {
    // تدوير سرعة التشغيل بين مجموعة قيم
    const speeds = [1.0, 1.25, 1.5, 2.0]; // سرعات مدعومة
    final idx = speeds.indexOf(_speed); // موقع السرعة الحالية
    _speed = speeds[(idx + 1) % speeds.length]; // انتقل للسرعة التالية
    if (_controller != null) {
      final wasPlaying = _controller!.value.isPlaying;
      await _controller!.setPlaybackSpeed(_speed); // حدّث السرعة
      if (wasPlaying) await _controller!.play();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('السرعة: ${_speed}x'),
              duration: const Duration(seconds: 1)),
        );
        setState(() {}); // تحديث عرض الزر
      }
    }
  }

  Widget _controlsBar() {
    // شريط عناصر التحكم أسفل الفيديو
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IconButton(
          //   tooltip: 'رجوع 10 ثواني',
          //   onPressed: () => _seekRelative(const Duration(seconds: -10)),
          //   icon: const Icon(Icons.replay_10, color: Colors.white),
          // ),
          IconButton(
            tooltip: (_controller?.value.isPlaying ?? false)
                ? 'إيقاف مؤقت'
                : 'تشغيل',
            iconSize: 34,
            onPressed: _togglePlay,
            icon: Icon(
              (_controller?.value.isPlaying ?? false)
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_fill,
              color: Colors.white,
            ),
          ),
          // IconButton(
          //   tooltip: 'تقديم 10 ثواني',
          //   onPressed: () => _seekRelative(const Duration(seconds: 10)),
          //   icon: const Icon(Icons.forward_10, color: Colors.white),
          // ),
          // TextButton(
          //   onPressed: _cycleSpeed,
          //   child: Text('${_speed}x', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          // ),
          // IconButton(
          //   tooltip: 'ملء الشاشة',
          //   onPressed: _openFullscreen,
          //   icon: const Icon(Icons.fullscreen, color: Colors.white),
          // ),
          const SizedBox(width: 8),
          // زر فتح خارجيًا (يبقى دائمًا)
          IconButton(
            tooltip: 'فتح خارجيًا',
            onPressed: _openExternal,
            icon: const Icon(Icons.open_in_new, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة الشاشة
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('مشاهدة الفيديو'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            final maxW = constraints.maxWidth;
            final maxH = MediaQuery.of(context).size.height;
            final videoHeight = (maxW * 9 / 16).clamp(180.0, maxH * 0.5);

            if (_hasError) {
              // واجهة أنيقة بدون طباعة نص الاستثناء، مع زر فتح خارجيًا + إعادة المحاولة
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.video_file_outlined,
                          size: 64, color: Colors.white70),
                      const SizedBox(height: 12),
                      const Text(
                        'تعذّر تشغيل الفيديو داخل التطبيق',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'يمكنك فتح الفيديو خارجيًا أو إعادة المحاولة.',
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _openExternal,
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('فتح الفيديو خارجيًا'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple.shade200,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: _startLoadingVideo,
                            icon: const Icon(Icons.refresh),
                            label: const Text('إعادة المحاولة'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white54),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            if (_isLoading ||
                _controller == null ||
                !_controller!.value.isInitialized) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color?>(Colors.deepPurple),
                ),
              );
            }

            // في الحالة الطبيعية: اعرض الفيديو مع عناصر التحكم
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: maxW,
                        height: videoHeight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      VideoProgressIndicator(
                        _controller!,
                        allowScrubbing: true,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        colors: VideoProgressColors(
                          backgroundColor: Colors.grey.shade800,
                          playedColor: Colors.blue.shade300,
                          bufferedColor: Colors.blue.shade100,
                        ),
                      ),
                      _controlsBar(),
                    ].toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ===============================
/// شاشة ملء الشاشة
/// ===============================

/// =======================================
/// CoursesByCategoryView
/// =======================================
class CoursesByCategoryView extends StatefulWidget {
  final String categoryName;
  final int categoryId;

  const CoursesByCategoryView({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  @override
  State<CoursesByCategoryView> createState() => _CoursesByCategoryViewState();
}

class _CoursesByCategoryViewState extends State<CoursesByCategoryView> {
  late DashboardController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DashboardController>();
    Future.microtask(
        () => controller.fetchCoursesByCategoryId(widget.categoryId));
  }

  Future<Map<String, String>> _authHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final tokenType = prefs.getString('token_type') ?? '';
    return {
      'Accept': 'application/json',
      if (token.isNotEmpty && tokenType.isNotEmpty)
        'Authorization': '$tokenType $token',
    };
  }

  Future<void> registerOnCourse(BuildContext context, int courseId) async {
    try {
      final headers = await _authHeaders();
      final response = await Dio().post(
        'http://192.168.1.5:8000/api/courses/register',
        data: {'course_id': courseId.toString()},
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('last_registered_course_id', courseId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('تم تسجيلك في الكورس بنجاح!'),
              backgroundColor: Colors.blue.shade700),
        );
      } else {
        final msg = response.data['message'] ?? 'حصل خطأ غير متوقع';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(msg.toString()),
              backgroundColor: Colors.orange.shade700),
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

  Future<void> _watchFlow(BuildContext context, int courseId) async {
    // const alreadyMsg = 'Student is already registered for this course';
    try {
      final headers = await _authHeaders();

      // final regResp = await Dio().post(
      //   'http://192.168.1.5:8000/api/courses/register',
      //   data: {'course_id': courseId.toString()},
      //   options: Options(headers: headers, validateStatus: (_) => true),
      // );

      // final serverMsg = (regResp.data is Map && regResp.data['message'] != null)
      //     ? regResp.data['message'].toString()
      //     : '';

      // final isAllowed = serverMsg.contains(alreadyMsg);
      // if (!isAllowed) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //         content: Text('يلزم التسجيل في الكورس أولًا'),
      //         backgroundColor: Colors.orange),
      //   );
      //   return;
      // }

      final videosResp = await Dio().get(
        'http://192.168.1.5:8000/api/courses/$courseId/videos',
        options: Options(headers: headers, validateStatus: (_) => true),
      );

      if (videosResp.statusCode == 200 &&
          videosResp.data is Map &&
          videosResp.data['status'] == 'success') {
        final List<dynamic> videos = videosResp.data['videos'] ?? [];
        if (videos.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('لا يوجد فيديوهات متاحة للكورس حالياً!'),
                backgroundColor: Colors.orange),
          );
          return;
        }

        final String firstUrl = videos.first['video_url']?.toString() ?? '';
        if (firstUrl.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('رابط الفيديو غير صالح من الخادم'),
                backgroundColor: Colors.red),
          );
          return;
        }

        Get.to(() => VideoPlayerCardScreen(videoUrl: firstUrl));
      } else {
        final msg =
            (videosResp.data is Map && videosResp.data['message'] != null)
                ? videosResp.data['message'].toString()
                : 'فشل في جلب الفيديوهات';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('خطأ غير متوقع: $e'), backgroundColor: Colors.red),
      );
    }
  }

  // ✅ زر الامتحان: الآن يعتمد على API داخل الكنترولر لتحديد courseId تلقائيًا
  Future<void> _onExamPressed(BuildContext context, dynamic course) async {
    final controller = Get.find<DashboardController>();
    await controller.openExamForCourse(
      courseId: course.courseId, // إن كان متوفرًا يستخدمه مباشرة
      courseName: course.courseName, // وإلا سيبحث بالاسم
      categoryName:
          course.categoryName ?? widget.categoryName, // وقد يطابق عبر الفئة
      courseTitleForUi: course.courseName, // للعنوان داخل شاشة الامتحان
    );
  }

  // ✅ أزرار Responsive (مع Exam)
  Widget _buildActionButtons(BuildContext context, dynamic course) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final isWide = constraints.maxWidth >= 640;
        final buttonHeight = 48.0;
        final radius = 14.0;

        // صانع زر مخصص مع تدرّج وظلّ
        Widget _fancyButton({
          required VoidCallback onTap,
          required IconData icon,
          required String label,
          required List<Color> gradient,
          Color? foreground,
        }) {
          return Semantics(
            button: true,
            label: label,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(radius),
              child: Ink(
                height: buttonHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradient),
                  borderRadius: BorderRadius.circular(radius),
                  boxShadow: [
                    BoxShadow(
                      color: gradient.last.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: foreground ?? Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: foreground ?? Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        // الأزرار الأربعة بنفس السلوك السابق
        final registerBtn = _fancyButton(
          onTap: () async => registerOnCourse(context, course.courseId),
          icon: Icons.check_circle_outline,
          label: 'Register',
          gradient: [Colors.blue.shade600, Colors.blue.shade800],
        );

        final detailsBtn = _fancyButton(
          onTap: () {
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
          icon: Icons.info_outline,
          label: 'Details',
          // تدرّج فاتح مع نص داكن
          gradient: [Colors.blue.shade50, Colors.blue.shade100],
          foreground: Colors.blue.shade700,
        );

        final watchBtn = _fancyButton(
          onTap: () async => _watchFlow(context, course.courseId),
          icon: Icons.play_circle_outline,
          label: 'Watch',
          gradient: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
        );

        final examBtn = _fancyButton(
          onTap: () => _onExamPressed(context, course),
          icon: Icons.fact_check_outlined,
          label: 'Exam',
          gradient: [Colors.teal.shade500, Colors.teal.shade700],
        );

        if (isWide) {
          // صف واحد على الشاشات الواسعة
          return Row(
            children: [
              Expanded(child: registerBtn),
              const SizedBox(width: 10),
              Expanded(child: detailsBtn),
              const SizedBox(width: 10),
              Expanded(child: watchBtn),
              const SizedBox(width: 10),
              Expanded(child: examBtn),
            ],
          );
        } else {
          // شبكة 2×2 للموبايل
          final itemWidth = (constraints.maxWidth - 10) / 2;
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              SizedBox(width: itemWidth, child: registerBtn),
              SizedBox(width: itemWidth, child: detailsBtn),
              SizedBox(width: itemWidth, child: watchBtn),
              SizedBox(width: itemWidth, child: examBtn),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade400),
      body: Obx(() {
        final c = controller;
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (c.coursesByCategory.isEmpty) {
          return const Center(
              child: Text('No Courses',
                  style: TextStyle(fontSize: 18, color: Colors.grey)));
        } else {
          return ListView.builder(
            itemCount: c.coursesByCategory.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (ctx, i) {
              final course = c.coursesByCategory[i];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                            child: Text(course.courseName.substring(0, 1),
                                style: TextStyle(color: Colors.blue.shade700)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(course.courseName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text('Teacher: ${course.teacherName}',
                                    style: const TextStyle(fontSize: 14)),
                                if (course.categoryName != null)
                                  Text('Category: ${course.categoryName}',
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Text('${course.price} S.P',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildActionButtons(context, course),
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
=======
>>>>>>> c9168ddd750ac52702f771eced74036043f3ffa9
