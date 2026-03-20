import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/providers/list_map_provider.dart';

class AddDataPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  AddDataPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Data'), backgroundColor: Colors.yellow),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hint: Text('Enter Name')),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hint: Text('Enter Phone No.')),
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text('Add Data')),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<ListMapProvider>().addData({
                    "name": "Radhe",
                    "mobNo": "7903707134",
                  });
                },
                child: Text('Add Default Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
