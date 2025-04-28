import 'package:flutter/material.dart';
import 'package:service_app/Controller/address_controller.dart';
import 'package:service_app/Models/get_adress.dart';
import 'package:service_app/Screens/Settings/another_addresses.dart';

class ManageAddresses extends StatefulWidget {
  const ManageAddresses({super.key});

  @override
  State<ManageAddresses> createState() => _ManageAddressesState();
}

class _ManageAddressesState extends State<ManageAddresses> {
  AddressController myAddessController = AddressController();
  late Future<List<Address>> futureAddresses;

  @override
  void initState() {
    super.initState();
    futureAddresses = myAddessController.fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Manage Addresses',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width * 1,
              height: height * 0.001,
              color: Colors.grey.shade50,
            ),
            Container(
              width: width * 1,
              height: height * 0.05,
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.purple,
                    size: 20,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AnotherAddresses()));
                      },
                      child: const Text(
                        'Add another address',
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            ),
            FutureBuilder<List<Address>>(
              future: futureAddresses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No addresses found'));
                } else {
                  List<Address> addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Address address = addresses[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 8, bottom: 8),
                        child: Card(
                          child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("Address Name: ${address.address}"),
                              ),
                              subtitle: Text('''
        House No: ${address.houseNo}, 
        Landmark: ${address.landmark ?? "N/A"}
                              '''),
                              onTap: () {
                                // Navigator.pop(context, address);
                              }),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
