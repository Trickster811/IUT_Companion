import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';

class FirebaseUpload extends StatefulWidget {
  @override
  State<FirebaseUpload> createState() => _FirebaseUploadState();
}

class _FirebaseUploadState extends State<FirebaseUpload> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('notifications_images/');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<FirebaseFile>>(
            future: futureFiles,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Some error occured!'),
                    );
                  } else {
                    final files = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeader(files.length),
                        SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index) {
                              final file = files[index];
                              return buildFile(context, file);
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  
              }
              
            }),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
      leading: ClipOval(
        child: Image.network(
          file.url,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(file.name),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          )));

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.blue,
        leading: Container(
          width: 52,
          height: 52,
        ),
      );
}
