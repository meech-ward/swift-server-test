import Vapor

let droplet = Droplet()

droplet.get("/hello") { request in
    return "Hello Sam!"
}

droplet.get("/hello/html") { request in
    return try droplet.view.make("hello.html")
}

droplet.get("/hello/json") { request in
    
    let json = ["Greeting" : "Hello"]
    
    return try JSON(node: json)
}

droplet.post("/useCode") { request in
    
    guard let code = request.json?["code"]?.string else {
        throw Abort.badRequest
    }
    
    let database = MyDatabase()
    
    do {
        try database.useCode(code: code)
    } catch CodeError.codeNotFound {
        throw Abort.custom(status: .badRequest, message: "Your code: \(code) was not found")
    }
    
    let json = ["status" : "success"]
    return try JSON(node: json)
}

droplet.run()
