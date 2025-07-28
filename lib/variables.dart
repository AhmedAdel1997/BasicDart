//=======================
// Variables
//=======================

// Var , dynamic

var name = 'ahmed'; // string
var age = 20; // int
var price = 21.5; // double
var isStudent = true; // bool

dynamic name1 = 'ahmed'; // string
dynamic age1 = 20; // int
dynamic price1 = 21.5; // double
dynamic isStudent1 = true; // bool

//Explicitly -  best practice
String name2 = 'ahmed';
int age2 = 20;
double price2 = 21.5;
bool isStudent2 = true;

//final , const

final String title = 'Flutter'; // constant in runtime

const String title2 = 'Flutter'; // constant in compile time

//=======================
//Data types
//=======================

// Basic Types

// Numbers
int x = 10;
double y = 11.5;
num z = 10.5; // int or double

//Strings
// concatenation
String name3 = 'Price is';
String title3 = '100 riyal';

String concatination3 = '$name3 : $title3';

//interpolation
String name4 = 'Ashraf';

String interpolation = 'Hello , $name';

//Multi-line string
String desc = '''
Ahmed 
ashraf 
Description Description Description Description Description Description Description Description Description
sdsa dasf 
 dsgdsg
''';

//bool
bool value = false;
bool value2 = true;

// Collection types
// List
List<String> numbers = ['1', '2', '3', '4', '5'];
List<int> numbersAsInt = [1, 2, 3, 4, 5];
List<dynamic> mixed = [1, 2, 3, '4', '5'];

//Map
Map<String, dynamic> map = {
  'ahmed': 20,
  'ashraf': 'Flutter',
  'mohamed': [1, 2, 3],
};

//Set
Set<String> set = {'ahmed', 'ashraf', 'mohamed', 'ahmed'};
