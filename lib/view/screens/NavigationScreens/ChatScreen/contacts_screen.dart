import 'package:flutter/material.dart';
import 'package:tms/app_colors/app_colors.dart';
import '../../../../model/contacts/Contact.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> sampleContacts = []; // Define sampleContacts here

  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    // Simulate API call by waiting for 1 second
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      sampleContacts = [
        Contact(
          name: 'John Doe',
          imageUrl: 'https://example.com/john_doe.jpg',
          isOnline: true,
        ),
        Contact(
          name: 'Jane Smith',
          imageUrl: 'https://example.com/jane_smith.jpg',
          isOnline: false,
        ),
        Contact(
          name: 'John Doe',
          imageUrl: 'https://example.com/john_doe.jpg',
          isOnline: true,
        ),
        Contact(
          name: 'Jane Smith',
          imageUrl: 'https://example.com/jane_smith.jpg',
          isOnline: false,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5), // Same color as chat home screen
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey, // Same color as chat home screen
                      ),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey, // Same color as chat home screen
                      ),
                      onPressed: () {
                        setState(() {
                          searchText = '';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 16.0),
          //     child: Container(
          //       height: 60.0,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12.0),
          //         border: Border.all(
          //           color: Colors.grey.withOpacity(0.5),
          //         ),
          //       ),
          //       child: Row(
          //         children: [
          //           IconButton(
          //             icon: const Icon(Icons.search),
          //             onPressed: () {},
          //           ),
          //           Expanded(
          //             child: TextField(
          //               decoration: const InputDecoration(
          //                 hintText: 'Search',
          //                 border: InputBorder.none,
          //               ),
          //               onChanged: (value) {
          //                 setState(() {
          //                   searchText = value;
          //                 });
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: sampleContacts.length,
              itemBuilder: (context, index) {
                final contact = sampleContacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28.0,
                    backgroundImage: NetworkImage(contact.imageUrl),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(
                    contact.isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: contact.isOnline ? Colors.green : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    // Handle tap on contact here
                    // You can start a new chat with the selected contact
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
