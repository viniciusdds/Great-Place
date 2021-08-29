import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {

  final _titleController = TextEditingController();

  void _submitForm(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(10),
               child: Column(
                 children: [
                   TextField(
                     controller: _titleController,
                     decoration: InputDecoration(
                       labelText: 'Título',
                     ),
                   ),
                   SizedBox(height: 10),
                   ImageInput(),
                 ],
               ),
             ),
           ),
         ),
         ElevatedButton.icon(
           onPressed: _submitForm,
           icon: Icon(Icons.add),
           style: ElevatedButton.styleFrom(
             primary: Theme.of(context).accentColor,
             onPrimary: Theme.of(context).primaryColor,
             elevation: 0,
             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
             padding: EdgeInsets.all(15)
           ),
           label: Text('Adicionar'),
         )
        ],
      ),
    );
  }
}
