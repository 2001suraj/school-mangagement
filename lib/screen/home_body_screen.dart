import 'package:flutter/material.dart';

import '../const/cont.dart';

class SchoolHomePageBodyPart extends StatelessWidget {
  const SchoolHomePageBodyPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                width: double.infinity,
                height: 90,
                color: Colors.green,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 95,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Roll No : 2383'),
                        ),
                      ),
                    ),
                    Positioned(
                      top:20,
                        left: 20,
                        child: CircleAvatar(
                          radius: 31,
                          child: Container(
                            width:55,
                            height:55,
                            decoration:BoxDecoration(
                              color: Colors.white,
                              shape:BoxShape.circle),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/profile.png'),
                                ),
                              ),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left:98.0, top:40),
                          child: Text('Ram Hari',style: TextStyle(fontSize: 24, fontWeight:FontWeight.bold, color: Colors.white38),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:258.0, top:30),
                          child: Text('Section : B', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:258.0,top:60),
                          child: Text('Standard : 5th', style: TextStyle(fontWeight: FontWeight.bold),),
                        )

                  ],
                )),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: SchoolDrawer1().route1.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SchoolDrawer1().route1[index])),
                  child: Container(
                    color: Colors.amberAccent,
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image:
                                    AssetImage(SchoolDrawer1().image1[index]),
                              ),
                            ),
                            height: 190,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, bottom: 20),
                            child: Text(SchoolDrawer1().iconName1[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
