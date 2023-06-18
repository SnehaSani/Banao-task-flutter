import 'package:banao_task1/services/remote_service.dart';
import 'package:flutter/material.dart';

class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  List programs = [];
  var isLoading=true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response= await RemoteService.fetchData('https://632017e19f82827dcf24a655.mockapi.io/api/programs');
    if(response!=null){
      setState(() {
        programs=response;
      });
    }
    else{
      showErrorMsg('Unable to Fetch Data');
    }
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeEF3FD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
            child: Text(
              'P R O G R A M S',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Color(0xff598BED)),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: isLoading,
              child: Center(child: CircularProgressIndicator()),
              replacement: ListView.builder(
                itemCount: programs?.length,
                itemBuilder: (ctx, index) {
                  final program = programs[index] as Map;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width-30),
                      padding: EdgeInsets.only(left: 15,top: 20,bottom: 20,right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          color: Color(0xA1A5A6A7),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(child: Text('${index+1}',style: TextStyle(color: Colors.white),),backgroundColor: Color(0xff598BED),),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${program['name']}',style: TextStyle(color: Color(0xff598BED),fontWeight: FontWeight.w600,fontSize: 16),),
                                SizedBox(height: 8,),
                                Text('Category: ${program['category']}',style: TextStyle(color: Color(0xff598BED),fontSize: 14),),
                                SizedBox(height: 3,),
                                Text('Lesson: ${program['lesson']}',style: TextStyle(color: Color(0xff598BED),fontSize: 14),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
