import 'package:flutter/material.dart';
import 'package:sql/data_crud.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
TextEditingController name =TextEditingController();
TextEditingController phone =TextEditingController();

List<Map> datas = [] ;
 // Database? db;
get()
async {
  datas = await data.instance.getdata();
  debugPrint("DatasList  $datas");
}


@override
  void initState() {
    // TODO: implement initState
  super.initState();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: name,
            ),
            TextFormField(
              controller: phone,
            ),

            ElevatedButton(onPressed: () async {
             await data.instance.savedata(name: name.text ,phone: phone.text);
             get();
             setState(() {});
              }, child: Text("Save Data")) ,
            ElevatedButton(onPressed: () async {
             await data.instance.updatedata(name: name.text ,phone: phone.text, id: 2);
             get();
             setState(() {});
             }, child: Text("Update Data")),
            ElevatedButton(onPressed: () async {
             await data.instance.deletdata(id: 2);
             get();
             setState(() {});
             }, child: Text("Delet Data")),
          ],
        ),
      ),
    );
  }
}
