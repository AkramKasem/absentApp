import 'package:absent_app/api/base_client.dart';
import 'package:absent_app/base/app_button.dart';
import 'package:absent_app/model/student_data.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr = "let's Scan it";
  var height,width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanning QR code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(qrstr,style: TextStyle(color: Colors.blue,fontSize: 30),),
            ElevatedButton(onPressed: scanQr, child: Text(('New Scanner'))),
            ElevatedButton(onPressed: ()async{


              print('StudentData Post:');
              var student = StudentData(
                id: 1,
                name: "Akram Kasem",
                department: "CS",
                section: 10,
                macAddress: "14854fd78d88df8d7f" ,
              );

              var response = await BaseClient().post('/'+qrstr, student).catchError((err) {});
              if (response == null) return;
              print('successful Post:');
            }, child: Text(('Attendance Registration'))),
            SizedBox(height: width,)
          ],
        ),
      )
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }


}
