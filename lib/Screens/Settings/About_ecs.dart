import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('About Us', style: TextStyle(color: Colors.white),),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ecosweeps(Formerly EcoSweep) was'),
            const Text('launched in Nov 2014. It is the largest home'),
            const Text('services platform in Asia, with presence in'),
            const Text('India, UAE and Singapore. The platfomr helps'),
            const Text('customers book reliable home services like'),
            const Text('beauty services, massage therapy, cleaning'),
            const Text('plumbing, carpentry, appliance repair,, painting'),
            const Text('etc. The company vision is to empower millions'),
            const Text('of service professionals across the world to'),
            const Text('deliver services at home like never seen before.'),
            const Text('The company partners with the tens of thousands'),
            const Text('of service professionals, helping them with'),
            const Text('training, credit, product procurement, insurance,'),
            const Text('technology etc.'),

            SizedBox(height: height*0.05,),

            Center(
              child: Container(
                width: width*0.09,
                height: height*0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black,
                ),
                child: const Center(child: Text('uc', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
              ),
            ),

             SizedBox(height: height*0.01,),
             const Center(child: Text('7.5.66', style: TextStyle(color: Colors.grey),)),
          ],
        ),
      ),
    );
  }
}