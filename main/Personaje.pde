public class Personaje {
  private String nombre;
  private double vida;
  private double x;
  private double y;
  private int nivel;
  private double fuerza;
  private double velocidad;
  private ArrayList<Habilidad> habilidades;
  
  public void mover(String direccion) {
    switch (direccion) {
      case "IZQ":
        this.x-= velocidad;
         break;
       case "DER":
         this.x+= velocidad;
         break;
       case "ARB":
         this.y -= velocidad;
         break;
        case "ABJ":
          this.y+= velocidad;
          break;
    }    
  }
  
  public void habilidad (int index) {
    this.habilidades.get(index).accionar();
  }
  
  public void accionar (Objeto objeto){
  }
}
