class Albero {
    public int info;
    public Albero sinistro;
    public Albero destro;
    public Albero padre;
    public Albero(int i, Albero s, Albero d, Albero p) {
        info=i;
        this.sinistro=s;
        this.destro=d;
        this.padre= null;
    }
    public int conta(){return conta(this);}
    public static int conta(Albero a){
        return (a==null) ? 0 : conta(a.destro)+conta(a.sinistro)+1;
    } 
}