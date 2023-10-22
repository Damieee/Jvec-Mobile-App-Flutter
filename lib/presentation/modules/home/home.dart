// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../core/extentions.dart';
// import '../presentation/modules/customers/home/widgets/vendor_floating_container.dart';
// import '../presentation/utils/colors.dart';
// import '../presentation/utils/constants.dart';
// import '../presentation/utils/values.dart';
// import '../presentation/widgets/rounded_image.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final List<Widget> _pages = <Widget>[
//     WorkingHour(),
//   ];

//   final data = {
//     "Lmao": [
//       // WorkingHour(),
//       MealListCard(),
//       MealListCard(),
//       MealListCard(),
//       MealListCard(),
//       MealListCard(),
//     ],
//     "Category A": [
//       MealListCard(),
//       // "Item 2 (A)",
//       // "Item 3 (A)",
//       // "Item 4 (A)",
//     ],
//     "Category B": [
//       MealListCard(),
//       // "Item 1 (B)",
//       // "Item 2 (B)",
//     ],
//     "Category C": [
//       MealListCard(),
//       // "Item 1 (C)",
//       // "Item 2 (C)",
//       // "Item 3 (C)",
//       // "Item 4 (C)",
//       // "Item 5 (C)",
//     ],
//     "Category D": [
//       MealListCard(),
//       // "Item 1 (D)",
//       // "Item 2 (D)",
//       // "Item 3 (D)",
//       // "Item 4 (D)",
//       // "Item 5 (D)",
//       // "Item 6 (D)",
//       // "Item 7 (D)",
//       // "Item 8 (D)",
//       // "Item 9 (D)",
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.offset,
//       body: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               spacer(h: 50),
//               WorkingHour(),
//               spacer(h: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Text(
//                   'What customers are saying',
//                   style: Get.textTheme.bodyText1,
//                 ),
//               ),
//               spacer(h: 20),
//               SizedBox(
//                 height: 160,
//                 child: ListView.builder(
//                     itemCount: 5,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, snapshot) {
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: CustomerReview(),
//                       );
//                     }),
//               ),
//               spacer(h: 30),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.only(
//                     left: 20,
//                     right: 20,
//                     top: 60,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: ScrollableListTabScroller(
//                     tabBuilder:
//                         (BuildContext context, int index, bool active) =>
//                             Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Text(
//                         data.keys.elementAt(index),
//                         style: !active
//                             ? null
//                             : TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.primary,
//                               ),
//                       ),
//                     ),
//                     itemCount: data.length,
//                     // headerContainerBuilder: (context, child) => Padding(
//                     //   padding: const EdgeInsets.all(8.0),
//                     //   child: WorkingHour(),
//                     // ),

//                     itemBuilder: (BuildContext context, int index) => Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             data.keys.elementAt(index),
//                             style: Get.textTheme.titleLarge!.copyWith(
//                                 fontSize: 16, fontWeight: FontWeight.w600),
//                           ),
//                           spacer(h: 10),
//                           ...data.values.elementAt(index)
//                           // ...data.values
//                           //     .elementAt(index)
//                           //     .asMap()
//                           //     .map(
//                           //       (index, value) => MapEntry(
//                           //         index,
//                           //         // ListTile(
//                           //         //   leading: Container(
//                           //         //     height: 40,
//                           //         //     width: 40,
//                           //         //     decoration: BoxDecoration(
//                           //         //         shape: BoxShape.circle, color: Colors.grey),
//                           //         //     alignment: Alignment.center,
//                           //         //     child: Text(index.toString()),
//                           //         //   ),
//                           //         //   title: Text(value.toString()),
//                           //         // ),
//                           //         WorkingHour(),
//                           //       ),
//                           //     )
//                           //     .values
//                           // MealListCard(),
//                           // WorkingHour(),
//                           // WorkingHour(),
//                           // WorkingHour(),
//                           // WorkingHour(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             top: 100,
//             left: 50,
//             right: 50,
//             child: Align(
//               alignment: Alignment.center,
//               child: VendorFloatingContainer(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomerReview extends StatelessWidget {
//   const CustomerReview({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.8,
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               ImageAsset('assets/images/user_avatar.png'),
//               spacer(w: 10),
//               Text(
//                 'Joke',
//                 style: Get.textTheme.bodyText1!.copyWith(
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               RatingBarIndicator(
//                 rating: 5.0,
//                 itemBuilder: (context, index) => Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 itemCount: 5,
//                 itemSize: 12.0,
//                 direction: Axis.horizontal,
//               ),
//               spacer(w: 10),
//               Text(
//                 '20/Nov/2021',
//                 style: Get.textTheme.bodyText1!.copyWith(
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//           spacer(h: 10),
//           Text('The food was delicious and amazing ,I love it',
//               style: Get.textTheme.bodyMedium),
//         ],
//       ),
//     );
//   }
// }

// class WorkingHour extends StatelessWidget {
//   const WorkingHour({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '8.3 km',
//                 style: Get.textTheme.bodySmall,
//               ),
//               Divider(
//                 thickness: 1,
//               ),
//               spacer(),
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.shade200.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset('assets/icons/fi-rr-info.svg'),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Pickup not available',
//                       style: TextStyle(
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SvgPicture.asset('assets/icons/fi-rr-shop.svg'),
//                   spacer(w: 10),
//                   Text(
//                     'Working Hours',
//                     style: Get.textTheme.bodySmall!.copyWith(
//                       color: Colors.black,
//                     ),
//                   ),
//                   Spacer(),
//                   ImageIcon2.asset('assets/icons/angle_down.png'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MealListCard extends StatelessWidget {
//   const MealListCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Pasta fry',
//                     style: Get.textTheme.bodyText1!.copyWith(fontSize: 16),
//                   ),
//                   spacer(h: 5),
//                   Text(
//                     'Fried yam served with sauce',
//                     style: Get.textTheme.bodyText2!.copyWith(fontSize: 14),
//                   ),
//                   spacer(h: 15),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: AppPadding.p16, vertical: AppPadding.p8),
//                       decoration: BoxDecoration(
//                         color: AppColors.primary,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Text(
//                         '₦500',
//                         style: Get.textTheme.bodySmall!.copyWith(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               CustomRoundedImage('assets/images/sample_food.jpg'),
//             ],
//           ),
//           spacer(h: 10),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }

// class ImageAsset extends StatelessWidget {
//   const ImageAsset(
//     this.url, {
//     Key? key,
//     this.radius = 16,
//     this.height = 50,
//     this.width = 50,
//   }) : super(key: key);

//   final String url;
//   final double radius;
//   final double height;
//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(radius), // Image border
//       child: Image.asset(
//         url,
//         height: height,
//         width: width,
//         fit: BoxFit.cover,
//         errorBuilder: (context, t, s) => Container(
//           color: AppColors.outline,
//           height: height,
//           width: width,
//           child: Text(
//             "😢 \n Could't load",
//             style: Get.textTheme.bodyMedium?.copyWith(
//               fontSize: 10,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
