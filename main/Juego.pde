public class Juego {
  private ArrayList<Jugador> jugadores;
  private double mejorProgreso;
  
  public void addJugador(String nombre) {
    int index = this.jugadores.size();
    this.jugadores.add(new Jugador(nombre, index, this));
  }
  
  public void guardaJugadores () {
  }
  
  public void actualizarJugador(int index, Jugador jugador)  {
    this.jugadores.set(index, jugador);
  }
  
}
