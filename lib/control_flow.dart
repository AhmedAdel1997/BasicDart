 //Control Flow

 // if
  //  if (x > 3) {
  //   log('x is greater than 3');
  // }

  // if (x > 3 && y > 7) {
  //   log('x is greater than 3 and y is greater than 7');
  // } else {
  //   log('x is less than 3 and y is less than 7 and z is not equal to 7');
  // }


  //Conditional 
  //   log(
  //   grade >= 90
  //       ? 'You got an A'
  //       : grade >= 80
  //       ? 'You got a B'
  //       : grade >= 70
  //       ? 'You got a C'
  //       : 'You got a F',
  // );

  //Switch 
//  int grade = 87;

//   switch (grade) {
//     case 90:
//     case 89:
//     case 87:
//     case 85:
//     case 83:
//     case 81:
//       log('You got an A');
//       break;
//     case 80:
//     case 79:
//     case 78:
//     case 77:
//       log('You got a B');
//       break;
//     case 70:
//       log('You got a C');
//       break;
//     default:
//       log('You got a F');
//       break;
//   }

// int month = 3;
//   String season = '';

//   switch (month) {
//     case 12:
//     case 1:
//     case 2:
//       season = 'Winter';
//       break;
//     case 3:
//     case 4:
//     case 5:
//       season = 'Spring';
//       break;
//     case 6:
//     case 7:
//     case 8:
//       season = 'Summer';
//       break;
//     case 9:
//     case 10:
//     case 11:
//       season = 'Fall';
//       break;
//     default:
//       season = 'Invalid month';
//       break;
//   }

  // String season = switch (month) {
  //   12 || 1 || 2 => 'Winter',

  //   3 || 4 || 5 => 'Spring',
  //   6 || 7 || 8 => 'Summer',
  //   9 || 10 || 11 => 'Fall',
  //   _ => 'Invalid month',
  // };

//   log(season);

//for Loop
//For in loop
//  for (int number in numbers) {
  //   log(number.toString());
  // }

  // for (int i = 0; i < numbers.length; i++) {
  //   log(numbers[i].toString());
  // }

  //  for (int i = 0; i < 10; i++) {
  //   if (i == 5) {
  //     break; stop when reach  5 
  //   }
  //   log(i.toString());
  // }

  //  for (int i = 0; i < 10; i++) {
  //   if (i == 5) {
  //     continue; skip when reach 5
  //   }
  //   log(i.toString());
  // }
