/* 20. Armazenar o nome, sexo e idade de 5 pessoas. As entradas devem ser apenas “F” ou “M” 
 * para o sexo e valores positivos para a idade. Após a digitação dos dados, exibir os dados 
 * (nome, sexo e idade) de todas as pessoas do sexo feminino. */

void main() {
  Map dados = {
    "cliente_01": {"nome": "Vitor", "idade": 24, "sexo": "M"},
    "cliente_02": {"nome": "Matheus", "idade": 20, "sexo": "M"},
    "cliente_03": {"nome": "Saulo", "idade": 19, "sexo": "M"},
    "cliente_04": {"nome": "Judite", "idade": 50, "sexo": "F"},
    "cliente_05": {"nome": "Maria", "idade": 10, "sexo": "F"}
  };

  for (dados in dados.values) {
    if (dados["sexo"] == "F") {
      String nome = dados["nome"];
      String sexo = dados["sexo"];
      int idade = dados["idade"];

      print("Nome: $nome");
      print("Idade: $idade");
      print("Sexo: $sexo");
      print("-------------------------------");
    }
  }
}
