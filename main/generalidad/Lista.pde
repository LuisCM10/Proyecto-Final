public class Lista {
  private Nodo first;  
  private Nodo last;  
  
  public Lista () {
    this.first = null;
    this.last = null;
  }
  
  
  public void add(Objeto item) {
    if (first != null) {
      this.last.setDer(new Nodo(item));      
    } else {
      this.first = new Nodo(item);
    }
  }
}
