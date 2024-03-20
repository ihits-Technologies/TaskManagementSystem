// import 'package:flutter/material.dart';
// import 'package:tms/view/screens/NavigationScreens/ChatScreen/ChatDetail.dart';
// import 'dart:io';
//
// import '../../../../app_colors/app_colors.dart';
// import '../../../../model/chat/chat_model.dart';
// import 'contacts_screen.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final List<Chat> chats = [
//     Chat(
//         name: 'Abin',
//         imageUrl:
//         'https://images-na.ssl-images-amazon.com/images/I/B1kas65AWPS.png',
//         lastMessage: 'Hey there!',
//         lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
//         hasUnreadMessages: true,
//         isOnline: false,
//         id: 'chat1'),
//     Chat(
//         name: 'indrajith',
//         imageUrl:
//         'https://images.hdqwalls.com/wallpapers/marshmello-2020-j6.jpg',
//         lastMessage: 'Hey there!',
//         lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
//         hasUnreadMessages: true,
//         isOnline: true,
//         id: 'chat2'),
//     Chat(
//       name: 'Gokul',
//       imageUrl:
//       'https://yt3.googleusercontent.com/nEvjTESk-QMG4mJolP8uwSrfQ1mAOwG-2l5nwJASSwHN2785kxrek4lpM_LL7Rg8HYK5R-dQ1A=s900-c-k-c0x00ffffff-no-rj', // Replace with a valid image URL
//       lastMessage: 'Hey there!',
//       lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
//       hasUnreadMessages: true, id: 'chat3',
//     ),
//     // Add more chat data with valid image URLs
//   ];
//   String searchText = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: Container(
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.0),
//                   border: Border.all(
//                     color: AppColors.AppBarColor.withOpacity(0.5),
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.search,
//                           color: AppColors.AppBarColor),
//                       onPressed: () {},
//                     ),
//                     Expanded(
//                       child: TextField(
//                         decoration: const InputDecoration(
//                           hintText: 'search',
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: InputBorder.none,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             searchText = value;
//                           });
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.contact_page,
//                         color: AppColors.AppBarColor,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const ContactsScreen()),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.close,
//                         color: AppColors.AppBarColor,
//                       ),
//                       onPressed: () => setState(() => searchText = ''),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: chats.length,
//               itemBuilder: (context, index) {
//                 final chat = chats[index];
//                 if (searchText.isNotEmpty &&
//                     !chat.name
//                         .toLowerCase()
//                         .contains(searchText.toLowerCase())) {
//                   return Container();
//                 }
//
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Colors.grey.withOpacity(0.2),
//                       ),
//                     ),
//                   ),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     leading: CircleAvatar(
//                       radius: 28.0,
//                       backgroundImage: NetworkImage(
//                         chat.imageUrl,
//                         // Bypassing certificate verification
//                         headers: {
//                           HttpHeaders.userAgentHeader: 'Your User Agent',
//                         },
//                       ),
//                     ),
//                     title: Text(chat.name),
//                     subtitle: Text(
//                       chat.lastMessage,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     trailing: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         if (chat.isOnline)
//                           Container(
//                             width: 40,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             alignment: Alignment.center,
//                             child: const Text(
//                               'Online',
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 12),
//                             ),
//                           ),
//                         const SizedBox(height: 4),
//                         Text(
//                           DateFormat('mm').format(chat.lastMessageTime) +
//                               " m ago",
//                           style: const TextStyle(fontSize: 12.0),
//                         ),
//                       ],
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChatDetail(
//                               chatId: chat.id,
//                               chatName: chat.name,
//                               chatImageUrl: chat.imageUrl,
//                             ),
//                           ));
//                       // Add onTap functionality here
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
