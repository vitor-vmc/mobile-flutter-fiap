/* 11. Entrar via teclado com um valor qualquer. Após a digitação, exibir a tabuada do 
 * valor solicitado, no intervalo de um a dez.
 * */

void main() {
  int valor = 4;
  
  for(int i = 1; i <= 10; i++) {
    int valorTabuada = valor * i;
    print("$valor * $i = $valorTabuada");
  }
}