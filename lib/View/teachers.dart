// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// /// ===============================
// /// TeachersView
// /// ===============================
// class TeachersView extends StatefulWidget {
//   const TeachersView({Key? key}) : super(key: key);

//   @override
//   State<TeachersView> createState() => _TeachersViewState();
// }

// class _TeachersViewState extends State<TeachersView> {
//   final TextEditingController _searchCtrl = TextEditingController();
//   final Dio _dio = Dio();

//   bool _isLoading = false;
//   String? _error;
//   List<Map<String, dynamic>> _teachers = []; // جميع الأساتذة (عند عدم وجود بحث)
//   List<Map<String, dynamic>> _searchResults = []; // نتائج البحث

//   @override
//   void initState() {
//     super.initState();
//     _searchCtrl.addListener(_onSearchTextChanged);
//     _fetchAllTeachers(); // بداية: اجلب كل الأساتذة
//   }

//   @override
//   void dispose() {
//     _searchCtrl.removeListener(_onSearchTextChanged);
//     _searchCtrl.dispose();
//     super.dispose();
//   }

//   void _onSearchTextChanged() {
//     // إذا المستخدم مسح الحقل بالكامل → ارجع للكل
//     if (_searchCtrl.text.trim().isEmpty) {
//       setState(() {
//         _searchResults.clear();
//         _error = null;
//       });
//       _fetchAllTeachers();
//     }
//   }

