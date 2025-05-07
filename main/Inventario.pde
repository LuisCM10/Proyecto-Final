public class Inventario {
  ArrayList<Objeto>items;
  Jugador jugador;
  
  
  public Inventario (Jugador jugador) {
    this.items = new ArrayList<Objeto>();
    this.jugador = jugador;
  }
  
  public void addItem(Objeto item) {
    this.items.add(item);
  }
  
  public void removeItem(Objeto item) {
    this.items.remove(item);
  }
  
  public ArrayList<Objeto> getItems() {
    return this.items;
  }
  
  public void clearItems() {
    this.items.clear();
  }
  
  
}
