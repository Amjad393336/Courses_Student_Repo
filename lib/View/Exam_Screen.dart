// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/exam.dart';

// class ExamScreen extends StatefulWidget {
//   final int courseId;
//   final String courseTitle;

//   const ExamScreen({
//     super.key,
//     required this.courseId,
//     required this.courseTitle,
//   });

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }

// class _ExamScreenState extends State<ExamScreen> {
//   late final DashboardController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     // اجلب الامتحان لهذا الكورس
//     controller.fetchExamByCourseId(widget.courseId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exam • ${widget.courseTitle} (ID: ${widget.courseId})'),
//         backgroundColor: Colors.blue.shade300,
//         actions: [
//           Obx(() => Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: Center(
//                   child: Text(
//                     controller.currentExam.value == null
//                         ? ''
//                         : '⏱ ${controller.formatRemaining()}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               )),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.examLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (controller.examError.value.isNotEmpty) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 controller.examError.value,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(color: Colors.red, fontSize: 16),
//               ),
//             ),
//           );
//         }
//         final exam = controller.currentExam.value;
//         if (exam == null) {
//           return const Center(child: Text('No exam data.'));
//         }

//         return ListView(
//           padding: const EdgeInsets.all(16),
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: ListTile(
//                 leading: const Icon(Icons.description_outlined),
//                 title: Text(
//                     'Exam #${exam.id} • Duration: ${exam.durationMinutes} min'),
//                 subtitle: Text(
//                     'Course ID: ${exam.courseId} • Questions: ${exam.questions.length}'),
//               ),
//             ),
//             const SizedBox(height: 12),
//             ...exam.questions.map((q) {
//               final selected = controller.selectedChoiceByQid[q.id];
//               return Card(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Q${q.id}: ${q.questionText}',
//                           style: const TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 8),
//                       ...q.choices.map((c) {
//                         return RadioListTile<int>(
//                           value: c.id,
//                           groupValue: selected,
//                           onChanged: (v) => controller.selectChoice(q.id, c.id),
//                           title: Text(c.choiceText),
//                           dense: true,
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 48,
//               child: ElevatedButton.icon(
//                 onPressed: controller.submitExamAnswers,
//                 icon: const Icon(Icons.send),
//                 label: const Text('Submit Answers'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//           ],
//         );
//       }),
//     );
//   }
// }

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/exam.dart';

// class ExamScreen extends StatefulWidget {
//   final int courseId;
//   final String courseTitle;

//   const ExamScreen({
//     super.key,
//     required this.courseId,
//     required this.courseTitle,
//   });

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }

// class _ExamScreenState extends State<ExamScreen>
//     with SingleTickerProviderStateMixin {
//   late final DashboardController controller;
//   late final AnimationController _shakeCtrl;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     controller.fetchExamByCourseId(widget.courseId).then((_) {
//       // لو في محاولة محفوظة، استأنف العدّ
//       controller.restoreExamTimerIfAny(widget.courseId);
//     });

//     _shakeCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 700),
//     );
//     _shakeCtrl.addStatusListener((status) {
//       if (status == AnimationStatus.completed) _shakeCtrl.reverse();
//       if (status == AnimationStatus.dismissed && _isLastMinute) _shakeCtrl.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _shakeCtrl.dispose();
//     super.dispose();
//   }

//   bool get _isLocked =>
//       !controller.examStarted.value || controller.remainingSeconds.value <= 0;

//   bool get _isLastMinute =>
//       controller.examStarted.value &&
//       controller.remainingSeconds.value > 0 &&
//       controller.remainingSeconds.value <= 60;

//   BoxDecoration _cardBox() {
//     return BoxDecoration(
//       borderRadius: BorderRadius.circular(14),
//       gradient: const LinearGradient(
//         colors: [Color(0xFFF7F3FF), Color(0xFFF9F8FF)],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       border: Border.all(color: const Color(0xFFE9E1FF)),
//       boxShadow: [
//         BoxShadow(
//           color: const Color(0xFF7959F0).withOpacity(0.07),
//           blurRadius: 14,
//           spreadRadius: 0,
//           offset: const Offset(0, 8),
//         ),
//       ],
//     );
//   }

