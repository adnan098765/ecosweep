// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class RewardsScreen extends StatefulWidget {
//   const RewardsScreen({super.key});

//   @override
//   State<RewardsScreen> createState() => _RewardsScreenState();
// }

// class _RewardsScreenState extends State<RewardsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Refer & Earn',
//           style: TextStyle(fontSize: 22, color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: height * 0.36,
//               width: width,
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Refer and earn SAR50',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'Invite your friends to EcoSweeps & you\nboth receive SAR50',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey.shade800,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: width * 0.068),
//                         Image(
//                           image: const AssetImage('assets/gif.jpg'),
//                           height: height * 0.084,
//                           width: width * 0.2,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     const Row(
//                       children: [
//                         Expanded(
//                           child: DottedLine(
//                             dashLength: 4.0,
//                             dashGapLength: 2.0,
//                             lineThickness: 2.0,
//                             dashColor: Colors.grey,
//                             dashRadius: 4.0,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             'Refer via',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                         Expanded(
//                           child: DottedLine(
//                             dashLength: 4.0,
//                             dashGapLength: 2.0,
//                             lineThickness: 2.0,
//                             dashColor: Colors.grey,
//                             dashRadius: 4.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.03),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CircleAvatar(
//                           maxRadius: 26,
//                           backgroundImage: AssetImage('assets/sms.jpg'),
//                         ),
//                         CircleAvatar(
//                           maxRadius: 26,
//                           backgroundImage: AssetImage('assets/whts.jpg'),
//                         ),
//                         CircleAvatar(
//                           maxRadius: 26,
//                           backgroundImage: AssetImage('assets/more.jpg'),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: height * 0.03),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               width: width,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     spreadRadius: 5,
//                   ),
//                 ],
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'How it works?',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.020),
//                     SizedBox(
//                       width: width * .5,
//                       child: const DottedLine(
//                         dashLength: 4.0,
//                         dashGapLength: 2.0,
//                         lineThickness: 2.0,
//                         dashColor: Colors.grey,
//                         dashRadius: 4.0,
//                       ),
//                     ),
//                     SizedBox(height: height * .03),
//                     TimelineTile(
//                       alignment: TimelineAlign.start,
//                       indicatorStyle: IndicatorStyle(
//                         indicator: Container(
//                           width: 20,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade400,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Center(
//                             child: Text(
//                               '1',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(6),
//                       ),
//                       endChild: Container(
//                         padding: const EdgeInsets.all(8.0),
//                         child: const Text('Invite your friends & get rewarded'),
//                       ),
//                       beforeLineStyle: const LineStyle(
//                         thickness: 0,
//                       ),
//                     ),
//                     TimelineTile(
//                       alignment: TimelineAlign.start,
//                       indicatorStyle: IndicatorStyle(
//                         indicator: Container(
//                           width: 20,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade400,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Center(
//                             child: Text(
//                               '2',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(6),
//                       ),
//                       endChild: Container(
//                         padding: const EdgeInsets.all(8.0),
//                         child: const Text(
//                             'They get SAR 50 towards their first service \nafter clicking the invitation link'),
//                       ),
//                       beforeLineStyle: LineStyle(
//                         color: Colors.grey.shade400,
//                         thickness: 5,
//                       ),
//                     ),
//                     TimelineTile(
//                       alignment: TimelineAlign.start,
//                       isLast: true,
//                       indicatorStyle: IndicatorStyle(
//                         indicator: Container(
//                           width: 20,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade400,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Center(
//                             child: Text(
//                               '3',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(6),
//                       ),
//                       endChild: Container(
//                         padding: const EdgeInsets.all(8.0),
//                         child: const Text(
//                             'You get SAR 50 after they complete the\nservice'),
//                       ),
//                       beforeLineStyle: LineStyle(
//                         color: Colors.grey.shade400,
//                         thickness: 5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.030,
//             ),
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   height: height * 0.020,
//                   width: width * 0.020,
//                   decoration: const BoxDecoration(
//                       color: Colors.blue, shape: BoxShape.circle),
//                 ),
//                 const Text(
//                   'Terms and conditions ',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 Container(
//                   height: height * 0.020,
//                   width: width * 0.020,
//                   decoration: const BoxDecoration(
//                       color: Colors.blue, shape: BoxShape.circle),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Text('FAQs', style: TextStyle(color: Colors.blue))
//               ],
//             ),
//             SizedBox(
//               height: height * .060,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Text(
//                 'You are yet to earn any screatch cards',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Text(
//                 'Start refering to get rewards',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             const DottedLine(
//               dashLength: 4.0,
//               dashGapLength: 2.0,
//               lineThickness: 2.0,
//               dashColor: Colors.grey,
//               dashRadius: 4.0,
//             ),
//             SizedBox(
//               height: height * .020,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Image(
//                     image: const AssetImage('assets/gif.jpg'),
//                     height: height * .030,
//                   ),
//                   SizedBox(
//                     width: width * 0.020,
//                   ),
//                   const Text(
//                     'Earn SAR50 on every successful referral',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: height * 0.060,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
