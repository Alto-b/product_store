import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:product_store/application/product_bloc/post_bloc/post_bloc.dart';
import 'package:product_store/presentation/widgets/appbar.dart';

class AddPage extends StatelessWidget {
   AddPage({
    required this.screenHeight,
    super.key
    });

  final double screenHeight;

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

 List<String> categoryList = [
    "Clothes",
    "Electronics",
    "Furniture",
    "Shoes",
    "Miscellaneous"
  ];
  String? dropdownValue;
  String? productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize( preferredSize: const Size(150, 80),child: HomePageAppBar(screenHeight: screenHeight)),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Add new product"),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: screenHeight-150,
                  child: Form(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                 
                    children: [
                      //title
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Title",
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                           )
                        ),
                      ),
                      //price
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Price",
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                           )
                        ),
                      ),
                      //description
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Description",
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                           )
                        ),
                      ),
                      //category
                      DropdownButtonFormField(
                        hint: Text("Category"),
                        decoration: InputDecoration(border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        )),
                        items: categoryList.map((String value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value));
                        }).toList(), 
                        onChanged: (String? cat){
                          dropdownValue = cat;
                        }
                        ),
                      //image 
                       InkWell(
                        onTap: () async{
                          final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                          productImage = pickedImage!.path;
                        },
                         child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          height: 150,
                          width: 150,
                          child: productImage != null
                          ? Image.asset(
                              productImage!,
                            fit: BoxFit.fill,
                          )
                          : Icon(Icons.photo,size: 70,)
                         ),
                       ),                    

                      //submit button
                      ElevatedButton.icon(
                        onPressed: (){
                          submit(context);
                        }, 
                        icon: Icon(Icons.add), 
                        label: Text("Add Product"))
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void submit(BuildContext context){
    // BlocProvider.of<PostBloc>(context).add(AddEvent(
    //   title: titleController.text, 
    //   description: descriptionController.text, 
    //   price: int.parse(priceController.text), 
    //   category: dropdownValue??"category",
    //   image: productImage.toString()));

      try {
  var price = num.parse(priceController.text);
  // num price = num.parse(priceController.text);
  context.read<PostBloc>().add(
    AddEvent(
      title: titleController.text,
      description: descriptionController.text,
      price: price,
      category: dropdownValue ?? "category",
      image: productImage.toString(),
    ),
  );
} catch (e) {
  print('Error parsing price: $e');
  // Handle the error, such as displaying an error message to the user
}

  }
}