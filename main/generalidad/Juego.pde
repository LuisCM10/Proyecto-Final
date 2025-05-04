public class Juego {
  private ArrayList<Jugador> jugadores;
  private double mejorProgreso;

  public Juego () {
    if (loadJSONArray("jugadores.json") != null) {
      cargarJugadores();
    } else {
      this.jugadores = new ArrayList<Jugador>();
      this.mejorProgreso = 0;
    }
    
  }
  
  public void addJugador(String nombre) {
    int index = this.jugadores.size();
    this.jugadores.add(new Jugador(nombre, index, this));
  }
  
  public void guardaJugadores () {
    JSONArray personas = new JSONArray();
    for (Jugador jugador: this.jugadores) {
      JSONObject persona = new JSONObject();
      persona.setString("nombre", jugador.getNombre());
      persona.setDouble("progreso", jugador.getProgreso());
      persona.setInt("tiempoJuego", jugador.getTiempoJuego());
      persona.setString("personaje", jugador.getPersonaje().getNombre());
      for (Objeto item: jugador.getInventario().getItems()) {
        persona.append("inventario", item.getNombre());
      }
      persona.setInt("index", jugador.getIndex());
      personas.append(persona);
    }
    saveJSONArray(personas,"jugadores.json");
    System.out.println("Jugadores guardados exitosamente.");

  }
  
  public void actualizarJugador(int index, Jugador jugador)  {
    this.jugadores.set(index, jugador);
  }

  public Jugador getJugador(int index) {
    return this.jugadores.get(index);
  }

  public ArrayList<Jugador> getJugadores() {
    return this.jugadores;
  }

  public double getMejorProgreso() {
    return this.mejorProgreso;
  }

  public void cargarJugadores() {
    JSONArray personas = loadJSONArray("jugadores.json");
      this.jugadores = new ArrayList<Jugador>();
      for (int i = 0; i < personas.size(); i++) {
        JSONObject persona = personas.getJSONObject(i);
        Jugador jugador = new Jugador(persona.getString("nombre"), persona.getInt("index"), this);
        jugador.setProgreso(persona.getDouble("progreso"));
        jugador.setTiempoJuego(persona.getInt("tiempoJuego"));
        jugador.setPersonaje(new Personaje(persona.getString("personaje")));
        for (int j = 0; j < persona.getJSONArray("inventario").size(); j++) {
          jugador.addItem(new Objeto(persona.getJSONArray("inventario").getString(j)));
        }
        this.jugadores.add(jugador);
      }
      this.mejorProgreso = 0;
      for (Jugador jugador : this.jugadores) {
        if (jugador.getProgreso() > this.mejorProgreso) {
          this.mejorProgreso = jugador.getProgreso();
        }
      }
      System.out.println("Jugadores cargados exitosamente.");
  }
}
