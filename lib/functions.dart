  
  //sync function
  
  //-----------block body-----------
  // void sayHello() {
  //   log('Hello');
  //   log('Hello');
  //   log('Hello');
  //   log('Hello');
  //   log('Hello');
  // }

  //----------lamdba experssion-----------
  // void sayHello2() => log('Hello');

  //int logX() => 10;

  // int logX2() {
  //   return 10;
  // }


    // positional parameters
  // void calculate(int x, int y, int a, int b, int c) {
  //   log('x + y = ${x + y}');
  //   log('x - y = ${x - y}');
  //   log('x * y = ${x * y}');
  //   log('x / y = ${x / y}');
  // }


  // calculate(10, 20, 30, 50, 40);

   //named parameters --> best practice
  // void calculate2({
  //   required int x,
  //   required int y,
  //   required int a,
  //   required int b,
  //   required int c,
  // }) {
  //   log('x + y = ${x + y}');
  //   log('x - y = ${x - y}');
  //   log('x * y = ${x * y}');
  //   log('x / y = ${x / y}');
  // }

  // calculate2(y: 20, x: 10, a: 30, c: 40, b: 50);


    //optional positional parameters
  // void calculate(int x, int y, [int? a, int? b, int? c]) {
  //   log('x + y = ${x + y}');
  //   log('x - y = ${x - y}');
  //   log('x * y = ${x * y}');
  //   log('x / y = ${x / y}');
  // }

  // calculate(10, 20, 30);

   //optional named parameters
  // void calculate2({required int x, required int y, int? a, int? b, int? c}) {
  //   log('x + y = ${x + y}');
  //   log('x - y = ${x - y}');
  //   log('x * y = ${x * y}');
  //   log('x / y = ${x / y}');
  // }

  // calculate2(x: 10, y: 20, c: 50);

  //Return with parameters
  // int calculate3(int x, int y) {
  //   return x + y;
  // }

  // log(calculate3(10, 20).toString());


  