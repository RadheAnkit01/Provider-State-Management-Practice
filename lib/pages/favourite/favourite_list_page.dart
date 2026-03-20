import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/providers/favourite_provider.dart';

class FavouriteListPage extends StatelessWidget {
  const FavouriteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    List fav = favouriteProvider.favFruits;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text('Your Favourite Lists'),
      ),
      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (BuildContext context, int index) {
          return Consumer<FavouriteProvider>(
            builder: (context, value, child) {
              return ListTile(
                onTap: () {
                  // value.addToFav(items[index]);
                },
                title: Text('${value.favFruits[index]}'),
                trailing: Icon(Icons.favorite, color: Colors.red),
              );
            },
          );
        },
      ),
    );
  }
}
