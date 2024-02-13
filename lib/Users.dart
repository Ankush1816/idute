import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idute/Firestoreservices.dart';

Users UsersWidget = Users();

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Users",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.stacked_bar_chart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: Firestoreservices.getSellers(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              var data = snapshot.data?.docs[0];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: Firestoreservices.getProducts("t"),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('nothing to show'),
                        );
                      } else {
                        var data = snapshot.data!.docs;
                        return Container(
                          color: Colors.black87,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: GridView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            crossAxisSpacing: 2,
                                            mainAxisSpacing: 4,
                                            mainAxisExtent: 70),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: ListTile(
                                            leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    "${data[index]['p_image'][0]}")),
                                            title: const Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "User name",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "Tech",
                                                      style: TextStyle(
                                                          color: Colors.white,fontWeight: FontWeight.w200),
                                                    ),
                                                  ],
                                                ),


                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Details",
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                        Text(
                                                          "Company",
                                                          style: TextStyle(
                                                              color: Colors.white,fontWeight: FontWeight.w200),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 10,),
                                                    CircleAvatar(backgroundColor: Colors.grey,),
                                                    SizedBox(width: 5,),
                                                    Icon(Icons.more_vert_outlined,color: Colors.white,)
                                                  ],
                                                )
                                              ],
                                            )),
                                      );
                                    }),
                                // child: Column(
                                //   children:
                                //   List.generate(
                                //     data.length,
                                //         (index) =>
                                //         Padding(
                                //           padding:
                                //           const EdgeInsets.only(right: 0.0),
                                //           child: Stack(
                                //             alignment: Alignment.topRight,
                                //             children: [
                                //               CatagoryButtom("${data[index]['p_img']}", "${data[index]['p_name']}".length > 15 ? "${data[index]['p_name']}".substring(0, 15) : "${data[index]['p_name']}", 190, 125, 10, ''),
                                //               Image.network('https://firebasestorage.googleapis.com/v0/b/bylaive-aeeeb.appspot.com/o/Admin_images%2Fdownload%20(1)%20(1).png?alt=media&token=4696059f-16b1-4bb6-bc31-4ce95ec90dbd',width: 30,height: 30,)
                                //             ],
                                //           )
                                //               .box
                                //               .white
                                //               .margin(EdgeInsets.symmetric(horizontal: 0))
                                //               .roundedSM
                                //               .make()
                                //               .onTap(() {
                                //             jumpToLivePage(context,
                                //                 isHost: false,
                                //                 Liveid: "${data[index]['addedby']}");
                                //           }),
                                //         ),
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
