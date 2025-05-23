// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:project_2/View/Show_Profile_student.dart';
//
// // class Student_Dashboard extends StatefulWidget {
// //   const Student_Dashboard({Key? key}) : super(key: key);
//
// //   @override
// //   State<Student_Dashboard> createState() => _Student_DashboardState();
// // }
//
// // class _Student_DashboardState extends State<Student_Dashboard> {
// //   // الأقسام الرئيسية
// //   final List<String> categories = [
// //     'Development',
// //     'Business',
// //     'IT & Software',
// //     'Design',
// //     'Marketing',
// //     'Music',
// //   ];
//
// //   // التصنيفات الفرعية لكل قسم
// //   final Map<String, List<String>> subCategories = {
// //     'Development': ['Frontend Flutter', 'Backend Laravel', 'Fullstack Web'],
// //     'Business': ['Entrepreneurship', 'Management', 'Sales'],
// //     'IT & Software': ['Cybersecurity', 'Cloud Computing', 'DevOps'],
// //     'Design': ['UI/UX', 'Graphic Design', '3D Modeling'],
// //     'Marketing': ['Digital Marketing', 'SEO', 'Content Strategy'],
// //     'Music': ['Guitar', 'Piano', 'Music Production'],
// //   };
//
// //   // الحالة الحالية للـ hover
// //   String? hoveredCategory;
// //   String? hoveredSubCategory;
// //   bool isHoveringSubList = false;
//
// //   void _onMainEnter(String cat) {
// //     setState(() {
// //       hoveredCategory = cat;
// //       hoveredSubCategory = null;
// //       isHoveringSubList = false;
// //     });
// //   }
//
// //   void _onMainExit() {
// //     Future.delayed(const Duration(milliseconds: 50), () {
// //       if (!isHoveringSubList) {
// //         setState(() {
// //           hoveredCategory = null;
// //           hoveredSubCategory = null;
// //         });
// //       }
// //     });
// //   }
//
// //   void _onSubListEnter() {
// //     setState(() => isHoveringSubList = true);
// //   }
//
// //   void _onSubListExit() {
// //     setState(() {
// //       isHoveringSubList = false;
// //       hoveredCategory = null;
// //       hoveredSubCategory = null;
// //     });
// //   }
//
// //   void _onSubEnter(String sub) {
// //     setState(() => hoveredSubCategory = sub);
// //   }
//
// //   void _onSubExit() {
// //     setState(() => hoveredSubCategory = null);
// //   }
//
// //   void _onSubTap(String sub) {
// //     // هنا معالجة الضغط على التصنيف الفرعي
// //     print('Tapped on sub-category: $sub');
// //     // مثال: يمكنك التنقل إلى صفحة أخرى أو تحديث المحتوى
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         title: Container(
// //           height: 40,
// //           padding: const EdgeInsets.symmetric(horizontal: 12),
// //           decoration: BoxDecoration(
// //             color: Colors.grey.shade200,
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //           child: Row(
// //             children: const [
// //               Icon(Icons.search, color: Colors.grey),
// //               SizedBox(width: 8),
// //               Expanded(
// //                 child: TextField(
// //                   decoration: InputDecoration(
// //                     hintText:
// //                         'Find your next course by skill, topic, or instructor',
// //                     border: InputBorder.none,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         actions: [
// //           IconButton(
// //               onPressed: () {}, icon: const Icon(Icons.wallet, color: Colors.black)),
// //           IconButton(
// //               onPressed: () {},
// //               icon:
// //                   const Icon(Icons.shopping_cart_outlined, color: Colors.black)),
// //           GestureDetector(
// //               onTap: () => Get.to(ShowProfile()),
// //               child: const CircleAvatar(child: Text("AA"))),
// //           const SizedBox(width: 10),
// //         ],
// //       ),
// //       body: ListView(
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //         children: [
// //           // مرحباً بالمستخدم
// //           Row(
// //             children: const [
// //               CircleAvatar(radius: 24, child: Text("AA")),
// //               SizedBox(width: 12),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text("Welcome, Amjad",
// //                       style:
// //                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                   Text("Android Developer"),
// //                 ],
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 12),
// //           Align(
// //             alignment: Alignment.centerLeft,
// //             child: TextButton(
// //               onPressed: () {},
// //               child: const Text(
// //                 "Edit occupation and interests",
// //                 style: TextStyle(
// //                     color: Colors.deepPurple, fontWeight: FontWeight.w500),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 16),
//
// //           // الأقسام الرئيسية مع hover
// //           MouseRegion(
// //             onExit: (_) => _onMainExit(),
// //             child: SizedBox(
// //               height: 48,
// //               child: ListView.separated(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: categories.length,
// //                 separatorBuilder: (_, __) => const SizedBox(width: 12),
// //                 itemBuilder: (context, idx) {
// //                   final cat = categories[idx];
// //                   final isHovered = hoveredCategory == cat;
// //                   return MouseRegion(
// //                     onEnter: (_) => _onMainEnter(cat),
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 16, vertical: 12),
// //                       decoration: BoxDecoration(
// //                         color: isHovered
// //                             ? Colors.blue.shade100
// //                             : Colors.grey.shade200,
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                       child: Text(
// //                         cat,
// //                         style: TextStyle(
// //                           fontWeight:
// //                               isHovered ? FontWeight.bold : FontWeight.normal,
// //                           color: isHovered
// //                               ? Colors.blue.shade800
// //                               : Colors.black87,
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
//
// //           // التصنيفات الفرعية مع hover و onTap
// //           if (hoveredCategory != null)
// //             MouseRegion(
// //               onEnter: (_) => _onSubListEnter(),
// //               onExit: (_) => _onSubListExit(),
// //               child: Container(
// //                 height: 40,
// //                 margin: const EdgeInsets.only(top: 4),
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 color: Colors.grey.shade100,
// //                 child: ListView.separated(
// //                   scrollDirection: Axis.horizontal,
// //                   itemCount: subCategories[hoveredCategory!]!.length,
// //                   separatorBuilder: (_, __) => const SizedBox(width: 8),
// //                   itemBuilder: (context, idx) {
// //                     final sub = subCategories[hoveredCategory!]![idx];
// //                     final isSubHovered = hoveredSubCategory == sub;
// //                     return MouseRegion(
// //                       onEnter: (_) => _onSubEnter(sub),
// //                       onExit: (_) => _onSubExit(),
// //                       child: GestureDetector(
// //                         onTap: () => _onSubTap(sub),
// //                         child: Container(
// //                           padding: const EdgeInsets.symmetric(
// //                               horizontal: 12, vertical: 8),
// //                           decoration: BoxDecoration(
// //                             color: isSubHovered
// //                                 ? Colors.blue.shade200
// //                                 : Colors.white,
// //                             borderRadius: BorderRadius.circular(6),
// //                             border: Border.all(
// //                                 color: isSubHovered
// //                                     ? Colors.blue.shade800
// //                                     : Colors.grey.shade300),
// //                           ),
// //                           child: Text(
// //                             sub,
// //                             style: TextStyle(
// //                               fontWeight: isSubHovered
// //                                   ? FontWeight.bold
// //                                   : FontWeight.normal,
// //                               color: isSubHovered
// //                                   ? Colors.blue.shade800
// //                                   : Colors.black87,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
//
// //           const SizedBox(height: 24),
// //           const Text("Inspired by your selections",
// //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
// //           const SizedBox(height: 12),
//
// //           // قسم الكورسات المقترحة (كما في السابق)
// //           SizedBox(
// //             height: 250,
// //             child: ListView(
// //               scrollDirection: Axis.horizontal,
// //               children: [
// //                 _courseCard(
// //                     "Flutter Advanced",
// //                     "Mina Farid",
// //                     "https://images.unsplash.com/photo-1544717305-2782549b5136?w=500&auto=format&fit=crop&q=60",
// //                     "€9.99",
// //                     "€54.99",
// //                     4.7),
// //                 _courseCard(
// //                     "Android 14 & Kotlin",
// //                     "Denis Panjuta",
// //                     "https://plus.unsplash.com/premium_photo-1661380797814-d0bcc01342b7?w=500&auto=format&fit=crop&q=60",
// //                     "€9.99",
// //                     "€84.99",
// //                     4.5),
// //                 _courseCard(
// //                     "Flutter 2025",
// //                     "Academind",
// //                     "https://plus.unsplash.com/premium_photo-1661380797814-d0bcc01342b7?w=500&auto=format&fit=crop&q=60",
// //                     "€12.99",
// //                     "€99.99",
// //                     4.6),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
//
// //   Widget _courseCard(String title, String author, String imageUrl, String price,
// //       String oldPrice, double rating) {
// //     return Container(
// //       width: 180,
// //       margin: const EdgeInsets.only(right: 12),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           ClipRRect(
// //             borderRadius: BorderRadius.circular(8),
// //             child: Image.network(
// //               imageUrl,
// //               height: 100,
// //               width: 180,
// //               fit: BoxFit.cover,
// //               loadingBuilder: (context, child, progress) {
// //                 if (progress == null) return child;
// //                 return Container(
// //                   height: 100,
// //                   width: 180,
// //                   color: Colors.grey.shade300,
// //                   child: const Center(
// //                       child: CircularProgressIndicator(strokeWidth: 2)),
// //                 );
// //               },
// //               errorBuilder: (context, error, stackTrace) => Container(
// //                 height: 100,
// //                 width: 180,
// //                 color: Colors.grey,
// //                 child: const Center(child: Icon(Icons.broken_image)),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(title,
// //               maxLines: 2,
// //               overflow: TextOverflow.ellipsis,
// //               style: const TextStyle(fontWeight: FontWeight.w600)),
// //           Text(author,
// //               style: const TextStyle(fontSize: 12, color: Colors.grey)),
// //           Row(
// //             children: [
// //               Text(rating.toString(),
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               const Icon(Icons.star, color: Colors.amber, size: 16),
// //             ],
// //           ),
// //           Row(
// //             children: [
// //               Text(price,
// //                   style: const TextStyle(fontWeight: FontWeight.bold)),
// //               const SizedBox(width: 6),
// //               Text(oldPrice,
// //                   style: const TextStyle(
// //                       decoration: TextDecoration.lineThrough,
// //                       color: Colors.grey)),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:project_2/View/Logout_Confirming.dart';
//
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({super.key});
//
//   @override
//   State<Student_Dashboard> createState() => _Student_DashboardState();
// }
//
// class _Student_DashboardState extends State<Student_Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Drawer الرئيسي
//       drawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 54, 130, 216)
//               ),
//               child: Row(
//                 children: const [
//                   Icon(Icons.person, size: 40, color: Colors.black),
//                   SizedBox(width: 10),
//                   Text("Welcome Amjad",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.black),
//               title: const Text("Logout"),
//               onTap: () {
//                 // هنا توضع منطق تسجيل الخروج
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogOutConfirming()));
//               },
//             ),
//           ],
//         ),
//       ),
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         // زر القائمة في أقصى اليسار
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ),
//         title: const Text(
//           'Welcome',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         // المحفظة على اليمين
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_balance_wallet_outlined,
//                 color: Colors.black),
//             onPressed: () {
//
//             },
//           ),
//         ],
//       ),
//
//       body: const Center(
//         child: Text(
//           "Student Dashboard",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'logout_confirming.dart';
//
// class Category {
//   final String name;
//   final String assetPath;
//   Category({required this.name, required this.assetPath});
// }
//
// class Student_Dashboard extends StatefulWidget {
//   const Student_Dashboard({Key? key}) : super(key: key);
//
//   @override
//   State<Student_Dashboard> createState() => _Student_DashboardState();
// }
//
// class _Student_DashboardState extends State<Student_Dashboard> {
//   final Dio _dio = Dio();
//   bool _isLoading = true;
//   List<Category> _categories = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchCategories();
//   }
//
//   Future<void> _fetchCategories() async {
//     try {
//       final response = await _dio.get(
//           'http://192.168.1.16:8000/api/categories');
//       final data = response.data['data'] as List<dynamic>;
//       final List<Category> loaded = data.map((e) {
//         final name = (e['name'] as String).trim();
//         String asset;
//         switch (name) {
//           case 'طبي':
//             asset = 'images/medical_course.jpg';
//             break;
//           case 'رياضيات':
//             asset = 'images/math1_edit.jpg';
//             break;
//           case 'كيمياء':
//             asset = 'images/chemestry-course.jpg';
//             break;
//           default:
//             asset = 'images/default_course.jpg';
//         }
//         return Category(name: name, assetPath: asset);
//       }).toList();
//
//       setState(() {
//         _categories = loaded;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() => _isLoading = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading categories: \$e'),
//             backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 54, 130, 216)),
//               child: Row(
//                 children: const [
//                   Icon(Icons.person, size: 40, color: Colors.white),
//                   SizedBox(width: 10),
//                   Text('Welcome Amjad', style: TextStyle(fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white)),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.black),
//               title: const Text('Logout'),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const LogOutConfirming()));
//               },
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: Builder(
//           builder: (ctx) =>
//               IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.black),
//                 onPressed: () => Scaffold.of(ctx).openDrawer(),
//               ),
//         ),
//         title: Container(
//           height: 40,
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               const Icon(Icons.search, color: Colors.grey),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: TextField(
//
//                   decoration: InputDecoration(
//                     hintText: 'Search for categories',
//                     border: InputBorder.none,
//                     hintStyle: TextStyle(color: Colors.grey.shade600),
//                   ),
//                   style: const TextStyle(color: Colors.black87),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(
//                 Icons.account_balance_wallet_outlined, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // عنوان فوق الـ GridView
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18.0),
//               child: Center(
//                 child: Text(
//                   'Recommended For You',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple.shade700,
//                   ),
//                 ),
//               ),
//             ),
//             // الـ GridView موسع ليأخذ المساحة المتبقية
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 12,
//                   mainAxisSpacing: 12,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemCount: _categories.length,
//                 itemBuilder: (ctx, idx) {
//                   final cat = _categories[idx];
//                   return GestureDetector(
//                     child: Card(
//                       shadowColor: Colors.black,
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                       elevation: 2,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Expanded(
//                             child: ClipRRect(
//                               borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(12)),
//                               child: Image.asset(
//                                   cat.assetPath, fit: BoxFit.fill),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               cat.name,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_Student.dart';


class Category {
  final String name;
  final String assetPath;
  final int rating;

  Category({required this.name, required this.assetPath, required this.rating});
}

class Student_Dashboard extends StatefulWidget {
  const Student_Dashboard({Key? key}) : super(key: key);

  @override
  State<Student_Dashboard> createState() => _Student_DashboardState();
}

class _Student_DashboardState extends State<Student_Dashboard> {
  final Dio _dio = Dio();
  bool _isLoading = true;
  List<Category> _categories = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    setState(() => _isLoading = true);
    try {
      final response = await _dio.get('http://192.168.1.16:8000/api/categories');
      final data = response.data['data'] as List<dynamic>;
      _categories = data.map((e) {
        final name = (e['name'] as String).trim();
        String asset;
        int rating;
        switch (name) {
          case 'طبي':
            asset = 'images/medical_course.jpg';
            rating = 4;
            break;
          case 'رياضيات':
            asset = 'images/math1_edit.jpg';
            rating = 3;
            break;
          case 'كيمياء':
            asset = 'images/chemestry-course.jpg';
            rating = 5;
            break;
          default:
            asset = 'images/default_course.jpg';
            rating = 0;
        }
        return Category(name: name, assetPath: asset, rating: rating);
      }).toList();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading categories: $e'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
  Future<void> _logout() async {
    // تأكد من صلاحية الـ form إن رغبت بابقاءه
    setState(() => _isLoading = true);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final tokenType = prefs.getString('token_type') ?? 'Bearer';

    try {
      final response = await _dio.post(
        'http://192.168.1.16:8000/api/logout',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': '$tokenType $token',
          },
        ),
      );

      // حذف التوكن من التخزين بعد logout ناجح
      await prefs.remove('token');
      await prefs.remove('token_type');
      await prefs.remove('refresh_token');

      // تنقل إلى شاشة Login
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const Login()),
              (route) => false,
        );
      }
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final msg = e.response?.data['message'] ?? 'Logout error';

      // إذا الكود 401 (Unauthorized) نمسح التوكن ونرجع لـ Login
      // if (statusCode == 401) {
      //   await prefs.remove('token');
      //   await prefs.remove('token_type');
      //   await prefs.remove('refresh_token');
      //   if (mounted) {
      //     Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(builder: (_) => const Login()),
      //           (route) => false,
      //     );
      //   }
      //   return;
      // }

      // تظهر رسالة الخطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unknown error: $e'), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }


  Future<void> _searchCategories(String query) async {
    final q = query.trim();
    if (q.isEmpty) {
      await _fetchCategories();
      return;
    }
    setState(() {
      _isLoading = true;
      _categories = [];
    });
    try {
      final response = await _dio.get(
        'http://192.168.1.16:8000/api/categories/search',
        queryParameters: {'query': q},
      );
      final status = response.data['status'] as String;
      final pageData = (response.data['data']['data'] as List<dynamic>);
      if (status == 'success' && pageData.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Found!'), backgroundColor: Colors.green),
        );
        _categories = pageData.map((e) {
          final name = (e['name'] as String).trim();
          String asset;
          int rating;
          switch (name) {
            case 'طبي':
              asset = 'images/medical_course.jpg';
              rating = 4;
              break;
            case 'رياضيات':
              asset = 'images/math1_edit.jpg';
              rating = 3;
              break;
            case 'كيمياء':
              asset = 'images/chemestry-course.jpg';
              rating = 5;
              break;
            default:
              asset = 'images/Login.jpg';
              rating = 1;
          }
          return Category(name: name, assetPath: asset, rating: rating);
        }).toList();
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Not found'), backgroundColor: Colors.orange),
        //   );
        // }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not Found'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildStars(int count) {
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
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromRGBO(100, 181, 246, 100)),
      child: Row(
                children: const [
                  Icon(Icons.person, size: 40, color: Colors.black),
                  SizedBox(width: 10),
                  Text("Welcome Amjad",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),

            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('Logout'),
              onTap: () {
                _logout();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const LogOutConfirming()));
              },
            ),
          ],
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  textDirection: TextDirection.rtl,
                  onSubmitted: _searchCategories,
                  decoration: InputDecoration(
                    hintText: 'ابحث عن فئة',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
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
                itemCount: _categories.length,
                itemBuilder: (ctx, idx) {
                  final cat = _categories[idx];
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Card(
                      shadowColor: Colors.black,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                _buildStars(cat.rating),
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
      ),
    );
  }
}


