import 'package:flutter/material.dart';
import 'recipe.dart';
class RecipeDetail extends StatefulWidget {

  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
}):super(key:key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }


}


class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderVal here
int _sliderVal=1;
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      // 2
      body: Card(
        elevation: 2.0,
        // 2
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        shadowColor: Colors.greenAccent,

        margin: EdgeInsets.only(left:10.0,right:10.0,top : 10.0),
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageurl),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // TODO: Add Expanded
Expanded(
    child: ListView.builder(
  padding: const EdgeInsets.all(7.0),
      itemCount: widget.recipe.ingredients.length,
      itemBuilder: (BuildContext context,int index){
    final ingredient=widget.recipe.ingredients[index];

    return Text(
      '${ingredient.qty*_sliderVal} ${ingredient.measure} ${ingredient.name}'
    );
      },

)),
            Slider(
                min:1,
                max:10,
                divisions:10,
                label:'${_sliderVal*widget.recipe.servings} servings',
                value:_sliderVal.toDouble(),
                onChanged: (newValue){
                  setState(() {
                    _sliderVal=newValue.round();
                  });
                },
                activeColor:Colors.green,
              inactiveColor: Colors.black,
                )
          ],
        ),
      ),

    );
  }
}