//   Widget _sectionHeader(IconData icon, String title) {
//     return Row(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: const Color(0xFFEDE8FF),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           padding: const EdgeInsets.all(8),
//           child: Icon(icon, color: const Color(0xFF6C55F7)),
//         ),
//         const SizedBox(width: 8),
//         Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bg = const Color(0xFFFBF8FF);
//     return Obx(() {
//       if (_isLastMinute && !_shakeCtrl.isAnimating) _shakeCtrl.forward();
//       if (!_isLastMinute && _shakeCtrl.isAnimating) _shakeCtrl.stop();

//       final shake = Tween(begin: -4.0, end: 4.0).animate(
//         CurvedAnimation(parent: _shakeCtrl, curve: Curves.easeInOut),
//       );

//       return Scaffold(
//         backgroundColor: bg,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(56),
//           child: AnimatedBuilder(
//             animation: shake,
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(_isLastMinute ? shake.value : 0, 0),
//                 child: AppBar(
//                   backgroundColor: _isLastMinute
//                       ? const Color(0xFFFFE6E6)
//                       : const Color(0xFF7DB8FF),
//                   elevation: 0.5,
//                   title: Text(
//                     'Exam • ${widget.courseTitle} (ID: ${widget.courseId})',
//                     style: const TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   actions: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.timer_outlined,
//                               color: _isLastMinute ? Colors.redAccent : Colors.black87,
//                               size: 18),
//                           const SizedBox(width: 6),
//                           Text(
//                             controller.currentExam.value == null
//                                 ? ''
//                                 : controller.formatRemaining(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: _isLastMinute ? Colors.redAccent : Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//         body: _buildBody(),
//       );
//     });
//   }

//   Widget _buildBody() {
//     if (controller.examLoading.value) {
//       return const Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color?>(Color(0xFF6C55F7)),
//         ),
//       );
//     }
//     if (controller.examError.value.isNotEmpty) {
//       return Center(
//         child: Container(
//           margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(16),
//           decoration: _cardBox(),
//           child: Text(
//             controller.examError.value,
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.red, fontSize: 16),
//           ),
//         ),
//       );
//     }

//     final Exam? exam = controller.currentExam.value;
//     if (exam == null) {
//       return Center(
//         child: Container(
//           margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(16),
//           decoration: _cardBox(),
//           child: const Text('No exam data.'),
//         ),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         // بطاقة معلومات + زر البدء
//         Container(
//           decoration: _cardBox(),
//           padding: const EdgeInsets.all(14),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _sectionHeader(Icons.description_outlined, 'Exam Summary'),
//               const SizedBox(height: 10),
//               DefaultTextStyle(
//                 style: const TextStyle(color: Color(0xFF2B2B2B)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Exam #${exam.id} • Duration: ${exam.durationMinutes} min',
//                         style: const TextStyle(fontWeight: FontWeight.w600)),
//                     const SizedBox(height: 2),
//                     Text('Course ID: ${exam.courseId} • Questions: ${exam.questions.length}',
//                         style: const TextStyle(color: Colors.black54)),
//                     const SizedBox(height: 12),

//                     // زر البدء
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: controller.examStarted.value
//                                 ? null
//                                 : () => controller.startExam(widget.courseId),
//                             icon: const Icon(Icons.play_arrow_rounded),
//                             label: Text(
//                               controller.examStarted.value ? 'Exam Started' : 'Start Exam',
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: controller.examStarted.value
//                                   ? Colors.grey
//                                   : const Color(0xFF13B4A3),
//                               elevation: 0,
//                               minimumSize: const Size(0, 46),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // سطر تاريخ البدء إن وجد
//                     Builder(builder: (_) {
//                       final dt = controller.lastStartedAt.value ??
//                           controller.currentAttempt.value?.startedAt;
//                       if (dt == null) return const SizedBox.shrink();
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 8),
//                         child: Row(
//                           children: [
//                             const Icon(Icons.schedule_outlined, size: 18),
//                             const SizedBox(width: 6),
//                             Text('started_at: ${dt.toIso8601String()}',
//                                 style: const TextStyle(fontSize: 12, color: Colors.black54)),
//                           ],
//                         ),
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 12),

//         // الأسئلة
//         ...exam.questions.map((q) {
//           final selected = controller.selectedChoiceByQid[q.id];

