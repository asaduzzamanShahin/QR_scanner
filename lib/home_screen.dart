import 'package:flutter/material.dart';
import 'package:qr_scanner/qrcode_generator_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Size size;

  @override
  Widget build(BuildContext context) {
    
    size= MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Color(0xffF7524F),
        title: Center(child: Text("QR Code Scanner & Generator")),
        leading: Image.asset("assets/images/scan.png", width: 40.0, height:40.0,)

      ),
      body: Container(
         color: Colors.white,
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text("Scan QR Code"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>QrCodeGeneratorScreen()));
                      

                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF7524F),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),

                  shadowColor: Color(0xffF7524F),

                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text("Genarate QR Code"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>QrCodeGeneratorScreen()));



                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF7524F),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
                  ),

                  shadowColor: Color(0xffF7524F),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
