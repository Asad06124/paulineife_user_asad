import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:status_view/status_view.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 2.sp),
            child: Text(
              'Roll Upp',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2A70C8),
                  fontFamily: 'Ubuntu-Light'),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 2.sp),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.mail),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height / 10),
            child: Expanded(
                child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(4.sp),
                  child: StatusView(
                    radius: 25.sp,
                    spacing: 8.sp,
                    strokeWidth: 2,
                    indexOfSeenStatus: 3,
                    numberOfStatus: 10,
                    padding: 4,
                    centerImageUrl:
                        'https://scontent.fmux2-1.fna.fbcdn.net/v/t39.30808-1/272115146_318883370152289_959529854943140445_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeER8e_80iKZdwjcaOaYxI1TpAWJ6Ibe0aGkBYnoht7RoZqJnOjYQAQ8zZmMfQAlOpcuioT9QJUL6AWxPJjtPD4c&_nc_ohc=PbdR0oi8fO4AX-4bc1j&_nc_oc=AQlJbCFHjlYmIgzWZ16z2DhDZDL3Tqq8R1tDCrbL2sXH0GTClKrsojCaWXETXFnfeuc&_nc_ht=scontent.fmux2-1.fna&oh=00_AfDDCBXpYFxdoHdqf5NwfzCB03Buq9J3bUP3KUnqO17WCQ&oe=63F67873',
                    seenColor: Colors.grey,
                    unSeenColor: Colors.red,
                  ),
                );
              },
            )),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Container(
                height: size.height / 1.7 + 15,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: DecorationImage(
                      image: AssetImage('assets/images/post.png'),
                      fit: BoxFit.cover),
                ),
                child: ListTile(
                  leading: Image(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                  title: Text(
                    'Asad Ullah',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSansR',
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    '2 hours ago',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSansR',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/refresh.svg'),
                  SvgPicture.asset('assets/images/repeat.svg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
