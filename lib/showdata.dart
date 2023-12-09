import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql/Homepage.dart';
import 'package:sql/data_crud.dart';

class showdata extends StatefulWidget {
  const showdata({super.key});

  @override
  State<showdata> createState() => _showdataState();
}


class _showdataState extends State<showdata> {
List<Map> datas= [];

  get()
  async {
    datas = await data.instance.getdata();
    debugPrint("DatasList  $datas");
    debugPrint("DatasList  ${datas.length}");
    debugPrint("Data ${datas[0]['name']}");
    debugPrint("Data ${datas[0]['number']}");
  }

  @override
  void initState() {
    get();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context) => Homepage() ,));
      },
      child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              // get();
              setState(() {});
            }, child: Text("Ref")),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:datas.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Name : ${datas[index]['name']}"),
                      Text("Number : ${datas[index]['number']}")
                    ],
                  );
                },),
            ),
          ],
        ),
      ),
    );
  }
}
