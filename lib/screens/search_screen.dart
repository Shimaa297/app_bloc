import 'package:flutter/material.dart';
import 'package:learn_app/custom_widget/textForm.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            defaultTextForm(
                label: 'Search ..',
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: null),
                validate: (String value)
                {
                  if(value.isEmpty)
                  {
                    return 'Search is empty !';
                  }
                  return null;
                }
            ),
            // ListView.builder(itemBuilder: itemBuilder),
          ],
        ),
      ),
    );
  }
}
