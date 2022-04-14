

import 'package:flutter/material.dart';
import 'package:net_demo/services/http_service.dart';

import '../model/post_model.dart';
class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var data;



  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),

    });
  }

  void _apiCreatePost(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response!),

    });
  }

  void _apiUpdatePost(Post post){
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response!),

    });
  }

  void _apiDeletePost(Post post){
    Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),

    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(name: "test", salary: "123", age: "23", id: 1,);
    _apiDeletePost(post);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:Text(
            data != null ? data : "No Data"
          )
      )
    );
  }
}
