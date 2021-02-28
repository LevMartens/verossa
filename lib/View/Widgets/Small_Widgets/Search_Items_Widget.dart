import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';


class CustomSearchDelegate extends SearchDelegate {


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<ItemModel> loadItems() {return Provider.of<ItemProvider>(context, listen: false).getItemsInList(); }

    final list = query.isEmpty
        ? loadItems()
        : loadItems()
        .where((item) => item.subtitle.contains(query.toLowerCase()))
        .toList();


    return list.isEmpty
        ? Text('No Results Found...')
        : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final ItemModel listItem = list[index];
          return ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.of(context).pushNamed(listItem.route);

            },
            title: Text(listItem.title),
            leading: Container(width: 75 ,child: Image(image:listItem.itemImage ,)),
          );
        });
  }
}