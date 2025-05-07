public class Nodo {
  private Nodo izq;
  private Nodo der;
  private Objeto item;
  
  public Nodo (Objeto item) {
    this.item = item;
    this.izq = null;
    this.der = null;
  }
  
  public void setIzq (Nodo izq) {
    this.izq = izq;
    izq.setDer(this);
  }
  
  public void setDer (Nodo der) {
    this.der = der;
    der.setIzq(this);
  }
}
