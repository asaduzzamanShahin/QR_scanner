import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerScreen extends StatefulWidget {

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  late Size size;
  final GlobalKey _qrKey = GlobalKey(debugLabel: "QR");

  QRViewController? _controller;
  Barcode? result;



  @override
  Widget build(BuildContext context) {
    size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Color(0xffF7524F),
          title: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Image.asset("assets/images/scan.png", width: 30.0, height:30.0,),
              Text("Qr Code Scanner"),
            ]
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
          },

          ),

      ),
      body: Container(
    width: size.width,
    height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: _buildQrView(context)),
          ],


        ),

      ),

    );
  }
  Widget _buildQrView(BuildContext context){
    return QRView(key: _qrKey,
        onQRViewCreated: _onQRViewCreated,
      onPermissionSet: (ctrl, p)=>onPermissopnSet(context, ctrl, p),
    );

  }
  void _onQRViewCreated(QRViewController _qrController){
    setState(() {
      this._controller = _controller;
    });

    _controller?.scannedDataStream.listen((event) {
      setState(() {
        result=event;
        _controller?.pauseCamera();
      });
    });

  }
  void onPermissopnSet(BuildContext context, QRViewController _ctrl, bool _permission){
    if(!_permission){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No Permission"))
      );
    }
  }

}


