import Vapor
import Leaf

let dev = Developer(name: "Alper", title: "iOS Developer", company: "Adastra.one")

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    // example: http://localhost:8002/name

    router.get("name") { req in
        return dev.name
    }

    router.get("title") { req in
        return dev.title
    }

    router.get("json") { req in
        return dev
    }

/// The function req.view() creates and returns a ViewRenderer.
/// And since we configured LeafRenderer as our ViewRenderer we can use .leaf files 🍃!
    router.get("welcome") { req -> Future<View> in
        return try req.view().render("welcome")
    }

    router.get("aboutMe") { req -> Future<View> in
        return try req.view().render("aboutMe", dev)
    }

}

struct Developer: Content {
    var name: String
    var title: String
    var company: String
}
