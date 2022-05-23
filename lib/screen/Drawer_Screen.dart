import 'package:flutter/material.dart';
import 'package:school_management/const/cont.dart';

class SchoolDrawer extends StatelessWidget {
   SchoolDrawer({Key? key}) : super(key: key);
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.builder(
          controller: controller,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: SchoolDrawer1().image1.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SchoolDrawer1().route1[index]));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage(
                            SchoolDrawer1().image1[index],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          SchoolDrawer1().iconName1[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