//   Future<Map<String, String>> _authHeaders() async {
//     // Authorization: <token> (بدون Bearer) كما طلبت
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     return {
//       'Accept': 'application/json',
//       if (token.isNotEmpty) 'Authorization': token,
//     };
//   }

//   Future<void> _fetchAllTeachers() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });
//     try {
//       final headers = await _authHeaders();
//       final res = await _dio.get(
//         'http://192.168.1.5:8000:8000/api/teachers',
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if ((res.statusCode ?? 0) >= 200 && (res.statusCode ?? 0) < 300) {
//         final data = res.data;
//         final list = (data is Map && data['data'] is List)
//             ? (data['data'] as List)
//             : <dynamic>[];
//         setState(() {
//           _teachers = list
//               .map<Map<String, dynamic>>(
//                   (e) => Map<String, dynamic>.from(e as Map))
//               .toList();
//         });
//       } else {
//         setState(() => _error = 'فشل جلب الأساتذة (HTTP ${res.statusCode}).');
//       }
//     } catch (e) {
//       setState(() => _error = 'تعذر الاتصال بالخادم: $e');
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _saveUserIdsToCache(List<int> ids) async {
//     final prefs = await SharedPreferences.getInstance();
//     final asStrings = ids.map((e) => e.toString()).toList();
//     await prefs.setStringList('last_found_teacher_user_ids', asStrings);
//     if (ids.isNotEmpty) {
//       await prefs.setInt('last_teacher_user_id', ids.first);
//     }
//   }

//   Future<void> _searchTeachers(String query) async {
//     query = query.trim();
//     if (query.isEmpty) {
//       setState(() {
//         _searchResults.clear();
//         _error = null;
//       });
//       _fetchAllTeachers();
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//       _error = null;
//       _searchResults.clear();
//     });

//     try {
//       final headers = await _authHeaders();
//       final res = await _dio.get(
//         'http://192.168.1.5:8000:8000/api/teachers/search',
//         queryParameters: {'query': query},
//         options: Options(headers: headers, validateStatus: (_) => true),
//       );

//       if ((res.statusCode ?? 0) >= 200 && (res.statusCode ?? 0) < 300) {
//         final root = res.data;
//         final dataNode = (root is Map) ? root['data'] : null;
//         final list = (dataNode is Map && dataNode['data'] is List)
//             ? (dataNode['data'] as List)
//             : <dynamic>[];

//         final mapped = list
//             .map<Map<String, dynamic>>(
//                 (e) => Map<String, dynamic>.from(e as Map))
//             .toList();

//         // خزن user_id في الكاش
//         final userIds = mapped
//             .map((m) => m['user_id'])
//             .where((v) => v != null)
//             .map<int>((v) => v is int ? v : int.tryParse(v.toString()) ?? -1)
//             .where((v) => v > 0)
//             .toList();
//         await _saveUserIdsToCache(userIds);

//         setState(() => _searchResults = mapped);

//         if (_searchResults.isEmpty) {
//           Get.snackbar('نتيجة البحث', 'لا توجد نتائج مطابقة.',
//               snackPosition: SnackPosition.BOTTOM);
//         }
//       } else {
//         setState(() => _error = 'فشل البحث (HTTP ${res.statusCode}).');
//       }
//     } catch (e) {
//       setState(() => _error = 'تعذر إجراء البحث: $e');
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   List<Map<String, dynamic>> get _dataToShow {
//     if (_searchResults.isNotEmpty) return _searchResults;
//     return _teachers;
//   }

//   PreferredSizeWidget _buildSearchAppBar() {
//     return AppBar(
//       backgroundColor: Colors.blue.shade300,
//       elevation: 1,
//       title: SizedBox(
//         height: 42,
//         child: TextField(
//           controller: _searchCtrl,
//           textInputAction: TextInputAction.search,
//           onSubmitted: _searchTeachers,
//           decoration: InputDecoration(
//             hintText: 'ابحث عن أستاذ بالاسم…',
//             hintStyle: const TextStyle(color: Colors.white70),
//             prefixIcon: const Icon(Icons.search, color: Colors.white),
//             suffixIcon: _searchCtrl.text.isNotEmpty
//                 ? IconButton(
//                     tooltip: 'مسح',
//                     icon: const Icon(Icons.clear, color: Colors.white),
//                     onPressed: () {
//                       _searchCtrl.clear();
//                       FocusScope.of(context).unfocus();
//                       // _onSearchTextChanged سيعيد الكل تلقائياً
//                     },
//                   )
//                 : null,
//             //filled: true,
//             //   fillColor: Colors.blue.shade400,
//             contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(22),
//               borderSide: BorderSide.none,
//             ),
//           ),
//           style:
//               const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//         ),
//       ),
//       centerTitle: true,
//     );
//   }

//   // كرت جميل (بدون صور) يعرض فقط الحقول المطلوبة
//   Widget _teacherCard(Map<String, dynamic> t) {
//     final userId = t['user_id'];
//     final first = (t['first_name'] ?? '').toString();
//     final last = (t['last_name'] ?? '').toString();
//     final specialization = (t['specialization'] ?? '').toString();
//     final exp = (t['Previous_experiences'] ?? '').toString();
//     final phone = (t['phone'] ?? '').toString();
//     final country = (t['country'] ?? '').toString();
//     final city = (t['city'] ?? '').toString();
//     final gender = (t['gender'] ?? '').toString();

//     final fullname = [first, last].where((e) => e.trim().isNotEmpty).join(' ');

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: const [
//           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
//         ],
//         border: Border.all(color: Colors.blue.shade50, width: 1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // الاسم + بادج user_id + شريحة الجنس
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     fullname.isEmpty ? '—' : fullname,
//                     style: const TextStyle(
//                         fontSize: 17, fontWeight: FontWeight.w700),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.blue.shade100,
//                     borderRadius: BorderRadius.circular(999),
//                   ),
//                   child: Text('user_id: ${userId ?? "-"}',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.blue.shade900,
//                           fontWeight: FontWeight.w600)),
//                 ),
//                 const SizedBox(width: 6),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple.shade50,
//                     borderRadius: BorderRadius.circular(999),
//                   ),
//                   child: Text(
//                     gender.isEmpty ? '—' : gender,
//                     style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.deepPurple.shade700,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),

//             // سطر التخصص
//             _iconRow(
//                 Icons.workspace_premium_outlined, 'التخصص', specialization),
//             _iconRow(Icons.badge_outlined, 'الخبرات السابقة', exp),
//             _iconRow(Icons.call_outlined, 'الهاتف', phone),
//             _iconRow(Icons.public_outlined, 'الدولة', country),
//             _iconRow(Icons.location_city_outlined, 'المدينة', city),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _iconRow(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6.0),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: Colors.blueGrey.shade600),
//           const SizedBox(width: 8),
//           SizedBox(
//             width: 120,
//             child: Text(
//               label,
//               style: TextStyle(
//                   fontWeight: FontWeight.w700, color: Colors.blueGrey.shade700),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value.isEmpty ? '—' : value,
//               style: const TextStyle(fontSize: 14),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.start,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = _dataToShow;

//     return Scaffold(
//       appBar: _buildSearchAppBar(),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _error != null
//               ? Center(
//                   child:
//                       Text(_error!, style: const TextStyle(color: Colors.red)))
//               : data.isEmpty
//                   ? const Center(
//                       child: Text('لا يوجد بيانات.',
//                           style: TextStyle(fontSize: 16, color: Colors.grey)))
//                   : ListView.builder(
//                       itemCount: data.length,
//                       itemBuilder: (ctx, i) => _teacherCard(data[i]),
//                     ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ===============================
/// TeachersView
/// ===============================
class TeachersView extends StatefulWidget {
  const TeachersView({Key? key}) : super(key: key);

  @override
  State<TeachersView> createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
  final TextEditingController _searchCtrl = TextEditingController();
  final Dio _dio = Dio();

  bool _isLoading = false;
  String? _error;
  List<Map<String, dynamic>> _teachers = []; // جميع الأساتذة (عند عدم وجود بحث)
  List<Map<String, dynamic>> _searchResults = []; // نتائج البحث

  /// حفظ متوسط التقييم المعاد من الباك لكل teacher-user_id بعد التقييم
  final Map<int, int> _averageByTeacherUserId = {};

  /// اختيار المستخدم المؤقت للتقييم قبل الإرسال لكل teacher-user_id
  final Map<int, int> _selectedRatingByTeacherUserId = {};

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(_onSearchTextChanged);
    _fetchAllTeachers(); // بداية: اجلب كل الأساتذة
  }

  @override
  void dispose() {
    _searchCtrl.removeListener(_onSearchTextChanged);
    _searchCtrl.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    // إذا المستخدم مسح الحقل بالكامل → ارجع للكل
    if (_searchCtrl.text.trim().isEmpty) {
      setState(() {
        _searchResults.clear();
        _error = null;
      });
      _fetchAllTeachers();
    }
  }

  Future<Map<String, String>> _authHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final tokenType = prefs.getString('token_type') ?? 'Bearer'; // fallback آمن
    return {
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': '$tokenType $token', // <-- مهم
    };
  }

  Future<void> _fetchAllTeachers() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final headers = await _authHeaders();
      final res = await _dio.get(
        'http://192.168.1.5:8000/api/teachers',
        options: Options(headers: headers, validateStatus: (_) => true),
      );

      if ((res.statusCode ?? 0) >= 200 && (res.statusCode ?? 0) < 300) {
        final data = res.data;
        final list = (data is Map && data['data'] is List)
            ? (data['data'] as List)
            : <dynamic>[];
        setState(() {
          _teachers = list
              .map<Map<String, dynamic>>(
                  (e) => Map<String, dynamic>.from(e as Map))
              .toList();
        });
      } else {
        setState(() => _error = 'فشل جلب الأساتذة (HTTP ${res.statusCode}).');
      }
    } catch (e) {
      setState(() => _error = 'تعذر الاتصال بالخادم: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveUserIdsToCache(List<int> ids) async {
    final prefs = await SharedPreferences.getInstance();
    final asStrings = ids.map((e) => e.toString()).toList();
    await prefs.setStringList('last_found_teacher_user_ids', asStrings);
    if (ids.isNotEmpty) {
      await prefs.setInt('last_teacher_user_id', ids.first);
    }
  }

  Future<void> _searchTeachers(String query) async {
    query = query.trim();
    if (query.isEmpty) {
      setState(() {
        _searchResults.clear();
        _error = null;
      });
      _fetchAllTeachers();
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      _searchResults.clear();
    });

    try {
      final headers = await _authHeaders();
      final res = await _dio.get(
        'http://192.168.1.5:8000/api/teachers/search',
        queryParameters: {'query': query},
        options: Options(headers: headers, validateStatus: (_) => true),
      );

      if ((res.statusCode ?? 0) >= 200 && (res.statusCode ?? 0) < 300) {
        final root = res.data;
        final dataNode = (root is Map) ? root['data'] : null;
        final list = (dataNode is Map && dataNode['data'] is List)
            ? (dataNode['data'] as List)
            : <dynamic>[];

        final mapped = list
            .map<Map<String, dynamic>>(
                (e) => Map<String, dynamic>.from(e as Map))
            .toList();

        // خزن user_id في الكاش
        final userIds = mapped
            .map((m) => m['user_id'])
            .where((v) => v != null)
            .map<int>((v) => v is int ? v : int.tryParse(v.toString()) ?? -1)
            .where((v) => v > 0)
            .toList();
        await _saveUserIdsToCache(userIds);

        setState(() => _searchResults = mapped);

        if (_searchResults.isEmpty) {
          Get.snackbar('نتيجة البحث', 'لا توجد نتائج مطابقة.',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        setState(() => _error = 'فشل البحث (HTTP ${res.statusCode}).');
      }
    } catch (e) {
      setState(() => _error = 'تعذر إجراء البحث: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  List<Map<String, dynamic>> get _dataToShow {
    if (_searchResults.isNotEmpty) return _searchResults;
    return _teachers;
  }

  PreferredSizeWidget _buildSearchAppBar() {
    return AppBar(
      backgroundColor: Colors.blue.shade300,
      elevation: 1,
      title: SizedBox(
        height: 42,
        child: TextField(
          controller: _searchCtrl,
          textDirection: TextDirection.rtl, // يميني متل الكورسات
          textInputAction: TextInputAction.search,
          onSubmitted: _searchTeachers,
          style: const TextStyle(color: Colors.black), // نص بالأسود

          decoration: InputDecoration(
            hintText: 'Search For Teachers By Name…', // نص مساعد
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),

            // زر مسح إذا في نص
            suffixIcon: _searchCtrl.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _searchCtrl.clear();
                      FocusScope.of(context).unfocus();
                      // يرجع القائمة الكاملة للمدرسين
                      _onSearchTextChanged();
                    },
                  )
                : null,

            filled: true, // خلفية بيضاء
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  /// إرسال تقييم للأستاذ (teacherId = user_id)
  Future<void> _evaluateTeacher({
    required int teacherUserId,
    required int value,
  }) async {
    try {
      final headers = await _authHeaders();
      final res = await _dio.post(
        'http://192.168.1.5:8000/api/teachers/$teacherUserId/evaluate',
        data: {'evaluation_value': value.toString()},
        options: Options(headers: headers, validateStatus: (_) => true),
      );

      final status = res.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        final avg = (res.data is Map) ? res.data['average_rating'] : null;
        final avgInt =
            (avg is int) ? avg : int.tryParse('${avg ?? ''}') ?? value;

        setState(() {
          _averageByTeacherUserId[teacherUserId] = avgInt;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('تمت إضافة تقييم بنجاح'),
            backgroundColor: Colors.green.shade600,
          ),
        );
      } else {
        final msg = (res.data is Map && res.data['message'] != null)
            ? res.data['message'].toString()
            : 'فشل إضافة التقييم.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('تعذر إضافة التقييم: $e'),
            backgroundColor: Colors.red),
      );
    }
  }

  // صف اختيار نجوم (1..5)
  Widget _rateSelectorRow(int teacherUserId) {
    final selected = _selectedRatingByTeacherUserId[teacherUserId] ?? 0;

    List<Widget> stars = List.generate(5, (i) {
      final idx = i + 1;
      final filled = idx <= selected;
      return IconButton(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        onPressed: () {
          setState(() {
            _selectedRatingByTeacherUserId[teacherUserId] = idx;
          });
        },
        icon: Icon(
          filled ? Icons.star : Icons.star_border,
          size: 28,
          color: filled ? Colors.amber.shade600 : Colors.grey.shade500,
        ),
      );
    });

    return Row(
      children: [
        ...stars,
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: selected == 0
              ? null
              : () => _evaluateTeacher(
                  teacherUserId: teacherUserId, value: selected),
          icon: const Icon(Icons.check, size: 18, color: Colors.white),
          label: const Text('تأكيد التقييم',
              style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            minimumSize: const Size(0, 36),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  // عرض نجوم متوسط التقييم بعد العودة من الباك
  Widget _averageStarsRow(int avg) {
    final stars = List<Widget>.generate(5, (i) {
      final filled = i < avg;
      return Icon(
        filled ? Icons.star : Icons.star_border,
        size: 26,
        color: filled ? Colors.amber.shade700 : Colors.grey.shade500,
      );
    });
    return Row(children: stars);
  }

  // كرت جميل (بدون صور) يعرض فقط الحقول المطلوبة + التقييم
  Widget _teacherCard(Map<String, dynamic> t, {required bool showRateUi}) {
    final userIdRaw = t['user_id'];
    final userId =
        (userIdRaw is int) ? userIdRaw : int.tryParse('$userIdRaw') ?? -1;

    final first = (t['first_name'] ?? '').toString();
    final last = (t['last_name'] ?? '').toString();
    final specialization = (t['specialization'] ?? '').toString();
    final exp = (t['Previous_experiences'] ?? '').toString();
    final phone = (t['phone'] ?? '').toString();
    final country = (t['country'] ?? '').toString();
    final city = (t['city'] ?? '').toString();
    //final gender = (t['gender'] ?? '').toString();

    final fullname = [first, last].where((e) => e.trim().isNotEmpty).join(' ');

    final avg = (userId > 0) ? _averageByTeacherUserId[userId] : null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
        border: Border.all(color: Colors.blue.shade50, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الاسم + بادج user_id + شريحة الجنس
            Row(
              children: [
                Expanded(
                  child: Text(
                    fullname.isEmpty ? '—' : fullname,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  // child: Text('user_id: ${userId > 0 ? userId : "-"}',
                  //     style: TextStyle(
                  //         fontSize: 12,
                  //         color: Colors.blue.shade900,
                  //         fontWeight: FontWeight.w600)),
                ),
                const SizedBox(width: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  // child: Text(
                  //   gender.isEmpty ? '—' : gender,
                  //   style: TextStyle(
                  //       fontSize: 12,
                  //       color: Colors.deepPurple.shade700,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // سطر التخصص والحقول المطلوبة
            _iconRow(
                Icons.workspace_premium_outlined, 'التخصص', specialization),
            _iconRow(Icons.badge_outlined, 'الخبرات السابقة', exp),
            _iconRow(Icons.call_outlined, 'الهاتف', phone),
            _iconRow(Icons.public_outlined, 'الدولة', country),
            _iconRow(Icons.location_city_outlined, 'المدينة', city),

            // ---------------- التقييم ----------------
            if (showRateUi) ...[
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان الجميل + أيقونة نجمة
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded,
                            color: Colors.amber, size: 24),
                        const SizedBox(width: 6),
                        Text('Rate Now',
                            style: TextStyle(
                              color: Colors.amber.shade800,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            )),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // إذا صار في average_rating من الباك، اعرضه نجوم وخالص
                    if (avg != null)
                      _averageStarsRow(avg)
                    else
                      // وإلا عرض شريط اختيار النجوم + زر تأكيد
                      _rateSelectorRow(userId),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _iconRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blueGrey.shade600),
          const SizedBox(width: 8),
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.blueGrey.shade700),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '—' : value,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _dataToShow;

    // نعرض واجهة التقييم فقط "بعد نجاح عملية البحث" (أي عند وجود نتائج بحث غير فارغة)
    final showRateUi = _searchResults.isNotEmpty;

    return Scaffold(
      appBar: _buildSearchAppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child:
                      Text(_error!, style: const TextStyle(color: Colors.red)))
              : data.isEmpty
                  ? const Center(
                      child: Text('لا يوجد بيانات.',
                          style: TextStyle(fontSize: 16, color: Colors.grey)))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (ctx, i) =>
                          _teacherCard(data[i], showRateUi: showRateUi),
                    ),
    );
  }
}
