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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/dashboard_controller.dart';
import 'package:project_2/Model/category_model.dart';
import 'package:project_2/View/Courses_list.dart';
import 'package:project_2/View/wallet_view.dart';
// تم إضافة الاستيراد المطلوب

class Student_Dashboard extends StatefulWidget {
  const Student_Dashboard({Key? key}) : super(key: key);

  @override
  State<Student_Dashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<Student_Dashboard> {
  final DashboardController controller = Get.put(DashboardController());
  final TextEditingController _searchController = TextEditingController();

  final Map<String, List<String>> _subCategories = {
    'طبي': ['تشخيص', 'علاج', 'صيدلة'],
    'رياضيات': ['جبر', 'هندسة', 'إحصاء'],
    'كيمياء': ['عضوية', 'غير عضوية', 'تحليلية'],
  };

  // تابع لجلب categoryId بحسب الاسم
  int? getCategoryIdByName(String name) {
    switch (name) {
      case 'طبي':
        return 3;
      case 'رياضيات':
        return 4;
      case 'كيمياء':
        return 5;
      default:
        return null;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget buildStars(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        return Icon(
          i < count ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.amber,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Obx(() {
          final cats = controller.categories;
          return Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 40, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Welcome Amjad',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (ctx, idx) {
                    final cat = cats[idx];
                    final subList = _subCategories[cat.name] ?? [];
                    return Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text(
                          cat.name,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_down),
                        children: subList.isNotEmpty
                            ? subList
                            .map((sub) => ListTile(
                          title: Text(sub),
                          leading: const Icon(Icons.arrow_right),
                          onTap: () {},
                        ))
                            .toList()
                            : [
                          const ListTile(
                            title: Text('لا توجد فئات فرعية'),
                            leading: Icon(Icons.info_outline),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text('Logout'),
                onTap: controller.logout,
              ),
              const SizedBox(height: 12),
            ],
          );
        }),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        elevation: 1,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
        title: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 8),
          child: TextField(
            controller: _searchController,
            textDirection: TextDirection.rtl,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Search For Any Courses',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  _searchController.clear();
                  controller.clearCourseSearch();
                },
              )
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            onSubmitted: (value) => controller.searchCourses(value),
            onChanged: (value) {
              if (value.isEmpty) {
                controller.clearCourseSearch();
              }
            },
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
            onPressed: () {
              Get.to(() => const WalletView());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LinearProgressIndicator());
        } else if (controller.noResults.value) {
          return const Center(
            child: Text('Not found', style: TextStyle(fontSize: 18, color: Colors.grey)),
          );
        } else if (controller.coursesBySearch.isNotEmpty) {
          // نتائج البحث
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.coursesBySearch.length,
            itemBuilder: (ctx, i) {
              final course = controller.coursesBySearch[i];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Teacher: ${course.teacherName}" +
                      (course.categoryName != null ? " | Category: ${course.categoryName}" : "")),
                  trailing: Text("${course.price} S.P", style: const TextStyle(color: Colors.green)),
                ),
              );
            },
          );
        } else {
          // العرض الافتراضي للفئات
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (ctx, idx) {
                      final cat = controller.categories[idx];
                      return GestureDetector(
                        onTap: () {
                          final categoryId = getCategoryIdByName(cat.name);
                          if (categoryId != null) {
                            Get.to(() => CoursesByCategoryView(
                              categoryName: cat.name,
                              categoryId: categoryId,
                            ));
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.asset(cat.assetPath, fit: BoxFit.fill),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      cat.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    buildStars(cat.rating),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