//           return Container(
//             margin: const EdgeInsets.only(bottom: 12),
//             decoration: _cardBox(),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Q${q.id}: ${q.questionText}',
//                       style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
//                   const SizedBox(height: 8),
//                   ...q.choices.map((c) {
//                     return Opacity(
//                       opacity: _isLocked ? 0.55 : 1,
//                       child: RadioListTile<int>(
//                         value: c.id,
//                         groupValue: selected,
//                         onChanged: _isLocked ? null : (v) => controller.selectChoice(q.id, c.id),
//                         title: Text(c.choiceText),
//                         dense: true,
//                         activeColor: const Color(0xFF6C55F7),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         tileColor: Colors.transparent,
//                       ),
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           );
//         }),

//         const SizedBox(height: 12),

//         // زر الإرسال
//         IgnorePointer(
//           ignoring: _isLocked,
//           child: AnimatedOpacity(
//             duration: const Duration(milliseconds: 250),
//             opacity: _isLocked ? 0.5 : 1,
//             child: SizedBox(
//               height: 50,
//               child: ElevatedButton.icon(
//                 onPressed: controller.submitExamAnswers,
//                 icon: const Icon(Icons.send),
//                 label: const Text('Submit Answers'),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: _isLocked ? Colors.grey : const Color(0xFF13B4A3),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         // لافتة انتهى الوقت
//         if (controller.examStarted.value && controller.remainingSeconds.value <= 0) ...[
//           const SizedBox(height: 10),
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFEEEE),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: const Color(0xFFFFD2D2)),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.lock_clock, color: Colors.redAccent),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'انتهى الوقت — تم قفل الإجابات.',
//                     style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ],
//     );
//   }
// }

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_2/Controller/dashboard_controller.dart';
// import 'package:project_2/Model/exam.dart';

// class ExamScreen extends StatefulWidget {
//   final int courseId;
//   final String courseTitle;

//   const ExamScreen({
//     super.key,
//     required this.courseId,
//     required this.courseTitle,
//   });

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }

// class _ExamScreenState extends State<ExamScreen>
//     with SingleTickerProviderStateMixin {
//   late final DashboardController controller;
//   late final AnimationController _shakeCtrl;

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.find<DashboardController>();
//     controller.fetchExamByCourseId(widget.courseId).then((_) {
//       controller.restoreExamTimerIfAny(widget.courseId);
//     });

//     _shakeCtrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 700),
//     );
//     _shakeCtrl.addStatusListener((status) {
//       if (status == AnimationStatus.completed) _shakeCtrl.reverse();
//       if (status == AnimationStatus.dismissed && _isLastMinute) _shakeCtrl.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _shakeCtrl.dispose();
//     super.dispose();
//   }

//   bool get _isLocked =>
//       controller.examCompleted.value ||
//       !controller.examStarted.value ||
//       controller.remainingSeconds.value <= 0;

//   bool get _isLastMinute =>
//       controller.examStarted.value &&
//       controller.remainingSeconds.value > 0 &&
//       controller.remainingSeconds.value <= 60;

//   BoxDecoration _cardBox() {
//     return BoxDecoration(
//       borderRadius: BorderRadius.circular(14),
//       gradient: const LinearGradient(
//         colors: [Color(0xFFF7F3FF), Color(0xFFF9F8FF)],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       border: Border.all(color: const Color(0xFFE9E1FF)),
//       boxShadow: [
//         BoxShadow(
//           color: const Color(0xFF7959F0).withOpacity(0.07),
//           blurRadius: 14,
//           spreadRadius: 0,
//           offset: const Offset(0, 8),
//         ),
//       ],
//     );
//   }

//   Widget _sectionHeader(IconData icon, String title) {
//     return Row(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: const Color(0xFFEDE8FF),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           padding: const EdgeInsets.all(8),
//           child: Icon(icon, color: const Color(0xFF6C55F7)),
//         ),
//         const SizedBox(width: 8),
//         Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bg = const Color(0xFFFBF8FF);
//     return Obx(() {
//       if (_isLastMinute && !_shakeCtrl.isAnimating) _shakeCtrl.forward();
//       if (!_isLastMinute && _shakeCtrl.isAnimating) _shakeCtrl.stop();

//       final shake = Tween(begin: -4.0, end: 4.0).animate(
//         CurvedAnimation(parent: _shakeCtrl, curve: Curves.easeInOut),
//       );

