import 'package:banao_task1/home/home.dart';
import 'package:banao_task1/lessons/lessons.dart';
import 'package:banao_task1/programs/programs.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectedIndexfooter = 0;

  final List<Widget> _pagesfooter = [
    Home(),
    Lessons(),
    Programs(),
    PlaceholderWidget(color: Colors.yellow),
    PlaceholderWidget(color: Colors.orange),
  ];

  void _onItemTappedfooter(int index) {
    setState(() {
      _selectedIndexfooter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffeEF3FD),
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/Menu.png'),
              size: 25,
              color: Color(0xff939CA3),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.question_answer_outlined,
                  color: Color(0xff939CA3),),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications,color: Color(0xff939CA3),),
            ),
          ],
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                children: [_pagesfooter[_selectedIndexfooter]],
              ),
            ),
          ],
        ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffffffff),
        selectedItemColor: Color(0xff598BED),
        unselectedItemColor: Color(0xff6D747A),
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndexfooter,
        onTap: _onItemTappedfooter,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/book.png'),
            ),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/hub.png'),
              size: 25,
            ),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/chat.png'),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Profile.png'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
