import 'dart:developer';

class Example {
  String name = 'ahmed';

  logName() {
    log('ahmed');
  }
}

class Example2 extends Example {
  @override
  logName() {
    log('ali');
  }
}

class Example3 extends Example with ExampleMixin {
  @override
  logName() {
    log('mohamed');
  }

  @override
  logNameMixin() {
    log('mixin for exmaple 3');
  }
}

mixin ExampleMixin {
  logNameMixin() {
    log('mixin');
  }
}