//       return Scaffold(
//         backgroundColor: bg,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(56),
//           child: AnimatedBuilder(
//             animation: shake,
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(_isLastMinute ? shake.value : 0, 0),
//                 child: AppBar(
//                   backgroundColor: _isLastMinute
//                       ? const Color(0xFFFFE6E6)
//                       : const Color(0xFF7DB8FF),
//                   elevation: 0.5,
//                   title: Text(
//                     'Exam • ${widget.courseTitle} (ID: ${widget.courseId})',
//                     style: const TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   actions: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.timer_outlined,
//                               color: _isLastMinute ? Colors.redAccent : Colors.black87,
//                               size: 18),
//                           const SizedBox(width: 6),
//                           Text(
//                             controller.currentExam.value == null
//                                 ? ''
//                                 : controller.formatRemaining(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: _isLastMinute ? Colors.redAccent : Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//         body: _buildBody(),
//       );
//     });
//   }

//   Widget _buildBody() {
//     if (controller.examLoading.value) {
//       return const Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color?>(Color(0xFF6C55F7)),
//         ),
//       );
//     }
//     if (controller.examError.value.isNotEmpty) {
//       return Center(
//         child: Container(
//           margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(16),
//           decoration: _cardBox(),
//           child: Text(
//             controller.examError.value,
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.red, fontSize: 16),
//           ),
//         ),
//       );
//     }

//     final Exam? exam = controller.currentExam.value;
//     if (exam == null) {
//       return Center(
//         child: Container(
//           margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(16),
//           decoration: _cardBox(),
//           child: const Text('No exam data.'),
//         ),
//       );
//     }

//     // خريطة نتائج لكل سؤال بعد التصحيح
//     final Map<int, AnswerDetail> detailsByQid = {
//       for (final d in controller.submitResult.value?.details ?? []) d.questionId: d
//     };

//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         // بطاقة معلومات + زر البدء
//         Container(
//           decoration: _cardBox(),
//           padding: const EdgeInsets.all(14),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _sectionHeader(Icons.description_outlined, 'Exam Summary'),
//               const SizedBox(height: 10),
//               DefaultTextStyle(
//                 style: const TextStyle(color: Color(0xFF2B2B2B)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Exam #${exam.id} • Duration: ${exam.durationMinutes} min',
//                         style: const TextStyle(fontWeight: FontWeight.w600)),
//                     const SizedBox(height: 2),
//                     Text('Course ID: ${exam.courseId} • Questions: ${exam.questions.length}',
//                         style: const TextStyle(color: Colors.black54)),
//                     const SizedBox(height: 12),

//                     // زر البدء
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: controller.examStarted.value || controller.examCompleted.value
//                                 ? null
//                                 : () => controller.startExam(widget.courseId),
//                             icon: const Icon(Icons.play_arrow_rounded),
//                             label: Text(
//                               controller.examCompleted.value
//                                   ? 'Completed'
//                                   : controller.examStarted.value
//                                       ? 'Exam Started'
//                                       : 'Start Exam',
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: controller.examCompleted.value
//                                   ? Colors.grey
//                                   : controller.examStarted.value
//                                       ? Colors.grey
//                                       : const Color(0xFF13B4A3),
//                               elevation: 0,
//                               minimumSize: const Size(0, 46),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // سطر تاريخ البدء
//                     if (controller.lastStartedAt.value != null) ...[
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(Icons.schedule_outlined, size: 18),
//                           const SizedBox(width: 6),
//                           Text('started_at: ${controller.lastStartedAt.value!.toIso8601String()}',
//                               style: const TextStyle(fontSize: 12, color: Colors.black54)),
//                         ],
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // بطاقة النتيجة بعد التصحيح
//         if (controller.submitResult.value != null) ...[
//           const SizedBox(height: 12),
//           Container(
//             decoration: _cardBox(),
//             padding: const EdgeInsets.all(14),
//             child: Row(
//               children: [
//                 const Icon(Icons.emoji_events_outlined, color: Colors.deepPurple),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'Score: ${controller.submitResult.value!.score}',
//                     style: const TextStyle(fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],

//         const SizedBox(height: 12),

//         // الأسئلة + إبراز الصح/الخطأ
//         ...exam.questions.map((q) {
//           final selected = controller.selectedChoiceByQid[q.id];
//           final d = detailsByQid[q.id]; // قد يكون null قبل التصحيح
//           final bool showResult = d != null;
//           final bool correct = d?.isCorrect == true;

