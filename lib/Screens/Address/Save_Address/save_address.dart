import 'package:flutter/material.dart';
import 'package:service_app/Controller/address_controller.dart';
import '../../../Models/get_adress.dart';

class SaveAddress extends StatefulWidget {
  const SaveAddress({super.key});

  @override
  _SaveAddressState createState() => _SaveAddressState();
}

class _SaveAddressState extends State<SaveAddress> {
  AddressController myAddessController = AddressController();
  late Future<List<Address>> futureAddresses;

  @override
  void initState() {
    super.initState();
    futureAddresses = myAddessController.fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Address List')),
      body: FutureBuilder<List<Address>>(
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
              itemCount: addresses.length,
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
                          Navigator.pop(context, address);
                        }),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
