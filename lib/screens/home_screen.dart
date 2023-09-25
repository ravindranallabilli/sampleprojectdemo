import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(Object context) {
  return SafeArea(child: 
  StaggeredGrid.count(
  crossAxisCount: 4,
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
  children:  [
    StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 4,
      child:Stack(children: [
        Image.asset('assets/images/new_collection.jpg'),
         Container(
          padding: const EdgeInsets.only(right: 30,bottom: 30),
          alignment: Alignment.bottomRight,
          child: const Text("New collection", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),))
      ],) ,
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        child: const Text('Summer Sale', style:TextStyle(color: Colors.red,fontSize: 40,fontWeight: FontWeight.bold) ,),
      ),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 4,
      child:Stack(children: [
        Image.asset('assets/images/mens_hoodies.jpg',fit: BoxFit.fitHeight,height: double.infinity,),
         Container(
          padding: const EdgeInsets.only(left: 30,),
          alignment: Alignment.center,
          child: const Text("Men's hoodies", style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.bold),))
      ],) ,
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: Stack(children: [
        Image.asset('assets/images/black.jpg',),
         Container(
          padding: const EdgeInsets.only(left: 20,top: 30),
          alignment: Alignment.centerLeft,
          child: const Text("Black", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),))
      ],) ,
    ),
    
  ],
  )
  );
  }
}