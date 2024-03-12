
// import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
// import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/providers/add_to_google_wallet_button.dart';
import 'package:green_oasis/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'dart:math' as math;





class MyGoogleWalletBadge extends StatefulWidget{
MyGoogleWalletBadge({required this.designNotifier});
final DesignModel designNotifier;
  @override
  State<StatefulWidget> createState() => _MyGoogleWalletBadge(designNotifier: designNotifier,);
  
}

class _MyGoogleWalletBadge extends State<MyGoogleWalletBadge> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
_MyGoogleWalletBadge({required this.designNotifier});
final DesignModel designNotifier;





  // @override
  // Widget build(BuildContext context) {


  //    return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       SizedBox(
  //         width: 200,
  //         height: 200,
  //         child: 
  //         AddToGoogleWalletButton(
  //           pass: _examplePass,
  //           onSuccess: () => _showSnackBar(context, 'Success!'),
  //           onCanceled: () => _showSnackBar(context, 'Action canceled.'),
  //           onError: (Object error) => _showSnackBar(context, error.toString()),
  //           locale: const Locale.fromSubtags(
  //             languageCode: 'en',
  //             countryCode: 'US',
  //         ),
  //       ),
        
  //       // AnimatedBuilder(
  //       //   animation: _controller,
  //       //   builder: (_, child) {
  //       //     return Transform.flip(
  //       //           child: child,

  //       //     );
  //       //     // return Transform.rotate(
  //       //     //   angle: _controller.value * 2 * math.pi,
  //       //     //   child: child,
  //       //     // );
  //       //   },
  //       ),
  //       _gap
        

  //     ],
  //    );
  // }
  void _showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
      
  static const _gap = SizedBox(height: 10);

  @override
  Widget build(BuildContext context){
    const String _passClass = 'genericGreenOasis';
    const String _issuerId = '3388000000022329023';
    const String _issuerEmail = 'akumbom5ma@gmail.com';
    // "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
    const String _logoUri = 'https://th.bing.com/th/id/OIP.5TQNCjVhuoutFvLW3lJdqgAAAA?rs=1&pid=ImgDetMain';
    const String _imgUri = "https://sankalptaru.org/wp-content/themes/sankalptaru/dist/img/case-study/tree-planted.png";
    final String _passId =  Uuid().v4();

    final settings = context.read<SettingsController>();
     final playName = settings?.playerName ?? "Player";
     final String _examplePass = """ 
    {
      "iss": "$_issuerEmail",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "$_issuerId.$_passId",
            "classId": "$_issuerId.$_passClass",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#006600",
            "logo": {
              "sourceUri": {
                "uri": "$_logoUri"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Green Oasis"
              }
            },
            "subheader": {
              "defaultValue": {
                "language": "en",
                "value": "Gardener"
              }
            },
            "header": {
              "defaultValue": {
                "language": "en",
                "value": "$playName"
              }
            },
            "barcode": {
              "type": "QR_CODE",
              "value": "$_passId"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "$_imgUri"
              }
            },
            "textModulesData": [
              {
                "header": "Gardening",
                "body": "${designNotifier.level.number}",
                "id": "${designNotifier.totalpoints}"
              }
            ]
          }
        ]
      }
    }
""";
    
  return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          AddToGoogleWalletButton(
            pass: _examplePass,
            onError: (Object error) => _onError(context, error),
            onSuccess: () => _onSuccess(context),
            onCanceled: () => _onCanceled(context),
            locale: const Locale.fromSubtags(
              languageCode: 'en',
              countryCode: 'US',
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      );
  }

  void _onError(BuildContext context, Object error) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );

  void _onSuccess(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content:
              Text('Pass has been successfully added to the Google Wallet.'),
        ),
      );

  void _onCanceled(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('Adding a pass has been canceled.'),
        ),
      );
}
