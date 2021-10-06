List numbers = [];

int a = 0;
int b= 1;
int count = 0;

main(){
  while(count < 10){
    b = b +a;
    a = b;

    numbers.add(b);
    count = count + 1;



  }
  print(numbers);
}