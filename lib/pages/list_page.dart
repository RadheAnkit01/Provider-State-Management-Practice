import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/pages/add_data_page.dart';
import 'package:state_mgmt/providers/list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 229, 163),
      appBar: AppBar(backgroundColor: Colors.amber, title: Text('List')),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, child) {
          var allData = provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${allData[index]["name"]}"),
                      subtitle: Text("${allData[index]["mobNo"]}"),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<ListMapProvider>().deleteData(
                                  index,
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                              tooltip: "Update",
                              onPressed: () {
                                context.read<ListMapProvider>().updateData({
                                  "name": "Ankit",
                                  "mobNo": "9534948042",
                                }, index);
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text("No Contact yet!"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDataPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
