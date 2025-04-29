JSONObject json;

public class Jugador {
  private Juego juego;
  private int index;
  private String nombre;
  private double progreso;
  private int tiempoJuego; // tiempoJuego + millis()
  private Personaje personaje;
  private Inventario inventario;
  
  public Jugador (String nombre, int index, Juego juego) {
    this.juego = juego;
    this.index = index;
    this.nombre = nombre;
    this.progreso = 0;
    this.tiempoJuego = 0;
    this.personaje = null;
    this.inventario = new Inventario(this);
  }
  
  public void guardarProgreso () {
    this.juego.actualizarJugador(this.index, this);    
  }

  public void addItem (Objeto item) {
    this.inventario.addItem(item);
  }
  public void removeItem (Objeto item) {
    this.inventario.removeItem(item);
  }
  
  public ArrayList<Objeto> getInventarioItems() {
    return this.inventario.getItems();
  }
  
  public void clearInventario() {
    this.inventario.clearItems();
  }
  
  public void mostrarInventario() {
    for (Objeto item : this.getInventarioItems()) {
      System.out.println(item.getNombre());
    }
    System.out.println("Total items: " + this.getInventarioItems().size());
  }
}