//           return Container(
//             margin: const EdgeInsets.only(bottom: 12),
//             decoration: _cardBox(),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text('Q${q.id}: ${q.questionText}',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 15)),
//                       ),
//                       if (showResult)
//                         Icon(
//                           correct ? Icons.check_circle : Icons.highlight_off,
//                           color: correct ? Colors.green : Colors.redAccent,
//                         ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   ...q.choices.map((c) {
//                     return Opacity(
//                       opacity: _isLocked ? 0.55 : 1,
//                       child: RadioListTile<int>(
//                         value: c.id,
//                         groupValue: selected,
//                         onChanged: _isLocked ? null : (v) => controller.selectChoice(q.id, c.id),
//                         title: Text(c.choiceText),
//                         dense: true,
//                         activeColor: const Color(0xFF6C55F7),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         tileColor: Colors.transparent,
//                       ),
//                     );
//                   }),
//                   if (showResult) ...[
//                     const SizedBox(height: 6),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: correct ? const Color(0xFFE8FFF5) : const Color(0xFFFFF0F0),
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: correct ? const Color(0xFFBEEFE0) : const Color(0xFFFFD5D5),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('إجابة الطالب: ${d!.studentChoice ?? "—"}'),
//                           Text('الإجابة الصحيحة: ${d.correctChoice ?? "—"}'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           );
//         }),

//         const SizedBox(height: 12),

//         // زر الإرسال
//         IgnorePointer(
//           ignoring: _isLocked || controller.submitLoading.value,
//           child: AnimatedOpacity(
//             duration: const Duration(milliseconds: 250),
//             opacity: _isLocked || controller.submitLoading.value ? 0.5 : 1,
//             child: SizedBox(
//               height: 50,
//               child: ElevatedButton.icon(
//                 onPressed: controller.submitExamAnswers,
//                 icon: controller.submitLoading.value
//                     ? const SizedBox(
//                         width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
//                     : const Icon(Icons.send),
//                 label: Text(
//                   controller.examCompleted.value ? 'Corrected' : 'Submit Answers',
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: controller.examCompleted.value
//                       ? Colors.grey
//                       : const Color(0xFF13B4A3),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         if (controller.examStarted.value && controller.remainingSeconds.value <= 0) ...[
//           const SizedBox(height: 10),
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFEEEE),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: const Color(0xFFFFD2D2)),
//             ),
//             child: Row(
//               children: const [
//                 Icon(Icons.lock_clock, color: Colors.redAccent),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'انتهى الوقت — تم قفل الإجابات.',
//                     style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2/Controller/dashboard_controller.dart';
import 'package:project_2/Model/exam.dart';

class ExamScreen extends StatefulWidget {
  final int courseId;            // معرّف الكورس الذي سنجلب امتحانه
  final String courseTitle;      // عنوان الكورس للعرض في AppBar

