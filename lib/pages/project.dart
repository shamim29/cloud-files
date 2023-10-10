import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {

  final String folderName;

  ProjectPage({super.key, required this.folderName});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            alignment: Alignment.bottomCenter,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chatbox",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Project",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.05),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(
                      width: 10,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.05),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.share_outlined,
                          size: 28,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 25, top: 25,),
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildAvatar('Mikel','mikel'),
                buildAvatar('Adam','adam'),
                buildAvatar('Bob','bob'),
                buildAvatar('James','james'),
                buildAvatar('Luka','luka'),
                buildAvatar('Jhon','jhon'),
              ],
            ),
          ),

          Divider(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.all(25),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    "Files",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Create new",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                ),
                SizedBox(height: 15,),

                buildFileRow("Assets",true),
                buildFileRow("Brandbook",false),
                buildFileRow("Design",false),
                buildFileRow("Moodboards",false),
                buildFileRow("Wirefreams",true),
                buildFileRow("Other",false),

              ],
            ),
          )
        ],
      ),

      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 7,
              blurRadius: 1,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: (){
          },
          child: Icon(Icons.add,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Folder",
          ),
        ],
      ),

    );
  }

  Container buildFileRow(String folderName, bool showAlert) {
    return Container(
                margin: EdgeInsets.only(bottom: 8,),
                padding: EdgeInsets.symmetric(horizontal: 20,),
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Icon(
                              Icons.folder,
                              color: Colors.blue[200],
                            ),

                            if(showAlert)

                            Positioned(
                              right: -1,
                              top: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  radius: 3.5,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12,),
                        Text(
                          folderName,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.more_vert_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
  }

  Widget buildAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: Image.asset('lib/images/$filename.jpg').image,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
    );
  }
}
