import 'package:flutter/cupertino.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';



class Item {
final String title;
final String subtitle;
final Image image;
final Widget screenFromAllProducts;
final Widget screenFromNewArrivals;
final String routeFromSearch;

 Item({
   this.screenFromAllProducts,
   this.screenFromNewArrivals,
   this.subtitle,
   this.title,
   this.image,
   this.routeFromSearch,

});


}

List<Item> loadItems() {
var i = <Item>[
Item(
    routeFromSearch: 'item1FromSearch',
    title: 'Montana Fall',
    subtitle: 'montana fall',
    image: Image(image: itemImages['item1Small']),
),
  Item(
    routeFromSearch: 'item2FromSearch',
    title: itemTitles['item2Small'],
    subtitle: 'red africa',
    image: Image(image: itemImages['item2Small']),
  ),
  Item(
    routeFromSearch: 'item3FromSearch',
    title: itemTitles['item3Small'],
    subtitle: 'rugged swiss',
    image: Image(image: itemImages['item3Small']),
  ),
  Item(
    routeFromSearch: 'item4FromSearch',
    title: itemTitles['item4Small'],
    subtitle: 'estonia spring',
    image: Image(image: itemImages['item4Small']),
  ),
  Item(
    routeFromSearch: 'item5FromSearch',
    title: itemTitles['item5Small'],
    subtitle: 'michigan thunder',
    image: Image(image: itemImages['item5Small']),
  ),
  Item(
    routeFromSearch: 'item6FromSearch',
    title: itemTitles['item6Small'],
    subtitle: 'scotland high',
    image: Image(image: itemImages['item6Small']),
  ),


];


return i;



}