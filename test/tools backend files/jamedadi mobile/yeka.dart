yeka(){
double adad = 12 ;
double zarid_dade = 3 ;
double zarib_khaste = 5 ;
double tavan_kol = 3 ; 
//tavan kol = te'dad parametr haye dakhil => masahat = m * m => tavan kol = 2
double zarib_kol = zarid_dade - zarib_khaste ;
double res_yeka = zarib_kol * tavan_kol ;
List res_yeka2 = [adad , "*10^" , res_yeka ] ; 
print(res_yeka2);
}
main(){
  yeka() ;
}