import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/pages/favourite/favourite_list_page.dart';
import 'package:state_mgmt/providers/favourite_provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("favouritePage Build called");
    // final favouriteProvider = Provider.of<FavouriteProvider>(context);
    // final List<String> items = favouriteProvider.allFruits;
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
      body: FavouriteListView(),
    );
  }
}

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    print("FavouriteListView build called");

    return Consumer<FavouriteProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.allFruits.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                if (value.favFruits.contains(value.allFruits[index])) {
                  value.removeFromFav(value.allFruits[index]);
                } else {
                  value.addToFav(value.allFruits[index]);
                }
              },
              title: Text(value.allFruits[index]),
              trailing: value.favFruits.contains(value.allFruits[index])
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_outline),
            );
          },
        );
      },
    );
  }
}
