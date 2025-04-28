public class Inventario {
  Lista items;
  Jugador jugador;
  
  
  public Inventario (Jugador jugador) {
    this.items = new Lista();
    this.jugador = jugador;
  }
}
