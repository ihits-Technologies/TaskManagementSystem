import 'package:flutter/material.dart';
import 'package:tms/app_colors/app_colors.dart';
import '../../../../model/Action/ActionItem.dart';

class ActionDetailScreen extends StatefulWidget {
  final ActionItem action;

  const ActionDetailScreen({Key? key, required this.action}) : super(key: key);

  @override
  _ActionDetailScreenState createState() => _ActionDetailScreenState();
}

class _ActionDetailScreenState extends State<ActionDetailScreen> {
  final TextEditingController _actionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
        title: const Text(
          'Actions',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.action.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.action.date,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: AppColors.AppBarColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _showAddActionBottomSheet(context);
                  },
                  child: const Text(
                    '+  Add Action',
                    style: TextStyle(color: AppColors.AppBarColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.action.actionsTaken.length,
              itemBuilder: (context, index) {
                final actionTaken = widget.action.actionsTaken[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(actionTaken),
                    subtitle: Text(widget.action.date),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // void _showAddActionBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
  //     ),
  //     builder: (BuildContext context) {
  //       return FractionallySizedBox(
  //         heightFactor: 0.5, // Adjust to make the box bigger
  //         child: Stack(
  //           // Use Stack for overlapping elements
  //           children: [
  //             Container(
  //               // Existing content of the bottom sheet
  //               padding: const EdgeInsets.all(25.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         height: 5, // Height of the line
  //                         color: Colors.grey,
  //                         width: MediaQuery.of(context).size.width *
  //                             0.4, // Adjust width as needed
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 40.0), // Adjust spacing as needed
  //                   Expanded(
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10.0),
  //                         color: Colors.white,
  //                         border: Border.all(
  //                             color: AppColors.AppBarColor, width: 1.0),
  //                       ),
  //                       padding: const EdgeInsets.all(20.0),
  //                       child: const Column(
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Icon(Icons.message,
  //                                   color: AppColors.AppBarColor),
  //                               SizedBox(width: 10.0),
  //                               Text(
  //                                 'Add new Functionalities',
  //                                 style: TextStyle(
  //                                   fontSize: 18.0,
  //                                   color: Colors.grey,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           SizedBox(height: 20.0), // Adjust spacing as needed
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20.0), // Adjust spacing as needed
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       setState(() {
  //                         widget.action.actionsTaken
  //                             .add(_actionController.text);
  //                         _actionController.clear();
  //                       });
  //                       Navigator.of(context).pop();
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: AppColors.AppBarColor,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(20.0),
  //                       ),
  //                       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  //                     ),
  //                     child: const Text('Submit'),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             // Add a close button on top right
  //             Positioned(
  //               top: 10.0, // Adjust top padding as needed
  //               right: 10.0, // Adjust right padding as needed
  //               child: IconButton(
  //                 icon: const Icon(
  //                   Icons.close,
  //                   size: 23.0,
  //                   color: AppColors.AppBarColor,
  //                 ),
  //                 onPressed: () => Navigator.of(context).pop(),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  void _showAddActionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5, // Adjust to make the box bigger
          child: Stack(
            // Use Stack for overlapping elements
            children: [
              Container(
                // Existing content of the bottom sheet
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5, // Height of the line
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0), // Adjust spacing as needed
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: AppColors.AppBarColor, width: 1.0),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.message, color: AppColors.AppBarColor),
                                SizedBox(width: 10.0),
                                Text(
                                  'Add new Functionalities',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0), // Adjust spacing as needed
                            TextField( // Add a textfield for functionalities
                              controller: _actionController,
                              decoration: InputDecoration(
                                hintText: 'Enter functionality details...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              maxLines: 3, // Allow multiline input
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0), // Adjust spacing as needed
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Save functionality details
                          widget.action.actionsTaken.add(_actionController.text);
                          _actionController.clear();
                        });
                        // Update and show ActionDetailScreen
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActionDetailScreen(action: widget.action),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.AppBarColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              // Add a close button on top right
              Positioned(
                top: 10.0, // Adjust top padding as needed
                right: 10.0, // Adjust right padding as needed
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 23.0,
                    color: AppColors.AppBarColor,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
