/* 
 // Gerador aleatório de Política de Privacidade
 // desenvolvido por Artur V. Cordeiro - maio/2020
 */


String frase = "";
String texto[];

int objInd = 0; // índice do array de objetos

int contador = 0;

IntList listaVbo; // lista númerica de verbos
IntList listaObj; // lista numérica de objetos
int indiceV = 0; // índice da lista de verbos
int indiceO = 0; // índice da lista de objetos
int quantidade = 0;


void setup() {
  size(800, 400);

  listaVbo = new IntList(); // cria uma instância da lista
  listaObj = new IntList(); // cria uma instância da lista

  for (int i = 0; i < verbo.length; i++) {
    listaVbo.append(i); // adidiciona os índices do array de verbos na lista
  }



  for (int i = 0; i < objeto.length; i++) {
    listaObj.append(i); // adidiciona os índices do array de objetos na lista
  }

  println("listaVbo: " + listaVbo + " | listaObj: " + listaObj);
  listaVbo.shuffle(); // embaralha a ordem dos índices da lista de verbo
  listaObj.shuffle(); // embaralha a ordem dos índices da lista de objetos
}

void draw() {
  background(#333333);

  if (contador % 1 == 0 && objInd < objeto.length) {
    frase += verbo[listaVbo.get(indiceV)] + " " + objeto[listaObj.get(indiceO)] + ".,";
    texto = split(frase, ",");

    objInd++;

    if (indiceO < objeto.length) {
      indiceO++;
      if (indiceV < verbo.length-1) {
        indiceV++;
      } else {
        indiceV = 0;
        listaVbo.shuffle();
      }
    }
  }

  textSize(24);
  if (texto.length >= 1 && objInd < objeto.length) {
    fill(#3333EE);
    text(texto[texto.length - 2], 50, height/2 + 50);
  } else {
    fill(#1111EE);
    text("Clique para salvar 'PoliticaDePrivacidade.txt'", 50, height/2 + 50);
    //println(texto);

    noLoop();
  }

  fill(#AAAAAA);
  textSize(20);
  text("Frases geradas: " + (texto.length-1), 50, height/2 + 90 );

  contador++;
}



void mouseClicked() {
  for (int i = 5; i < texto.length - quantidade; i+=5) { 
    texto = splice(texto, "", i + quantidade);
    quantidade++;
  }
  texto = shorten(texto);
  saveStrings("PoliticaDePrivacidade.txt", texto);
}
