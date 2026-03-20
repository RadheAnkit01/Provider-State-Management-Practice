import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/pages/favourite/favourite_list_page.dart';
import 'package:state_mgmt/providers/favourite_provider.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build called");
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final List<String> items = favouriteProvider.allFruits;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text('Favourite'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteListPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Consumer<FavouriteProvider>(
              builder: (context, value, child) {
                return ListTile(
                  onTap: () {
                    if (value.favFruits.contains(items[index])) {
                      value.removeFromFav(items[index]);
                    } else {
                      value.addToFav(items[index]);
                    }
                  },
                  title: Text('${items[index]}'),
                  trailing: value.favFruits.contains(items[index])
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_outline),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
