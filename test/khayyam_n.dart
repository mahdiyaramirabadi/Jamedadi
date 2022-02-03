khayyam_n(){
double m = 3 ;
//m = ghotr 
double n = 2 ; 
//n = adad dar ghotr 
double mn = m + n  ; 
//m+n
double mn1 = mn - 1 ; 
//m+n - 1 
double n1 = n - 1 ; 
//n - 1 


double num1 = m ;
double factorialm = 1;
for( var i = num1 ; i >= 1; i-- ) {
  factorialm *= i ;
}


double fac_m = factorialm ; 

double num2 = mn1 ;
double factorialmn = 1;
for( var i = num2 ; i >= 1; i-- ) {
  factorialmn *= i ;
}


double fac_mn = factorialmn ; 


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
  khayyam_n() ; 
}