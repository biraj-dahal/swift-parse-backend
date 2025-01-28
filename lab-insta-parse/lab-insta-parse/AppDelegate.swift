import UIKit
import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    struct TestObject: ParseObject {
        init() {
            
        }
        
        var originalData: Data?
        var objectId: String? // Parse object id
        var createdAt: Date? // Date of object creation
        var updatedAt: Date? // Date of last update
        var ACL: ParseACL? // Access Control List

        // Custom properties
        var name: String?
        var score: Int?

        // Custom initializer
        init(name: String, score: Int) {
            self.name = name
            self.score = score
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize ParseSwift SDK
        ParseSwift.initialize(applicationId: "ALu0uDuIMShfKdZr7NYglZaeVwramGPOuMbw5GZn",
                              clientKey: "9nQVVapEszJSiyWtMKDPxT290gVr5VKoKMLTzRfl",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)

        // Instantiate and save a test object
        let testObject = TestObject(name: "John Doe", score: 42)
        testObject.save { result in
            switch result {
            case .success(let savedObject):
                print("Object saved successfully: \(savedObject)")
            case .failure(let error):
                print("Failed to save object: \(error.localizedDescription)")
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Handle scene session discard
    }
}


// TODO: Pt 1 - Create Test Parse Object
// https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/1%20-%20Your%20first%20Object.xcplaygroundpage/Contents.swift#L33


