public virtual class Shape {
    private integer length = 10 ;
    private integer breadth = 20 ;

    public virtual  void area(){
        System.debug('Area of:::');
    }
    //get length 
    public  virtual  Integer getLength(){
        return length;
    }

    public virtual Integer geBreadth(){
        return breadth;
    }
}