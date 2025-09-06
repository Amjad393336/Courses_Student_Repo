// lib/View/student_dashboard.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/View/wallet_view.dart';
//
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }
//
// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();
//
//   final Map<String, List<String>> _subCategories = {
//     'طبي': ['تشخيص', 'علاج', 'صيدلة'],
//     'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
//     'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
//   };
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   Widget buildStars(int count) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (i) {
//         return Icon(
//           i < count ? Icons.star : Icons.star_border,
//           size: 16,
//           color: Colors.amber,
//         );
//       }),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child: Obx(() {
//           final cats = controller.categories;
//           return Column(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cats.length,
//                   itemBuilder: (ctx, idx) {
//                     final cat = cats[idx];
//                     final subList = _subCategories[cat.name] ?? [];
//                     return Theme(
//                       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//                       child: ExpansionTile(
//                         title: Text(
//                           cat.name,
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         trailing: const Icon(Icons.keyboard_arrow_down),
//                         children: subList.isNotEmpty
//                             ? subList
//                             .map((sub) => ListTile(
//                           title: Text(sub),
//                           leading: const Icon(Icons.arrow_right),
//                           onTap: () {},
//                         ))
//                             .toList()
//                             : [
//                           const ListTile(
//                             title: Text('لا توجد فئات فرعية'),
//                             leading: Icon(Icons.info_outline),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           );
//         }),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.grey),
//                 onPressed: () {
//                   _searchController.clear();
//                   controller.clearCourseSearch();
//                 },
//               )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: (value) => controller.searchCourses(value),
//             onChanged: (value) {
//               if (value.isEmpty) {
//                 controller.clearCourseSearch();
//               }
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {
//               Get.to(() => const WalletView());
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         } else if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         } else if (controller.coursesBySearch.isNotEmpty) {
//           // نتائج البحث
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text("Teacher: ${course.teacherName}" +
//                       (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
//                   trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         } else {
//           // العرض الافتراضي للفئات
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Recommended For You',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: controller.categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = controller.categories[idx];
//                       return GestureDetector(
//                         onTap: () {
//
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           elevation: 2,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       cat.name,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     buildStars(cat.rating),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
// lib/View/student_dashboard.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/View/wallet_view.dart';

// import '../Model/category_model.dart';
// import 'Courses_list.dart'; // إضافة

// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();

//   final Map<String, List<String>> _subCategories = {
//     'طبي': ['تشخيص', 'علاج', 'صيدلة'],
//     'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
//     'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
//   };

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   Widget buildStars(int count) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (i) {
//         return Icon(
//           i < count ? Icons.star : Icons.star_border,
//           size: 16,
//           color: Colors.amber,
//         );
//       }),
//     );
//   }

//   void _onCategoryTap(Category cat) {
//     int? catId;
//     if (cat.name == 'طبي') {
//       catId = 3;
//     } else if (cat.name == 'رياضيات') {
//       catId = 4;
//     } else if (cat.name == 'كيمياء') {
//       catId = 5;
//     }

//     if (catId != null) {
//       Get.to(() => CoursesByCategoryView(categoryName: cat.name, categoryId: catId!)); // استخدام catId!
//     } else {
//       Get.snackbar('تنبيه', 'لا يوجد كورسات لهذا التصنيف حالياً');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child: Obx(() {
//           final cats = controller.categories;
//           return Column(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cats.length,
//                   itemBuilder: (ctx, idx) {
//                     final cat = cats[idx];
//                     final subList = _subCategories[cat.name] ?? [];
//                     return Theme(
//                       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//                       child: ExpansionTile(
//                         title: Text(
//                           cat.name,
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         trailing: const Icon(Icons.keyboard_arrow_down),
//                         children: subList.isNotEmpty
//                             ? subList
//                             .map((sub) => ListTile(
//                           title: Text(sub),
//                           leading: const Icon(Icons.arrow_right),
//                           onTap: () {},
//                         ))
//                             .toList()
//                             : [
//                           const ListTile(
//                             title: Text('لا توجد فئات فرعية'),
//                             leading: Icon(Icons.info_outline),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           );
//         }),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.grey),
//                 onPressed: () {
//                   _searchController.clear();
//                   controller.clearCourseSearch();
//                 },
//               )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: (value) => controller.searchCourses(value),
//             onChanged: (value) {
//               if (value.isEmpty) {
//                 controller.clearCourseSearch();
//               }
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {
//               Get.to(() => const WalletView());
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         } else if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         } else if (controller.coursesBySearch.isNotEmpty) {
//           // نتائج البحث
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text("Teacher: ${course.teacherName}" +
//                       (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
//                   trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         } else {
//           // العرض الافتراضي للفئات
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Recommended For You',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: controller.categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = controller.categories[idx];
//                       return GestureDetector(
//                         onTap: () => _onCategoryTap(cat), // <-- التعديل هنا
//                         child: Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           elevation: 2,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       cat.name,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     buildStars(cat.rating),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
// lib/View/student_dashboard.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';
//
//
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }
//
// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();
//
//   final Map<String, List<String>> _subCategories = {
//     'طبي': ['تشخيص', 'علاج', 'صيدلة'],
//     'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
//     'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
//   };
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   Widget buildStars(int count) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (i) {
//         return Icon(
//           i < count ? Icons.star : Icons.star_border,
//           size: 16,
//           color: Colors.amber,
//         );
//       }),
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child: Obx(() {
//           final cats = controller.categories;
//           return Column(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cats.length,
//                   itemBuilder: (ctx, idx) {
//                     final cat = cats[idx];
//                     final subList = _subCategories[cat.name] ?? [];
//                     return Theme(
//                       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//                       child: ExpansionTile(
//                         title: Text(
//                           cat.name,
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         trailing: const Icon(Icons.keyboard_arrow_down),
//                         children: subList.isNotEmpty
//                             ? subList
//                             .map((sub) => ListTile(
//                           title: Text(sub),
//                           leading: const Icon(Icons.arrow_right),
//                           onTap: () {},
//                         ))
//                             .toList()
//                             : [
//                           const ListTile(
//                             title: Text('لا توجد فئات فرعية'),
//                             leading: Icon(Icons.info_outline),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           );
//         }),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.grey),
//                 onPressed: () {
//                   _searchController.clear();
//                   controller.clearCourseSearch();
//                 },
//               )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: (value) => controller.searchCourses(value),
//             onChanged: (value) {
//               if (value.isEmpty) {
//                 controller.clearCourseSearch();
//               }
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {
//               Get.to(() => const WalletView());
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         } else if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         } else if (controller.coursesBySearch.isNotEmpty) {
//           // نتائج البحث
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text("Teacher: ${course.teacherName}" +
//                       (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
//                   trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         } else {
//           // العرض الافتراضي للفئات
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Recommended For You',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: controller.categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = controller.categories[idx];
//                       return GestureDetector(
//                         onTap: () {
//
//                         }, // <-- التعديل هنا
//                         child: Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           elevation: 2,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       cat.name,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     buildStars(cat.rating),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';
// // تم إضافة الاستيراد المطلوب
//
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }
//
// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();
//
//   final Map<String, List<String>> _subCategories = {
//     'طبي': ['تشخيص', 'علاج', 'صيدلة'],
//     'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
//     'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
//   };
//
//   // تابع لجلب categoryId بحسب الاسم
//   int? getCategoryIdByName(String name) {
//     switch (name) {
//       case 'طبي':
//         return 3;
//       case 'رياضيات':
//         return 4;
//       case 'كيمياء':
//         return 5;
//       default:
//         return null;
//     }
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   Widget buildStars(int count) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (i) {
//         return Icon(
//           i < count ? Icons.star : Icons.star_border,
//           size: 16,
//           color: Colors.amber,
//         );
//       }),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child: Obx(() {
//           final cats = controller.categories;
//           return Column(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cats.length,
//                   itemBuilder: (ctx, idx) {
//                     final cat = cats[idx];
//                     final subList = _subCategories[cat.name] ?? [];
//                     return Theme(
//                       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//                       child: ExpansionTile(
//                         title: Text(
//                           cat.name,
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         trailing: const Icon(Icons.keyboard_arrow_down),
//                         children: subList.isNotEmpty
//                             ? subList
//                             .map((sub) => ListTile(
//                           title: Text(sub),
//                           leading: const Icon(Icons.arrow_right),
//                           onTap: () {},
//                         ))
//                             .toList()
//                             : [
//                           const ListTile(
//                             title: Text('لا توجد فئات فرعية'),
//                             leading: Icon(Icons.info_outline),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           );
//         }),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.grey),
//                 onPressed: () {
//                   _searchController.clear();
//                   controller.clearCourseSearch();
//                 },
//               )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: (value) => controller.searchCourses(value),
//             onChanged: (value) {
//               if (value.isEmpty) {
//                 controller.clearCourseSearch();
//               }
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {
//               Get.to(() => const WalletView());
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         } else if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         } else if (controller.coursesBySearch.isNotEmpty) {
//           // نتائج البحث
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text("Teacher: ${course.teacherName}" +
//                       (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
//                   trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         } else {
//           // العرض الافتراضي للفئات
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Recommended For You',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: controller.categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = controller.categories[idx];
//                       return GestureDetector(
//                         onTap: () {
//                           final categoryId = getCategoryIdByName(cat.name);
//                           if (categoryId != null) {
//                             Get.to(() => CoursesByCategoryView(
//                               categoryName: cat.name,
//                               categoryId: categoryId,
//                             ));
//                           }
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           elevation: 2,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       cat.name,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     buildStars(cat.rating),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';

// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();

//   final Map<String, List<String>> _subCategories = {
//     'طبي': ['تشخيص', 'علاج', 'صيدلة'],
//     'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
//     'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
//   };

//   int? getCategoryIdByName(String name) {
//     switch (name) {
//       case 'طبي':
//         return 3;
//       case 'رياضيات':
//         return 4;
//       case 'كيمياء':
//         return 5;
//       default:
//         return null;
//     }
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   Widget buildStars(int count) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (i) {
//         return Icon(
//           i < count ? Icons.star : Icons.star_border,
//           size: 16,
//           color: Colors.amber,
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child: SafeArea(
//           child: GetX<DashboardController>(
//             builder: (ctrl) {
//               final cats = ctrl.categories;
//               return Column(
//                 children: [
//                   const DrawerHeader(
//                     decoration: BoxDecoration(color: Colors.lightBlue),
//                     child: Row(
//                       children: [
//                         Icon(Icons.person, size: 40, color: Colors.black),
//                         SizedBox(width: 10),
//                         Text(
//                           'Welcome Amjad',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: cats.length,
//                       itemBuilder: (ctx, idx) {
//                         final cat = cats[idx];
//                         final subList = _subCategories[cat.name] ?? [];
//                         return Theme(
//                           data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//                           child: ExpansionTile(
//                             title: Text(
//                               cat.name,
//                               style: const TextStyle(fontWeight: FontWeight.w600),
//                             ),
//                             trailing: const Icon(Icons.keyboard_arrow_down),
//                             children: subList.isNotEmpty
//                                 ? subList
//                                 .map((sub) => ListTile(
//                               title: Text(sub),
//                               leading: const Icon(Icons.arrow_right),
//                               onTap: () {},
//                             ))
//                                 .toList()
//                                 : [
//                               const ListTile(
//                                 title: Text('لا توجد فئات فرعية'),
//                                 leading: Icon(Icons.info_outline),
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: const Icon(Icons.logout, color: Colors.black),
//                     title: const Text('Logout'),
//                     onTap: controller.logout,
//                   ),
//                   const SizedBox(height: 12),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.grey),
//                 onPressed: () {
//                   _searchController.clear();
//                   controller.clearCourseSearch();
//                 },
//               )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: (value) => controller.searchCourses(value),
//             onChanged: (value) {
//               if (value.isEmpty) {
//                 controller.clearCourseSearch();
//               }
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {
//               Get.to(() => const WalletView());
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         } else if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         } else if (controller.coursesBySearch.isNotEmpty) {
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text("Teacher: ${course.teacherName}" +
//                       (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
//                   trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         } else {
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Recommended For You',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: controller.categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = controller.categories[idx];
//                       return GestureDetector(
//                         onTap: () {
//                           final categoryId = getCategoryIdByName(cat.name);
//                           if (categoryId != null) {
//                             Get.to(() => CoursesByCategoryView(
//                               categoryName: cat.name,
//                               categoryId: categoryId,
//                             ));
//                           }
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           elevation: 2,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       cat.name,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     buildStars(cat.rating),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/category_model.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';

// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();

//   final Map<String, List<String>> _subCategories = {
//     'طبي': ['تشخيص', 'علاج', 'صيدلة'],
//     'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
//     'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
//   };

//   int? getCategoryIdByName(String name) {
//     switch (name) {
//       case 'طبي':
//         return 3;
//       case 'رياضيات':
//         return 4;
//       case 'كيمياء':
//         return 5;
//       default:
//         return null;
//     }
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   Widget buildStars(int count) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(5, (i) {
//         return Icon(
//           i < count ? Icons.star : Icons.star_border,
//           size: 16,
//           color: Colors.amber,
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: Drawer(
//         child: SafeArea(
//           child: GetX<DashboardController>(
//             builder: (ctrl) {
//               final cats = ctrl.categories;
//               return Column(
//                 children: [
//                   const DrawerHeader(
//                     decoration: BoxDecoration(color: Colors.lightBlue),
//                     child: Row(
//                       children: [
//                         Icon(Icons.person, size: 40, color: Colors.black),
//                         SizedBox(width: 10),
//                         Text(
//                           'Welcome Amjad',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: cats.length,
//                       itemBuilder: (ctx, idx) {
//                         final cat = cats[idx];
//                         final subList = _subCategories[cat.name] ?? [];
//                         return Theme(
//                           data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//                           child: ExpansionTile(
//                             title: Text(
//                               cat.name,
//                               style: const TextStyle(fontWeight: FontWeight.w600),
//                             ),
//                             trailing: const Icon(Icons.keyboard_arrow_down),
//                             children: subList.isNotEmpty
//                                 ? subList
//                                     .map((sub) => ListTile(
//                                           title: Text(sub),
//                                           leading: const Icon(Icons.arrow_right),
//                                           onTap: () {},
//                                         ))
//                                     .toList()
//                                 : [
//                                     const ListTile(
//                                       title: Text('لا توجد فئات فرعية'),
//                                       leading: Icon(Icons.info_outline),
//                                     )
//                                   ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: const Icon(Icons.logout, color: Colors.black),
//                     title: const Text('Logout'),
//                     onTap: controller.logout,
//                   ),
//                   const SizedBox(height: 12),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                       icon: const Icon(Icons.clear, color: Colors.grey),
//                       onPressed: () {
//                         _searchController.clear();
//                         controller.clearCourseSearch();
//                       },
//                     )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: (value) => controller.searchCourses(value),
//             onChanged: (value) {
//               if (value.isEmpty) {
//                 controller.clearCourseSearch();
//               }
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {
//               Get.to(() => const WalletView());
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         } else if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         } else if (controller.coursesBySearch.isNotEmpty) {
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: ListTile(
//                   title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   subtitle: Text("Teacher: ${course.teacherName}" +
//                       (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
//                   trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         } else {
//           return Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Recommended For You',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple.shade700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: controller.categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = controller.categories[idx];
//                       return GestureDetector(
//                         onTap: () {
//                           final categoryId = getCategoryIdByName(cat.name);
//                           if (categoryId != null) {
//                             Get.to(() => CoursesByCategoryView(
//                                   categoryName: cat.name,
//                                   categoryId: categoryId,
//                                 ));
//                           }
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           elevation: 2,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       cat.name,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     buildStars(cat.rating),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';

// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<Student_Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());
//   final TextEditingController _searchController = TextEditingController();

//   // تحويل الاسم إلى id كما هو عندك
//   int? getCategoryIdByName(String name) {
//     switch (name) {
//       case 'طبي':
//         return 3;
//       case 'رياضيات':
//         return 4;
//       case 'كيمياء':
//         return 5;
//       default:
//         return null;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // حتى يتحدّث الـsuffixIcon عند الكتابة/المسح
//     _searchController.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // <<< Drawer بدون GetX لأنه لا يراقب أي Rx هنا >>>
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),

//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(),
//           ),
//         ),
//         title: Container(
//           height: 40,
//           margin: const EdgeInsets.only(right: 8),
//           child: TextField(
//             controller: _searchController,
//             textDirection: TextDirection.rtl,
//             style: const TextStyle(color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey),
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                       icon: const Icon(Icons.clear, color: Colors.grey),
//                       onPressed: () {
//                         _searchController.clear();
//                         controller.clearCourseSearch();
//                       },
//                     )
//                   : null,
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onSubmitted: controller.searchCourses,
//             onChanged: (value) {
//               if (value.isEmpty) controller.clearCourseSearch();
//             },
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () => Get.to(() => const WalletView()),
//           ),
//         ],
//       ),

//       // body: لفّ الأجزاء المتغيرة فقط بـ Obx
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         }

//         if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         }

//         // نتائج البحث
//         if (controller.coursesBySearch.isNotEmpty) {
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: controller.coursesBySearch.length,
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];
//               return Container(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: const [BoxShadow(blurRadius: 4, spreadRadius: 0.5, offset: Offset(0, 1), color: Colors.black12)],
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     course.courseName,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     'Teacher: ${course.teacherName}'
//                     '${course.categoryName != null ? " | Category: ${course.categoryName}" : ""}',
//                   ),
//                   trailing: Text('${course.price} S.P', style: const TextStyle(color: Colors.green)),
//                 ),
//               );
//             },
//           );
//         }

//         // الشبكة الافتراضية للفئات
//         return Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Center(
//                   child: Text(
//                     'Recommended For You',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple.shade700,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Obx(() {
//                   // هذا الـObx يراقب فقط categories
//                   final categories = controller.categories;
//                   return GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 3 / 4,
//                     ),
//                     itemCount: categories.length,
//                     itemBuilder: (ctx, idx) {
//                       final cat = categories[idx];
//                       return GestureDetector(
//                         onTap: () {
//                           final categoryId = getCategoryIdByName(cat.name);
//                           if (categoryId != null) {
//                             Get.to(() => CoursesByCategoryView(
//                                   categoryName: cat.name,
//                                   categoryId: categoryId,
//                                 ));
//                           }
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: const [BoxShadow(blurRadius: 4, spreadRadius: 0.5, offset: Offset(0, 1), color: Colors.black12)],
//                           ),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(cat.assetPath, fit: BoxFit.fill),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   cat.name,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// استيراد الحزم اللازمة للواجهة وإدارة الحالة والتنقّل
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';

// // تعريف ويدجت Stateful بإسم Student_Dashboard (شاشة الطالب الرئيسية)
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }

// // الحالة الخاصة بشاشة Student_Dashboard
// class _StudentDashboardState extends State<Student_Dashboard> {
//   // إنشاء وربط DashboardController عبر GetX (لإدارة البيانات والحالة)
//   final DashboardController controller = Get.put(DashboardController());
//   // متحكم لحقل البحث لقراءة/تعديل النص وبرمجته
//   final TextEditingController _searchController = TextEditingController();

//   // دالة مساعدة: تحويل اسم الفئة إلى معرّف categoryId (حسب القيم المعتمدة عندك)
//   int? getCategoryIdByName(String name) {
//     switch (name) {
//       case 'طبي':
//         return 3;
//       case 'رياضيات':
//         return 4;
//       case 'كيمياء':
//         return 5;
//       default:
//         return null; // إن لم تُطابق أي فئة
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // مستمع لتحديث حالة الواجهة كلما تغيّر نص البحث (مفيد لإظهار/إخفاء زر الحذف في suffixIcon)
//     _searchController.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     // تنظيف المتحكم عند التخلص من الودجت لتفادي التسريبات
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // هيكل الشاشة الأساسي
//     return Scaffold(
//       backgroundColor: Colors.white, // لون خلفية الشاشة

//       // قائمة جانبية Drawer (ثابتة هنا ولا تعتمد على Rx مباشرة)
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             children: [
//               // رأس القائمة الجانبية (صورة/نص ترحيبي)
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(), // فاصل بصري
//               // خيار تسجيل الخروج يستدعي دالة logout من الكنترولر
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),

//       // شريط التطبيق العلوي AppBar
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300, // لون الخلفية
//         elevation: 1,                          // ظل بسيط
//         // زر فتح القائمة الجانبية (يحتاج Builder للوصول إلى Scaffold.of)
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(), // فتح الـ Drawer
//           ),
//         ),
//         // مربع البحث كعنوان للـ AppBar
//         title: Container(
//           height: 40, // ارتفاع الحقل
//           margin: const EdgeInsets.only(right: 8), // هامش يمين بسيط
//           child: TextField(
//             controller: _searchController,           // ربط المتحكم بالحقل
//             textDirection: TextDirection.rtl,        // اتجاه النص (يميني)
//             style: const TextStyle(color: Colors.black), // تنسيق النص
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',          // نص مساعد
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey), // أيقونة بحث
//               // زر مسح يظهر فقط إذا النص غير فارغ
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                       icon: const Icon(Icons.clear, color: Colors.grey),
//                       onPressed: () {
//                         _searchController.clear();      // تفريغ الحقل
//                         controller.clearCourseSearch(); // إعادة الحالة الأصلية للنتائج
//                       },
//                     )
//                   : null,
//               filled: true,                      // خلفية ملوّنة
//               fillColor: Colors.white,           // لون الخلفية
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16), // حشوة داخلية
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20), // حواف دائرية
//                 borderSide: BorderSide.none,             // بدون حدود ظاهرة
//               ),
//             ),
//             onSubmitted: controller.searchCourses, // عند الضغط Enter: ابحث مباشرة
//             onChanged: (value) {
//               // عند حذف كامل النص: امسح نتائج البحث وأعد الفئات
//               if (value.isEmpty) controller.clearCourseSearch();
//             },
//           ),
//         ),
//         centerTitle: true, // توسيط العنوان (مربع البحث)
//         actions: [
//           // زر الذهاب لمحفظة المستخدم
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () => Get.to(() => const WalletView()),
//           ),
//         ],
//       ),

//       // الجسم الرئيسي للشاشة: يراقب حالات الكنترولر عبر Obx
//       body: Obx(() {
//         // حالة التحميل العامة (شريط تقدّم خطّي)
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         }

//         // لا توجد نتائج (بحث/جلب)
//         if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         }

//         // في حال وجود نتائج بحث: عرض قائمة الكورسات المطابقة
//         if (controller.coursesBySearch.isNotEmpty) {
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),                     // حواف حول القائمة
//             itemCount: controller.coursesBySearch.length,          // عدد العناصر
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];        // عنصر الكورس الحالي
//               return Container(
//                 margin: const EdgeInsets.only(bottom: 12),         // مسافة أسفل كل عنصر
//                 padding: const EdgeInsets.all(12),                 // حشوة داخلية
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),         // حواف دائرية للكارد
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 4, spreadRadius: 0.5, offset: Offset(0, 1), color: Colors.black12
//                     )
//                   ],
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     course.courseName,                             // اسم الكورس
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     // اسم المدرّس + الفئة (إن وُجدت)
//                     'Teacher: ${course.teacherName}'
//                     '${course.categoryName != null ? " | Category: ${course.categoryName}" : ""}',
//                   ),
//                   trailing: Text(                                   // السعر في يمين العنصر
//                     '${course.price} S.P',
//                     style: const TextStyle(color: Colors.green),
//                   ),
//                 ),
//               );
//             },
//           );
//         }

//         // في حال عدم وجود بحث: عرض شبكة الفئات (Recommended)
//         return Padding(
//           padding: const EdgeInsets.all(12.0), // حواف عامة
//           child: Column(
//             children: [
//               // عنوان القسم
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Center(
//                   child: Text(
//                     'Recommended For You',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple.shade700,
//                     ),
//                   ),
//                 ),
//               ),
//               // شبكة الفئات (تتمدّد لملء المساحة)
//               Expanded(
//                 child: Obx(() {
//                   // مراقبة قائمة الفئات فقط داخل هذا الجزء
//                   final categories = controller.categories;
//                   return GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,        // عمودان
//                       crossAxisSpacing: 12,     // مسافة أفقية بين العناصر
//                       mainAxisSpacing: 12,      // مسافة عمودية بين العناصر
//                       childAspectRatio: 3 / 4,  // نسبة العرض إلى الارتفاع للكارد
//                     ),
//                     itemCount: categories.length, // عدد الفئات
//                     itemBuilder: (ctx, idx) {
//                       final cat = categories[idx]; // الفئة الحالية
//                       return GestureDetector(
//                         // عند الضغط على الفئة: الذهاب لصفحة كورسات الفئة
//                         onTap: () {
//                           final categoryId = getCategoryIdByName(cat.name); // تحويل الاسم إلى id
//                           if (categoryId != null) {
//                             Get.to(() => CoursesByCategoryView(
//                                   categoryName: cat.name,  // تمرير اسم الفئة
//                                   categoryId: categoryId,  // تمرير id الفئة
//                                 ));
//                           }
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12), // حواف دائرية
//                             boxShadow: const [
//                               BoxShadow(
//                                 blurRadius: 4, spreadRadius: 0.5, offset: Offset(0, 1), color: Colors.black12
//                               )
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               // صورة الفئة (مأخوذة من المسار assetPath في الموديل)
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(
//                                     cat.assetPath,
//                                     fit: BoxFit.fill, // تغطية المساحة المتاحة
//                                   ),
//                                 ),
//                               ),
//                               // اسم الفئة أسفل الصورة
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   cat.name,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/View/Courses_list.dart';
// import 'package:project_2/View/wallet_view.dart';

// // تعريف ويدجت Stateful بإسم Student_Dashboard (شاشة الطالب الرئيسية)
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Student_Dashboard> createState() => _StudentDashboardState();
// }

// // الحالة الخاصة بشاشة Student_Dashboard
// class _StudentDashboardState extends State<Student_Dashboard> {
//   // إنشاء وربط DashboardController عبر GetX (لإدارة البيانات والحالة)
//   final DashboardController controller = Get.put(DashboardController());
//   // متحكم لحقل البحث لقراءة/تعديل النص وبرمجته
//   final TextEditingController _searchController = TextEditingController();

//   // دالة مساعدة: تحويل اسم الفئة إلى معرّف categoryId (حسب القيم المعتمدة عندك)
//   int? getCategoryIdByName(String name) {
//     switch (name) {
//       case 'طبي':
//         return 3;
//       case 'رياضيات':
//         return 4;
//       case 'كيمياء':
//         return 5;
//       default:
//         return null; // إن لم تُطابق أي فئة
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // مستمع لتحديث حالة الواجهة كلما تغيّر نص البحث (مفيد لإظهار/إخفاء زر الحذف في suffixIcon)
//     _searchController.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     // تنظيف المتحكم عند التخلص من الودجت لتفادي التسريبات
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // هيكل الشاشة الأساسي
//     return Scaffold(
//       backgroundColor: Colors.white, // لون خلفية الشاشة

//       // قائمة جانبية Drawer (ثابتة هنا ولا تعتمد على Rx مباشرة)
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             children: [
//               // رأس القائمة الجانبية (صورة/نص ترحيبي)
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person, size: 40, color: Colors.black),
//                     SizedBox(width: 10),
//                     Text(
//                       'Welcome Amjad',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(), // فاصل بصري
//               // خيار تسجيل الخروج يستدعي دالة logout من الكنترولر
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.black),
//                 title: const Text('Logout'),
//                 onTap: controller.logout,
//               ),
//               const SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),

//       // شريط التطبيق العلوي AppBar
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade300, // لون الخلفية
//         elevation: 1,                          // ظل بسيط
//         // زر فتح القائمة الجانبية (يحتاج Builder للوصول إلى Scaffold.of)
//         leading: Builder(
//           builder: (ctx) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(ctx).openDrawer(), // فتح الـ Drawer
//           ),
//         ),
//         // مربع البحث كعنوان للـ AppBar
//         title: Container(
//           height: 40, // ارتفاع الحقل
//           margin: const EdgeInsets.only(right: 8), // هامش يمين بسيط
//           child: TextField(
//             controller: _searchController,           // ربط المتحكم بالحقل
//             textDirection: TextDirection.rtl,        // اتجاه النص (يميني)
//             style: const TextStyle(color: Colors.black), // تنسيق النص
//             decoration: InputDecoration(
//               hintText: 'Search For Any Courses',          // نص مساعد
//               hintStyle: const TextStyle(color: Colors.grey),
//               prefixIcon: const Icon(Icons.search, color: Colors.grey), // أيقونة بحث
//               // زر مسح يظهر فقط إذا النص غير فارغ
//               suffixIcon: _searchController.text.isNotEmpty
//                   ? IconButton(
//                       icon: const Icon(Icons.clear, color: Colors.grey),
//                       onPressed: () {
//                         _searchController.clear();      // تفريغ الحقل
//                         controller.clearCourseSearch(); // إعادة الحالة الأصلية للنتائج
//                       },
//                     )
//                   : null,
//               filled: true,                      // خلفية ملوّنة
//               fillColor: Colors.white,           // لون الخلفية
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16), // حشوة داخلية
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20), // حواف دائرية
//                 borderSide: BorderSide.none,             // بدون حدود ظاهرة
//               ),
//             ),
//             onSubmitted: controller.searchCourses, // عند الضغط Enter: ابحث مباشرة
//             onChanged: (value) {
//               // عند حذف كامل النص: امسح نتائج البحث وأعد الفئات
//               if (value.isEmpty) controller.clearCourseSearch();
//             },
//           ),
//         ),
//         centerTitle: true, // توسيط العنوان (مربع البحث)
//         actions: [
//           // ✅ زر المدرّسين الجديد: يفتح شاشة TeachersView
//           IconButton(
//             tooltip: 'Teachers',
//             icon: const Icon(Icons.school_outlined, color: Colors.black),
//             onPressed: () async {
//               await controller.fetchTeachers();
//               Get.to(() => const TeachersView());
//             },
//           ),
//           // زر الذهاب لمحفظة المستخدم
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () => Get.to(() => const WalletView()),
//           ),
//         ],
//       ),

//       // الجسم الرئيسي للشاشة: يراقب حالات الكنترولر عبر Obx
//       body: Obx(() {
//         // حالة التحميل العامة (شريط تقدّم خطّي)
//         if (controller.isLoading.value) {
//           return const Center(child: LinearProgressIndicator());
//         }

//         // لا توجد نتائج (بحث/جلب)
//         if (controller.noResults.value) {
//           return const Center(
//             child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
//           );
//         }

//         // في حال وجود نتائج بحث: عرض قائمة الكورسات المطابقة
//         if (controller.coursesBySearch.isNotEmpty) {
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),                     // حواف حول القائمة
//             itemCount: controller.coursesBySearch.length,          // عدد العناصر
//             itemBuilder: (ctx, i) {
//               final course = controller.coursesBySearch[i];        // عنصر الكورس الحالي
//               return Container(
//                 margin: const EdgeInsets.only(bottom: 12),         // مسافة أسفل كل عنصر
//                 padding: const EdgeInsets.all(12),                 // حشوة داخلية
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),         // حواف دائرية للكارد
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 4, spreadRadius: 0.5, offset: Offset(0, 1), color: Colors.black12
//                     )
//                   ],
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     course.courseName,                             // اسم الكورس
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(
//                     // اسم المدرّس + الفئة (إن وُجدت)
//                     'Teacher: ${course.teacherName}'
//                     '${course.categoryName != null ? " | Category: ${course.categoryName}" : ""}',
//                   ),
//                   trailing: Text(                                   // السعر في يمين العنصر
//                     '${course.price} S.P',
//                     style: const TextStyle(color: Colors.green),
//                   ),
//                 ),
//               );
//             },
//           );
//         }

//         // في حال عدم وجود بحث: عرض شبكة الفئات (Recommended)
//         return Padding(
//           padding: const EdgeInsets.all(12.0), // حواف عامة
//           child: Column(
//             children: [
//               // عنوان القسم
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Center(
//                   child: Text(
//                     'Recommended For You',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple.shade700,
//                     ),
//                   ),
//                 ),
//               ),
//               // شبكة الفئات (تتمدّد لملء المساحة)
//               Expanded(
//                 child: Obx(() {
//                   // مراقبة قائمة الفئات فقط داخل هذا الجزء
//                   final categories = controller.categories;
//                   return GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,        // عمودان
//                       crossAxisSpacing: 12,     // مسافة أفقية بين العناصر
//                       mainAxisSpacing: 12,      // مسافة عمودية بين العناصر
//                       childAspectRatio: 3 / 4,  // نسبة العرض إلى الارتفاع للكارد
//                     ),
//                     itemCount: categories.length, // عدد الفئات
//                     itemBuilder: (ctx, idx) {
//                       final cat = categories[idx]; // الفئة الحالية
//                       return GestureDetector(
//                         // عند الضغط على الفئة: الذهاب لصفحة كورسات الفئة
//                         onTap: () {
//                           final categoryId = getCategoryIdByName(cat.name); // تحويل الاسم إلى id
//                           if (categoryId != null) {
//                             Get.to(() => CoursesByCategoryView(
//                                   categoryName: cat.name,  // تمرير اسم الفئة
//                                   categoryId: categoryId,  // تمرير id الفئة
//                                 ));
//                           }
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12), // حواف دائرية
//                             boxShadow: const [
//                               BoxShadow(
//                                 blurRadius: 4, spreadRadius: 0.5, offset: Offset(0, 1), color: Colors.black12
//                               )
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               // صورة الفئة (مأخوذة من المسار assetPath في الموديل)
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                                   child: Image.asset(
//                                     cat.assetPath,
//                                     fit: BoxFit.fill, // تغطية المساحة المتاحة
//                                   ),
//                                 ),
//                               ),
//                               // اسم الفئة أسفل الصورة
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   cat.name,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// /// ===============================
// /// شاشة عرض المدرّسين TeachersView
// /// ===============================
// class TeachersView extends StatelessWidget {
//   const TeachersView({Key? key}) : super(key: key);

//   Color _statusColor(String s) {
//     switch (s.toLowerCase()) {
//       case 'active':
//         return Colors.green.shade600;
//       case 'pending':
//         return Colors.orange.shade700;
//       case 'blocked':
//       case 'inactive':
//         return Colors.red.shade600;
//       default:
//         return Colors.blueGrey;
//     }
//   }

//   IconData _genderIcon(String g) {
//     switch (g.toLowerCase()) {
//       case 'male':
//         return Icons.male;
//       case 'female':
//         return Icons.female;
//       default:
//         return Icons.person_outline;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<DashboardController>();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Teachers'),
//         backgroundColor: Colors.blue.shade300,
//         actions: [
//           IconButton(
//             tooltip: 'Refresh',
//             icon: const Icon(Icons.refresh),
//             onPressed: () => controller.fetchTeachers(),
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.teachersLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (controller.teachersError.value.isNotEmpty) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 controller.teachersError.value,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             ),
//           );
//         }
//         final list = controller.teachers;
//         if (list.isEmpty) {
//           return const Center(child: Text('لا يوجد مدرّسون متاحون حالياً'));
//         }

//         return ListView.builder(
//           padding: const EdgeInsets.all(12),
//           itemCount: list.length,
//           itemBuilder: (ctx, i) {
//             final t = list[i];
//             return Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               margin: const EdgeInsets.only(bottom: 12),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 28,
//                       backgroundColor: Colors.blue.shade50,
//                       child: Icon(_genderIcon(t.gender), color: Colors.blue.shade700, size: 28),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // الاسم + الشيب الخاصة بالحالة
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   t.name.isNotEmpty ? t.name : '${t.firstName} ${t.lastName}'.trim(),
//                                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: _statusColor(t.status).withOpacity(.12),
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(color: _statusColor(t.status).withOpacity(.5)),
//                                 ),
//                                 child: Text(
//                                   t.status,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w600,
//                                     color: _statusColor(t.status),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           // التخصص
//                           if (t.specialization.isNotEmpty)
//                             Row(
//                               children: [
//                                 const Icon(Icons.badge_outlined, size: 18, color: Colors.black54),
//                                 const SizedBox(width: 6),
//                                 Expanded(child: Text(t.specialization)),
//                               ],
//                             ),
//                           const SizedBox(height: 4),
//                           // البلد/المدينة
//                           Row(
//                             children: [
//                               const Icon(Icons.location_on_outlined, size: 18, color: Colors.black54),
//                               const SizedBox(width: 6),
//                               Expanded(child: Text('${t.country} - ${t.city}'.trim())),
//                             ],
//                           ),
//                           const SizedBox(height: 4),
//                           // البريد والهاتف
//                           Row(
//                             children: [
//                               const Icon(Icons.email_outlined, size: 18, color: Colors.black54),
//                               const SizedBox(width: 6),
//                               Expanded(child: Text(t.email)),
//                             ],
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             children: [
//                               const Icon(Icons.phone_outlined, size: 18, color: Colors.black54),
//                               const SizedBox(width: 6),
//                               Expanded(child: Text(t.phone)),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           // الخبرات السابقة
//                           if (t.previousExperiences.isNotEmpty)
//                             Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade100,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Icon(Icons.history_edu_outlined, size: 18, color: Colors.black54),
//                                   const SizedBox(width: 6),
//                                   Expanded(
//                                     child: Text(
//                                       t.previousExperiences,
//                                       style: const TextStyle(height: 1.3),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

import 'dart:io'; // قد تحتاجه للتعامل مع نظام الملفات/المنصّة (موجود هنا كما في كودك)
import 'package:flutter/material.dart'; // عناصر واجهة Flutter
import 'package:get/get.dart'; // GetX لإدارة الحالة والتنقل
import 'package:project_2/Controller/dashboard_controller.dart'; // الكنترولر (إن احتجته في هذه الشاشة)
import 'package:project_2/View/Courses_list.dart'; // (موجود في كودك)
import 'package:project_2/View/teachers.dart';
import 'package:project_2/View/wallet_view.dart'; // شاشة المحفظة
// ★ إضافة: شاشة الأساتذة

// تعريف ويدجت Stateful بإسم Student_Dashboard (شاشة الطالب الرئيسية)
class Student_Dashboard extends StatefulWidget {
  const Student_Dashboard({Key? key}) : super(key: key);

  @override
  State<Student_Dashboard> createState() => _StudentDashboardState();
}

// الحالة الخاصة بشاشة Student_Dashboard
class _StudentDashboardState extends State<Student_Dashboard> {
  // إنشاء وربط DashboardController عبر GetX (لإدارة البيانات والحالة)
  final DashboardController controller = Get.put(DashboardController());
  // متحكم لحقل البحث لقراءة/تعديل النص وبرمجته
  final TextEditingController _searchController = TextEditingController();

  // دالة مساعدة: تحويل اسم الفئة إلى معرّف categoryId (حسب القيم المعتمدة عندك)
  int? getCategoryIdByName(String name) {
    switch (name) {
      case 'طبي':
        return 3;
      case 'رياضيات':
        return 4;
      case 'كيمياء':
        return 5;
      default:
        return null; // إن لم تُطابق أي فئة
    }
  }

  @override
  void initState() {
    super.initState();
    // مستمع لتحديث حالة الواجهة كلما تغيّر نص البحث (مفيد لإظهار/إخفاء زر الحذف في suffixIcon)
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // تنظيف المتحكم عند التخلص من الودجت لتفادي التسريبات
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // هيكل الشاشة الأساسي
    return Scaffold(
      backgroundColor: Colors.white, // لون خلفية الشاشة

      // قائمة جانبية Drawer (ثابتة هنا ولا تعتمد على Rx مباشرة)
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              // رأس القائمة الجانبية (صورة/نص ترحيبي)
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 40, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Welcome Amjad',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(), // فاصل بصري
              // خيار تسجيل الخروج يستدعي دالة logout من الكنترولر
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text('Logout'),
                onTap: controller.logout,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),

      // شريط التطبيق العلوي AppBar
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300, // لون الخلفية
        elevation: 1, // ظل بسيط
        // زر فتح القائمة الجانبية (يحتاج Builder للوصول إلى Scaffold.of)
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(ctx).openDrawer(), // فتح الـ Drawer
          ),
        ),
        // مربع البحث كعنوان للـ AppBar
        title: Container(
          height: 40, // ارتفاع الحقل
          margin: const EdgeInsets.only(right: 8), // هامش يمين بسيط
          child: TextField(
            controller: _searchController, // ربط المتحكم بالحقل
            textDirection: TextDirection.rtl, // اتجاه النص (يميني)
            style: const TextStyle(color: Colors.black), // تنسيق النص
            decoration: InputDecoration(
              hintText: 'Search For Any Courses or Categories', // نص مساعد
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon:
                  const Icon(Icons.search, color: Colors.grey), // أيقونة بحث
              // زر مسح يظهر فقط إذا النص غير فارغ
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear(); // تفريغ الحقل
                        controller
                            .clearCourseSearch(); // إعادة الحالة الأصلية للنتائج
                      },
                    )
                  : null,
              filled: true, // خلفية ملوّنة
              fillColor: Colors.white, // لون الخلفية
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 16), // حشوة داخلية
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), // حواف دائرية
                borderSide: BorderSide.none, // بدون حدود ظاهرة
              ),
            ),
            onSubmitted:
                controller.searchCourses, // عند الضغط Enter: ابحث مباشرة
            onChanged: (value) {
              // عند حذف كامل النص: امسح نتائج البحث وأعد الفئات
              if (value.isEmpty) controller.clearCourseSearch();
            },
          ),
        ),
        centerTitle: true, // توسيط العنوان (مربع البحث)
        actions: [
          // ★ زر الذهاب لواجهة الأساتذة (بحث/عرض الأساتذة)
          IconButton(
            tooltip: 'Teachers',
            icon: const Icon(Icons.school_outlined, color: Colors.black),
            onPressed: () => Get.to(() => const TeachersView()),
          ),
          // زر الذهاب لمحفظة المستخدم
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined,
                color: Colors.black),
            onPressed: () => Get.to(() => const WalletView()),
          ),
        ],
      ),

      // الجسم الرئيسي للشاشة: يراقب حالات الكنترولر عبر Obx
      body: Obx(() {
        // حالة التحميل العامة (شريط تقدّم خطّي)
        if (controller.isLoading.value) {
          return const Center(child: LinearProgressIndicator());
        }

        // لا توجد نتائج (بحث/جلب)
        if (controller.noResults.value) {
          return const Center(
            child: Text('Not found',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          );
        }

        // في حال وجود نتائج بحث: عرض قائمة الكورسات المطابقة
        if (controller.coursesBySearch.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(16), // حواف حول القائمة
            itemCount: controller.coursesBySearch.length, // عدد العناصر
            itemBuilder: (ctx, i) {
              final course =
                  controller.coursesBySearch[i]; // عنصر الكورس الحالي
              return Container(
                margin: const EdgeInsets.only(bottom: 12), // مسافة أسفل كل عنصر
                padding: const EdgeInsets.all(12), // حشوة داخلية
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12), // حواف دائرية للكارد
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0.5,
                        offset: Offset(0, 1),
                        color: Colors.black12)
                  ],
                ),
                // child: ListTile(
                //   title: Text(
                //     course.courseName,                             // اسم الكورس
                //     style: const TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   subtitle: Text(
                //     // اسم المدرّس + الفئة (إن وُجدت)
                //     'Teacher: ${course.teacherName}'
                //     '${course.categoryName != null ? " | Category: ${course.categoryName}" : ""}',
                //   ),
                //   trailing: Text(                                   // السعر في يمين العنصر
                //     '${course.price} S.P',
                //     style: const TextStyle(color: Colors.green),
                //   ),
                // ),
                child: ListTile(
                  leading: CircleAvatar(
                    // صورة/رمز دائري ببداية العنصر
                    backgroundColor: Colors.blue.shade50,
                    child: Icon(Icons.menu_book, color: Colors.blue.shade700),
                  ),
                  title: Text(
                    course.courseName, // اسم الكورس
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            course.teacherName,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      if (course.categoryName != null)
                        Row(
                          children: [
                            const Icon(Icons.category,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              course.categoryName!,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.green),
                      const SizedBox(height: 4),
                      Text(
                        '${course.price} S.P',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          );
        }

        // في حال عدم وجود بحث: عرض شبكة الفئات (Recommended)
        return Padding(
          padding: const EdgeInsets.all(12.0), // حواف عامة
          child: Column(
            children: [
              // عنوان القسم
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    'Recommended For You',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                ),
              ),
              // شبكة الفئات (تتمدّد لملء المساحة)
              Expanded(
                child: Obx(() {
                  // مراقبة قائمة الفئات فقط داخل هذا الجزء
                  final categories = controller.categories;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // عمودان
                      crossAxisSpacing: 12, // مسافة أفقية بين العناصر
                      mainAxisSpacing: 12, // مسافة عمودية بين العناصر
                      childAspectRatio: 3 / 4, // نسبة العرض إلى الارتفاع للكارد
                    ),
                    itemCount: categories.length, // عدد الفئات
                    itemBuilder: (ctx, idx) {
                      final cat = categories[idx]; // الفئة الحالية
                      return GestureDetector(
                        // عند الضغط على الفئة: الذهاب لصفحة كورسات الفئة
                        onTap: () {
                          final categoryId = getCategoryIdByName(
                              cat.name); // تحويل الاسم إلى id
                          if (categoryId != null) {
                            Get.to(() => CoursesByCategoryView(
                                  categoryName: cat.name, // تمرير اسم الفئة
                                  categoryId: categoryId, // تمرير id الفئة
                                ));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(12), // حواف دائرية
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0.5,
                                  offset: Offset(0, 1),
                                  color: Colors.black12)
                            ],
                          ),
                          child: Column(
                            children: [
                              // صورة الفئة (مأخوذة من المسار assetPath في الموديل)
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.asset(
                                    cat.assetPath,
                                    fit: BoxFit.fill, // تغطية المساحة المتاحة
                                  ),
                                ),
                              ),
                              // اسم الفئة أسفل الصورة
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  cat.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
