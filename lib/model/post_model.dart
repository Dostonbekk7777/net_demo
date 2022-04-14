class Post{
  var name;
  var salary;
  var age;
  var id;

  Post({required this.name,required this.salary,required this.age,required this.id});

  Post.fromJson(Map<String, dynamic> json)
  : name = json['name'],
  salary = json['salary'],
  age = json['age'],
  id = json['id'];

  Map<String, dynamic> toJson() => {
    'name' : name,
    'salary' : salary,
    'age' : age,
    'id' : id
  };
}