  const ExamScreen({
    super.key,
    required this.courseId,
    required this.courseTitle,
  });

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen>
    with SingleTickerProviderStateMixin {  // نستخدم Ticker للأنيميشن
  late final DashboardController controller;  // كنترولر الداشبورد (حالة الامتحان/الوقت...)
  late final AnimationController _shakeCtrl;  // متحكم أنيميشن الهزّة (للشريط عندما تبقى دقيقة)

  @override
  void initState() {
    super.initState();

    controller = Get.find<DashboardController>(); // نحصل على الكنترولر المسجّل في GetX

    // نجلب بيانات الامتحان لهذا الكورس ثم نحاول استعادة المؤقت إن كان بدأ سابقًا
    controller.fetchExamByCourseId(widget.courseId).then((_) {
      controller.restoreExamTimerIfAny(widget.courseId);
    });

    // تهيئة متحكم الأنيميشن الخاص بالهزّة
    _shakeCtrl = AnimationController(
      vsync: this,                                   // مزامنة الإطارات عبر Ticker
      duration: const Duration(milliseconds: 700),   // مدّة الذهاب (من 0 إلى 1)
    )
    // إضافة listener لحالة الأنيميشن (completed/dismissed/forward/reverse)
    ..addStatusListener((status) {
        // نحسب هنا إن كنا في آخر دقيقة — نقرأها في اللحظة الحالية
        final lastMinute = _isLastMinute;

        // إذا أنهى الأنيميشن الذهاب للأمام (وصل 1.0) → ارجع بالعكس (من 1.0 إلى 0.0)
        if (status == AnimationStatus.completed) _shakeCtrl.reverse();

        // إذا رجع لنقطة البداية (0.0) وانتهى (dismissed) *وما زلنا في آخر دقيقة*
        // → شغّله للأمام من جديد (لتكوين حلقة هزّ مستمرة أثناء آخر دقيقة فقط)
        if (status == AnimationStatus.dismissed && lastMinute)
          _shakeCtrl.forward();
      });
  }

  @override
  void dispose() {
    _shakeCtrl.dispose(); // تخلص من متحكم الأنيميشن عند الخروج
    super.dispose();
  }

  // حالة القفل: لا يمكن اختيار إجابات إذا انتهى الامتحان أو لم يبدأ أو الوقت خلص
  bool get _isLocked =>
      controller.examCompleted.value ||
      !controller.examStarted.value ||
      controller.remainingSeconds.value <= 0;

  // هل نحن في آخر دقيقة؟ True إذا الامتحان شغّال والوقت ≤ 60 ثانية
  bool get _isLastMinute =>
      controller.examStarted.value &&
      controller.remainingSeconds.value > 0 &&
      controller.remainingSeconds.value <= 60;

  // ديكور موحّد للكروت
  BoxDecoration _cardBox() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: const LinearGradient(
        colors: [Color(0xFFF7F3FF), Color(0xFFF9F8FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(color: const Color(0xFFE9E1FF)),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF7959F0).withOpacity(0.07),
          blurRadius: 14,
          spreadRadius: 0,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  // عنوان مقطع مع أيقونة
  Widget _sectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEDE8FF),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: const Color(0xFF6C55F7)),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg = const Color(0xFFFBF8FF); // لون خلفية عام
    return Obx(() {
      // تشغيل الأنيميشن إذا دخلنا آخر دقيقة ولم يكن شغالًا
      if (_isLastMinute && !_shakeCtrl.isAnimating) _shakeCtrl.forward();

      // إيقافه إذا خرجنا من آخر دقيقة وهو ما زال يعمل
      if (!_isLastMinute && _shakeCtrl.isAnimating) _shakeCtrl.stop();

      // حركة الهزّة: قيمة من -4 إلى +4 بكسل يمين/يسار
      final shake = Tween(begin: -4.0, end: 4.0).animate(
        CurvedAnimation(parent: _shakeCtrl, curve: Curves.easeInOut),
      );

      return Scaffold(
        backgroundColor: bg,
        // AppBar مع اهتزاز بسيط عندما تبقى دقيقة
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AnimatedBuilder(
            animation: shake,           // اسمع تغيّر قيمة الهزّة
            builder: (context, child) {
              return Transform.translate(
                // إذا آخر دقيقة: حرّك الـ AppBar أفقياً بقيمة shake.value
                offset: Offset(_isLastMinute ? shake.value : 0, 0),
                child: AppBar(
                  // لو آخر دقيقة: خلي اللون وردي فاتح لتحذير الوقت
                  backgroundColor: _isLastMinute
                      ? const Color(0xFFFFE6E6)
                      : const Color(0xFF7DB8FF),
                  elevation: 0.5,
                  title: Text(
                    'Exam • ${widget.courseTitle} (ID: ${widget.courseId})',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          // أيقونة التايمر — حمراء إذا آخر دقيقة
                          Icon(
                            Icons.timer_outlined,
                            color: _isLastMinute
                                ? Colors.redAccent
                                : Colors.black87,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          // الوقت المتبقي بصيغة mm:ss
                          Text(
                            controller.currentExam.value == null
                                ? ''
                                : controller.formatRemaining(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _isLastMinute
                                  ? Colors.redAccent
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        body: _buildBody(), // جسم الصفحة
      );
    });
  }

  // يبني جسم الصفحة حسب الحالة (تحميل/خطأ/لا يوجد/عرض الأسئلة)
  Widget _buildBody() {
    // حالة التحميل
    if (controller.examLoading.value) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color?>(Color(0xFF6C55F7)),
        ),
      );
    }

    // حالة الخطأ
    if (controller.examError.value.isNotEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: _cardBox(),
          child: Text(
            controller.examError.value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }

    // لا يوجد بيانات امتحان
    final Exam? exam = controller.currentExam.value;
    if (exam == null) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: _cardBox(),
          child: const Text('No exam data.'),
        ),
      );
    }

    // اختصارات للعرض
    final views = controller.answerViewsByQid;

    // قائمة المحتوى: ملخص/نتيجة/الأسئلة/زر الإرسال/تنبيه انتهاء الوقت
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // بطاقة ملخص الامتحان + زر البدء
        Container(
          decoration: _cardBox(),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader(Icons.description_outlined, 'Exam Summary'),
              const SizedBox(height: 10),
              DefaultTextStyle(
                style: const TextStyle(color: Color(0xFF2B2B2B)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exam #${exam.id} • Duration: ${exam.durationMinutes} min',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Course ID: ${exam.courseId} • Questions: ${exam.questions.length}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            // تعطيل زر البدء إذا الامتحان بدأ أو اكتمل
                            onPressed: controller.examStarted.value ||
                                    controller.examCompleted.value
                                ? null
                                : () => controller.startExam(widget.courseId),
                            icon: const Icon(Icons.play_arrow_rounded),
                            label: Text(
                              controller.examCompleted.value
                                  ? 'Completed'
                                  : controller.examStarted.value
                                      ? 'Exam Started'
                                      : 'Start Exam',
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: controller.examCompleted.value
                                  ? Colors.grey
                                  : controller.examStarted.value
                                      ? Colors.grey
                                      : const Color(0xFF13B4A3),
                              elevation: 0,
                              minimumSize: const Size(0, 46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // إن وجد وقت بدء من السيرفر اعرضه
                    if (controller.lastStartedAt.value != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.schedule_outlined, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            'started_at: ${controller.lastStartedAt.value!.toIso8601String()}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),

        // عرض النتيجة بعد التصحيح إن وُجدت
        if (controller.submitResult.value != null) ...[
          const SizedBox(height: 12),
          Container(
            decoration: _cardBox(),
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                const Icon(Icons.emoji_events_outlined,
                    color: Colors.deepPurple),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Score: ${controller.submitResult.value!.score}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 12),

        // قائمة الأسئلة
        ...exam.questions.map((q) {
          final selected = controller.selectedChoiceByQid[q.id]; // اختيار الطالب
          final view = views[q.id];                              // عرض موحّد للطالب/الصحيح
          final showResult = controller.submitResult.value != null; // هل أظهر التصحيح؟
          // final correct = view?.isCorrect == true; // (لو فعّلتها لاحقًا)

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: _cardBox(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // عنوان السؤال
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Q${q.id}: ${q.questionText}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // خيارات السؤال كـ RadioListTile
                  ...q.choices.map((c) {
                    return Opacity(
                      opacity: _isLocked ? 0.55 : 1, // تخفيض الشفافية إن كان مقفل
                      child: RadioListTile<int>(
                        value: c.id,               // قيمة هذا الخيار
                        groupValue: selected,      // القيمة المختارة للسؤال
                        onChanged: _isLocked       // تعطيل التغيير إذا مقفل
                            ? null
                            : (v) => controller.selectChoice(q.id, c.id),
                        title: Text(c.choiceText),
                        dense: true,
                        activeColor: const Color(0xFF6C55F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Colors.transparent,
                      ),
                    );
                  }),

                  // إن كنا في وضع عرض النتيجة بعد التصحيح: أظهر “إجابة الطالب / الصحيحة”
                  if (showResult) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // بإمكانك تلوينها حسب الصح/الخطأ لاحقًا
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            // لون الحدود يمكن تخصيصه لاحقًا
                            ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('إجابة الطالب: ${view?.studentChoiceText ?? "—"}'),
                          Text('الإجابة الصحيحة: ${view?.correctChoiceText ?? "—"}'),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),

        const SizedBox(height: 12),

        // زر إرسال الإجابات — يُقفل ويخفّي إن انتهى الوقت/الامتحان/جاري إرسال
        IgnorePointer(
          ignoring: _isLocked || controller.submitLoading.value, // تجاهل النقرات
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _isLocked || controller.submitLoading.value ? 0.5 : 1,
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: controller.submitExamAnswers, // يرسل للإصلاح
                icon: controller.submitLoading.value
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  controller.examCompleted.value ? 'Corrected' : 'Submit Answers',
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: controller.examCompleted.value
                      ? Colors.grey
                      : const Color(0xFF13B4A3),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
        ),

        // لو الوقت خلص والامتحان كان بدأ → أظهر تنبيه “انتهى الوقت”
        if (controller.examStarted.value &&
            controller.remainingSeconds.value <= 0) ...[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEEEE),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFD2D2)),
            ),
            child: Row(
              children: const [
                Icon(Icons.lock_clock, color: Colors.redAccent),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'انتهى الوقت — تم قفل الإجابات.',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
