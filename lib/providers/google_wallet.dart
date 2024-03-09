import 'package:flutter/services.dart';
import 'package:google_wallet/google_wallet.dart';

final googleWallet = GoogleWallet();
final String jwt = '...'; // your own pass JWT

example() async {
  bool? available;
  bool? saved = false;
  String text;

  // Check if Google Wallet is available
  try {
    available = await googleWallet.isAvailable();
    text = "Google Wallet is available: ${available}";
  } on PlatformException catch (e) {
    text = "Error: '${e.message}'.";
  }

  // Save a pass to Google Wallet
  try {
    if (available == true) {
      saved = await googleWallet.savePassesJwt(jwt);
      text = "Pass saved: ${saved}";
    } else {
      // Wallet unavailable,
      // fall back to saving pass via web: "https://pay.google.com/gp/v/save/${jwt}"
      text = "Opened Google Wallet via web";
    }
  } on PlatformException catch (e) {
    text = "Error: '${e.message}'.";
  }
}