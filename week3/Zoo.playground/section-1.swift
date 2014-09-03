class Zoo{
    let n : String
    let f : String
    
    var name:[String] = ["Tiger","Cat","Dog"]
    var food:[String] = ["Beef","Fride","Peddeegee"]
    
    
    init(name:String, food:String){
        self.n = name
        self.f = food
    }
    
    func  Zooname (){
        name += n
        food += f
    }
    
    
}

let test = Zoo(name:"Ant",food:"Tree")
test.Zooname()