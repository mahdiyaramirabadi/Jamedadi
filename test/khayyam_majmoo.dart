//factorial formol
//fac_m(){
//  var num =  ;
// var factorial = 1;
//
//  for( var i = num ; i >= 1; i-- ) {
//    factorial *= i ;
//  }

khayyam_majmoo() {
  double m = 3;
  //m = ghotr ha
  double n = 2;
  //n = adad dar ghotr
  double m1 = m + 1;
  double mn1 = m + n;
  double n1 = n - 1; 



  double num1 = m1 ;
  double factorialm = 1;
  for( var i = num1 ; i >= 1; i-- ) {
    factorialm *= i ;
  }



  double fac_m  = factorialm ;
  



  double num2 = mn1 ;
  double factorialmn = 1;
  for( var i = num2 ; i >= 1; i-- ) {
    factorialmn *= i ;
  }


  double fac_mn =  factorialmn ; 


  double num3 = n1 ;
  double factorialn = 1;
  for( var i = num3 ; i >= 1; i-- ) {
    factorialn *= i ;
  }



  double fac_n = factorialn ;


  double res_1 = fac_mn / fac_n ; 
  double res_2 = res_1 / fac_m ; 
  print(res_2);
}
main(){
khayyam_majmoo() ;
}
