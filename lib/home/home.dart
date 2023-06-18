import 'package:banao_task1/home/card1.dart';
import 'package:banao_task1/home/card2.dart';
import 'package:banao_task1/home/card3.dart';
import 'package:banao_task1/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:banao_task1/home/curved_rec.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List lessons = [];
  List programs = [];
  var isLoadingLessons=true;
  var isLoadingPrograms=true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final responseLesson= await RemoteService.fetchData('https://632017e19f82827dcf24a655.mockapi.io/api/lessons');
    final responseProgram= await RemoteService.fetchData('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
    if(responseLesson!=null && responseProgram!=null){
      setState(() {
        lessons=responseLesson;
        programs=responseProgram;
      });
    }
    else{
      showErrorMsg('Unable to Fetch Data');
    }
    setState(() {
      isLoadingLessons=false;
      isLoadingPrograms=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 15,left: 15,bottom: 30,top: 20),
            color: Color(0xffeEF3FD),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Priya!',style: TextStyle(fontFamily: 'Lora',fontStyle:FontStyle.normal,fontWeight: FontWeight.w500,fontSize: 22,color: Color(0xff000000)),),
                SizedBox(height: 5),
                Text('What do you wanna learn today?',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xff6D747A)),),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCurvedRectangularBox(
                      icon: Icons.book,
                      text: 'Programs',
                      color: Color(0xff598BED),
                    ),
                    SizedBox(width: 10,),
                    buildCurvedRectangularBox(
                      icon: Icons.question_mark_rounded,
                      text: 'Get help',
                      color: Color(0xff598BED),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCurvedRectangularBox(
                      icon: Icons.menu_book_sharp,
                      text: 'Learn',
                      color: Color(0xff598BED),
                    ),
                    SizedBox(width: 10,),
                    buildCurvedRectangularBox(
                      icon: Icons.bar_chart_rounded,
                      text: 'DD Tracker',
                      color: Color(0xff598BED),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:20,bottom: 20,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Programs for you',style: TextStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,fontSize: 19,color: Color(0xff000000)),),
                      Row(
                        children: [
                          Text('View all',style: TextStyle(color: Color(0xff6D747A)),),
                          SizedBox(width: 3,),
                          Icon(Icons.arrow_forward,size: 15,color: Color(0xff6D747A)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible: isLoadingPrograms,
                  child: Center(child: CircularProgressIndicator()),
                  replacement: Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: programs?.length,
                      itemBuilder: (ctx, index) {
                        final program = programs[index] as Map;
                        return Card1(imageUrl: 'assets/images/card1.png', title: '${program['category']}', description: "${program['name']}",sub:'${program['lesson']} lessons');
                      },
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //     child: Row(
                //       children: [
                //         SizedBox(width: 10,),
                //         Card1(imageUrl: 'assets/images/card1.png', title: 'LIFESTYLE', description: 'A complete guide for your new born baby', sub: "16 lessons"),
                //         Card1(imageUrl: 'assets/images/card1.png', title: 'WORKING PARENTS', description: 'Understanding of human behaviour', sub: "12 lessons"),
                //       ],
                //     ),
                // ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Events and experiences',style: TextStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,fontSize: 19,color: Color(0xff000000)),),
                      Row(
                        children: [
                          Text('View all',style: TextStyle(color: Color(0xff6D747A)),),
                          SizedBox(width: 3,),
                          Icon(Icons.arrow_forward,size: 15,color: Color(0xff6D747A)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Card2(imageUrl: 'assets/images/card2.png', title: 'BABYCARE', description: 'Understanding of human behaviour', sub: "13 Feb, Sunday"),
                      Card2(imageUrl: 'assets/images/card2.png', title: 'BABYCARE', description: 'Understanding of human behaviour', sub: "13 Feb, Sunday"),
                    ],
                  ),

                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lessons for you',style: TextStyle(fontFamily: 'Lora',fontWeight: FontWeight.w500,fontSize: 19,color: Color(0xff000000)),),
                      Row(
                        children: [
                          Text('View all',style: TextStyle(color: Color(0xff6D747A)),),
                          SizedBox(width: 3,),
                          Icon(Icons.arrow_forward,size: 15,color: Color(0xff6D747A)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible: isLoadingLessons,
                  child: Center(child: CircularProgressIndicator()),
                  replacement: Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lessons?.length,
                      itemBuilder: (ctx, index) {
                        final lesson = lessons[index] as Map;
                        return Card3(imageUrl: 'assets/images/card2.png', title: '${lesson['category']}', description: '${lesson['name']}', sub: "${lesson['duration']} min", lock: "${lesson['locked']}");
                      },
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       SizedBox(width: 10,),
                //       Card3(imageUrl: 'assets/images/card2.png', title: 'BABYCARE', description: 'Understanding of human behaviour', sub: "3 min"),
                //       Card3(imageUrl: 'assets/images/card2.png', title: 'BABYCARE', description: 'Understanding of human behaviour', sub: "1 min"),
                //     ],
                //   ),
                //
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessMsg(String msg){
    final snackBar=SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMsg(String msg){
    final snackBar=SnackBar(content: Text(msg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}