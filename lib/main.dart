import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';
void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.yellow,
          secondary: Colors.grey,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      home: MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Recipe.sampleData.length, //determines nmber of rows
            itemBuilder: (BuildContext context, int index) {
              //builds widget tree for each row
              // TODO: Add GestureDetector

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RecipeDetail(recipe: Recipe.sampleData[index]);
                    }),
                  );
                },
                child: buildRecipeCard(Recipe.sampleData[index]),
              );

              // return buildRecipeCard(
              //     Recipe.sampleData[index]); //recipe name display
            }),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      shadowColor: Colors.greenAccent,

      margin: EdgeInsets.only(left:10.0,right:10.0,top : 10.0),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageurl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
