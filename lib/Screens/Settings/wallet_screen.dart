import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Wallet', style: TextStyle(color: Colors.white),),
      ),

      body: Column(
        children: [
          Container(
            height: height*0.02,
            color: Colors.grey.shade200,
          ),

          SizedBox(
            width: width*1,
            height: height*0.16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.wallet, color: Colors.yellow, size: 30,),
                  SizedBox(width: width*0.02),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, left: 10.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Row(
                          children: [
                            const Text('UC Cash', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21,),),
                            SizedBox(width: width*0.40,),
                            const Text('SAR 0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                          ],
                        ),
                        const Text('Formerly UC Credits. Applicable on all', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),),
                        const Text('Services', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: height*0.01,
            color: Colors.grey.shade200,
          ),

          SizedBox(
            width: width*1,
            height: height*0.26,
            child: Row(
              children: [
                SizedBox(width: width*0.02),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children : [
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.gift, color: Colors.yellow,),
                          SizedBox(width: width*0.025,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('UC Rewards', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21,),),
                              Text('Hand-picked offers for you', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: height*0.03,),
                      Container(
                        width: width*0.91,
                        height: height*0.09,
                        color: Colors.blueGrey.shade700,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Tap to view', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              Row(
                                children: [
                                  const Text('SAR 50 Off!', style: TextStyle(color: Colors.white),),
                                  SizedBox(width: width*0.28,),
                                  const Icon(Icons.alarm, color: Colors.yellow,),
                                  const Text('3 days', style: TextStyle(color: Colors.yellow),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: height*0.005,
            color: Colors.grey.shade200,
          ),

          SizedBox(
            width: width*1,
            height: height*0.09,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Have a question?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                ],
              ),
            ),
          ),

          Container(
            height: height*0.001,
            color: Colors.grey.shade200,
          ),

          SizedBox(
            width: width*1,
            height: height*0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wallet activity', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold )),
                  SizedBox(height: height*0.02,),
                  Text('Jul 19th,2024', style: TextStyle(color: Colors.grey.shade500),),

                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.gift, color: Colors.blueAccent,),
                      SizedBox(width: width*0.025,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('UC Rewards Added', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: width*0.29,),
                              const Text('+SAR50', style: TextStyle(color: Colors.green),),
                            ],
                          ),
                          const Text('Expires on Jul 29th,2024', style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: height*0.002,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}