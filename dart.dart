import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';

void main(){
  print(checkPalindrome('идем молод долом меди'));
  print(deleteSymbol('Hello World!', '!'));
  print(countSimpleNumber(50));
  sortAlphabet('написать функцию, которая разбивает заданную строку на список символов', ' ', '');
  fibonacci(0, 1, 17);
  print(factorial(5));
  print(firstNotRepeatedChar('Hello World!'));
  DateTime date = DateTime.now();
  print(getBusinessDatesCount(DateTime(date.year, date.month, date.day), DateTime(date.year, date.month + 1, date.day)));
  print(checkValidCardNumber("4144567890123456"));
  parse("3+4*7+2/4");
}

// 1. Написать функцию проверки строки на палиндром.
String checkPalindrome(inputString) {

    if(inputString.length == 1){
        return 'Это палиндром';
    }else{
        for(var i = 0, j = inputString.length - 1; i < j; i++, j--){
            if(inputString[i] != inputString[j]){
                return 'Это не палиндром';
            }
        }
    }
    return 'Это палиндром';
}

// 2. Написать функцию, которая удаляет из всей строки заданный символ.
String deleteSymbol(inputString, symbol) {
    return inputString.replaceAll(new RegExp(symbol), '');
}

// 3. Написать функцию, которая возвращает количество простых чисел до числа N.
int countSimpleNumber(N) {
  var count;
    
    for(int i = 2; i <= N; i++) {
      count = true;
      for(int j = 2; j < i; j++) {
        if(i % j == 0) count = false;
      }
      if(count) print(i);
    }
  
  return count;
}

// 4. Написать функцию, которая разбивает заданную строку на список символов,
// удаляет все пробелы и возвращает данный список в отсортированном по алфавиту порядке.
void sortAlphabet(inputString, separator1, separator2){
  String arrayOfStrings = inputString.split(separator1).join(separator2);
  List<String> listSymbols = [];

  for(int i = 0; i < arrayOfStrings.length; i++) {
    for (int j = 0; j < arrayOfStrings[i].length; j++) {
      listSymbols.add(arrayOfStrings[i].substring(0, j+1));
    }
  }
  
  listSymbols.sort();
  
  print(listSymbols);
}

// 5. Написать **рекурсивную** функцию, которая возвращает последовательность
// чисел Фибоначчи до числа N.
void fibonacci(beforePreviousValue, previousValue, maxValue) {
     if(previousValue < maxValue){
        print(previousValue);
        int currentValue = beforePreviousValue + previousValue;
        fibonacci(previousValue, currentValue, maxValue);
     }
}

// 6. Написать функцию, которая возвращает факториал переданного числа N.
int factorial(n) {
  if(n == 0 || n == 1) {
    return 1;
  }
  else {
    return n * factorial(n-1);
  }
}

// 7. Написать функцию, которая возвращает первый неповторяющийся символ
// в строке – если такого нет, то возвращает null.
String firstNotRepeatedChar(inputString) {
  var str = inputString.split(''), result = '', counter = 0;
  for(int i= 0; i < str.length; i++){
    counter = 0;
    for(int j = 0; j < str.length; j++){
      if(str[i] == str[j])
        counter += 1;
    }
    if(counter < 2){
      result = str[i];
      break;
    }
    if(counter >= 2){
      result = 'null';
    }
  }
  return result; 
}

// 8. Написать функцию, которая возвращает количество рабочих дней в текущем месяце.
int getBusinessDatesCount(startDate, endDate) {
    int count = 0;
    DateTime curDate = startDate;
    for(; curDate.isBefore(endDate); ) {
      if(curDate.weekday != DateTime.saturday && curDate.weekday != DateTime.sunday) {
        count++;
      }
      curDate = curDate.add(Duration(days: 1));
    }
    
    return count;
}

// 9. Написать функцию, которая проверяет на валидность CCN (credit card number)
// и возвращает true если CCN валиден.
bool checkValidCardNumber(ccn) {
  
  if(ccn.length == 16 && ccn.startsWith('4')) return true;
  else if(ccn.length == 16 && ccn.startsWith('53')) return true;
  else if(ccn.length == 15 && (ccn.startsWith('34') || ccn.startsWith('37'))) return true;
  else return false;
}

// 10. Написать функцию, которая возвращает результат арифметической операции,
// заданной в виде строки (например, `2+4*7+2/4`). Доступные арифметические операции:
// `умножение, сложение, вычитание и деление`. 
// Если введенная строка не соответствует правильному формату, 
// то нужно выбрасывать исключение.
void parse(expression){
  
    void func(List<double> num, List<String> op) {
        double sum = num[0];
  
        for(int i = 0; i < num.length-1; i++){
          switch(op[i]) {
            case '+': 
              if(op[i+1] == '*') {
                num[i+1] = num[i+1] * num[i+2];
//                 print("Если первое дейcтвие * : ${num[i+1]}");
                sum = sum + num[i+1];
//                 print("ade: $sum");
              } else if (op[i+1] == '/'){
                num[i+1] = num[i+1] / num[i+2];
//                 print("Если первое дейcтвие / : ${num[i+1]}");
                sum = sum + num[i+1];
//                 print("vde: $sum");
              } else {
                sum = sum + num[i+1];
              }
//               print(sum);
              break;
            case '-':
              if(op[i+1] == '*') {
                num[i+1] = num[i+1] * num[i+2];
//                 print("Если первое дейcтвие * : ${num[i+1]}");
                sum = sum - num[i+1];
              } else if (op[i+1] == '/'){
                num[i+1] = num[i+1] / num[i+2];
//                 print("Если первое дейcтвие / : ${num[i+1]}");
                sum = sum - num[i+1];
              } else {
              sum = sum - num[i+1];
              }
//               print(sum);
              break;
            case '/': 
              if(op[i-1] == '+') {
                num[i-1] = num[i-1] + num[i];
//                 print("Если перед / идет + : ${num[i-1]}");
                sum = sum;
//                 print("скок? $sum");
              } else if(op[i-1] == '-'){
                num[i-1] = num[i-1] - num[i];
//                 print("Если перед / идет - : ${num[i-1]}");
                sum = sum;
//                 print("скок? $sum");
              } else {
                sum = sum / num[i+1];
              }
//               print(sum);
              break;
            case '*':
              if(op[i-1] == '+') {
                num[i-1] = num[i-1] + num[i];
//                 print("Если перед * идет + : ${num[i-1]}");
                sum = sum;
              } else if(op[i-1] == '-'){
                num[i-1] = num[i-1] - num[i];
//                 print("Если перед * идет - : ${num[i-1]}");
                sum = sum;
              } else {
                sum = sum * num[i+1];
              }
//               print(sum);
              break;
            default: break;
          }
        }
      print("Результат: $sum");
    }
  
  int lastPos = 0;
  List<double> exprVar = [];
  List<String> operator = [];
  try{
      if(expression[0] == '-') {
          expression = expression.substring(0, 0) + '0' + expression.substring(0, expression.length);
      }
      for (int i = 0; i < expression.length; i++) {

          if (expression[i] == "+" || expression[i] == "-" || expression[i] == "/" || expression[i] == "*") {

              operator.add(expression[i]);
        
              exprVar.add(double.parse(expression.substring(lastPos, i)));
              lastPos = i+1;
          }

          else if (i == expression.length - 1) {
              exprVar.add(double.parse(expression.substring(lastPos, i+1)));
          }   
      }
    
      print("Все числа в строке: $exprVar\n");
      print("Все операторы в строке: $operator\n");
    
      func(exprVar, operator);
    
  }
  catch(e){
    print("Возникло исключение $e");
  }
}