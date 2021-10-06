garma(){
  //adad haye x_num ha farzi and
  // c = cantigrad (emlasho yadam raft :) ) f = farenhayt (inam mese ghabli :|) k = kelvin
  garma_k(){
    double K_num = 273.15 ;
    // k to f 
    double k_f1 = 9 / 5 ; 
    double k_f2 = K_num * k_f1 ; 
    double k_f = k_f2 - 459.67 ; 
    print("k to f");
    print(k_f);  
    //k to c 
    double k_c = K_num - 273.15 ;
    print("k to c");
    print(k_c);
  }
  garma_f(){
    double f_num = 100 ;
    //f to k 
    double f_k1 = f_num + 459.67 ;
    double f_k2 = 5 / 9 ;
    double f_k = f_k1 * f_k2 ; 
    print("f to k");
    print(f_k);
    //f to c
    double f_c1 = f_num - 32 ;  
    double f_c2 = 5 / 9 ;
    double f_c  = f_c1 * f_c2 ; 
    print("f to c");
    print(f_c);
  }
  garma_c(){
    double c_num  = 50 ; 
    //hava enghad shokhmiye bemola
    //c to f
    double c_f1 = 9 / 5 ;
    double c_f2 = c_num * c_f1 ; 
    double c_f = c_f2 + 32 ;
    print("c  to f ");
    print(c_f);
    //c to k 
    double c_k = c_num + 273.15 ; 
    print("c to k ");
    print(c_k);
  }
  garma_k();
  garma_f();
  garma_c();
}
main(){
  garma();
}