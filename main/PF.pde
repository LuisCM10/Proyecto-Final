
PImage muñeco, lobby, lobby2, muñecoizq, muñecoAct, botonStart, zonaEste,seleccionSkin,portal;
float muñecoX, muñecoY;
String estado = "inicio";
boolean cambiarZona = false;
PImage[] framesDer = new PImage[4];
PImage[] framesIzq = new PImage[4];
int frameActual = 0;
int frameDelay = 5;
int frameContador = 0;
boolean caminando = false;
boolean mirandoDerecha = true;
void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(32);
  
  // Carga de imágenes (manteniendo tus nombres exactos)
  muñeco = loadImage("p1.der.png");
  muñecoizq = loadImage("p1.izq.png");
  lobby = loadImage("lobby.png");
  lobby2 =loadImage("inicio.png");
  seleccionSkin = loadImage("seleccion.png"); // Reemplaza con el nombre correcto
  zonaEste = loadImage("mapa1.png");
  botonStart = loadImage("start.png");
  zonaEste = loadImage("mapa1.png");
  portal = loadImage("portal.png");
  for (int i = 0; i < 4; i++) {
  framesDer[i] = loadImage("p1.d" + (i+1) + ".png");
  framesIzq[i] = loadImage("p1.d" + (i+1) + ".png");
}
muñecoAct = framesDer[0];
  // Posiciones iniciales exactas como las tenías
  muñecoX = width / 2;
  muñecoY = height / 2 + 100;
  
}

void draw() {
  // Limpiar pantalla en cada frame
  background(0);
  
  // Sistema de pantallas
  switch(estado) {
    case "inicio":
      pantallaDeInicio();
      break;
    case "seleccion":
      pantallaSeleccion();
      break;
    case "juego":
      pantallaDeJuego();
      break;
    case "lobby":
      pantallaLobby();
      break;
    case "zonaEste":
      pantallaZonaEste();
      break;
  }
}

// Tus funciones originales con ajuste mínimo
void pantallaDeInicio() {
  image(lobby2, 0, 0, width, height);
  image(botonStart, width / 2 - 100, height / 2 + 180, 200, 50);
}

void pantallaSeleccion() {
  image(seleccionSkin, 0, 0, width, height);
  image(muñeco, width/2 - 200, height/2 - 50, 100, 100);
  image(muñecoizq, width/2 + 100, height/2 - 50, 100, 100);
  textSize(20);
  text("Skin 1", width/2 - 150, height/2 + 70);
  text("Skin 2", width/2 + 150, height/2 + 70);
}

void pantallaDeJuego() {
  image(lobby, 0, 0, width, height);
  image(portal, 520, 220, 140, 190); 
  dibujarPersonaje();
 if (muñecoX > 520 && muñecoX < 660 && muñecoY > 220 && muñecoY < 410) {
  estado = "zonaEste";
  muñecoX = 50;
  muñecoY = 250;
}


}






void pantallaLobby() {
  image(lobby, 0, 0);
  dibujarPersonaje();
}

void pantallaZonaEste() {
  image(zonaEste, 0, 0, width, height);
  dibujarPersonaje();
  
  // Volver al lobby si llega al borde izquierdo
if (muñecoX < 10) {
  estado = "juego";
  muñecoX = 450;  // Justo a la derecha del portal
  muñecoY = 320;  // Una altura centrada respecto al portal
}

}

// Nueva función para dibujar al personaje una sola vez
void dibujarPersonaje() {
  float escala = 5;
  float ancho = muñecoAct.width * escala;
  float alto = muñecoAct.height * escala;

  if (caminando) {
    frameContador++;
    if (frameContador >= frameDelay) {
      frameContador = 0;
      frameActual = (frameActual + 1) % 4;
      if (mirandoDerecha) {
        muñecoAct = framesDer[frameActual];
      } else {
        muñecoAct = framesIzq[frameActual];
      }
    }
  }

  image(muñecoAct, muñecoX - ancho / 2, muñecoY - alto / 2, ancho, alto);
}

// TUS CONTROLES ORIGINALES SIN CAMBIOS
void mousePressed() {
  if (estado.equals("inicio")) {
    if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100 &&
        mouseY > height / 2 + 200 && mouseY < height / 2 + 250) {
      estado = "seleccion";
    }
  } else if (estado.equals("seleccion")) {
    if (mouseX > width/2 - 200 && mouseX < width/2 - 100 &&
        mouseY > height/2 - 50 && mouseY < height/2 + 50) {
      muñecoAct = framesDer[0];
      estado = "juego";
    }
    if (mouseX > width/2 + 100 && mouseX < width/2 + 200 &&
        mouseY > height/2 - 50 && mouseY < height/2 + 50) {
      muñecoAct = framesDer[0];
      estado = "juego";
    }
  }
}

void keyPressed() {
  float velocidad = 5;
  caminando = true;

  if (keyCode == LEFT) {
    muñecoX -= velocidad;
    mirandoDerecha = false;
  } else if (keyCode == RIGHT) {
    muñecoX += velocidad;
    mirandoDerecha = true;
  } else if (keyCode == UP) {
    muñecoY -= velocidad;
  } else if (keyCode == DOWN) {
    muñecoY += velocidad;
  }

  muñecoX = constrain(muñecoX, 0, width);
  muñecoY = constrain(muñecoY, 0, height);
}

void keyReleased() {
  caminando = false;
  frameActual = 0;
  muñecoAct = mirandoDerecha ? framesDer[0] : framesIzq[0];
}
