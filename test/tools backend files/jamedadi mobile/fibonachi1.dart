

f(int a){
if (a<0) {
  print("voroodo eshtebah ast");
}
else if (a==0) {
  print("0") ;
}
else if (a==1) {
  print("1") ; 
}
else {
var b=1;
var c=1;
var d;
for(int i=0;i<a;i++){
d=b;
b=b+c;
c=d;
var fibo = [c];
print(fibo) ; 
};
}

}
main() {
  print("[1]");
  var ff = 7 ; 
  f(ff); 
}