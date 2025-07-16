# iOS Exercise

GitHub followers app from Sean Allen course
https://seanallen.teachable.com/courses/681906/

## Links

### Content

- [GitHub API](https://docs.github.com/pt/rest?apiVersion=2022-11-28)
- [Writing constraints programmatically](https://www.avanderlee.com/swift/auto-layout-programmatically/)
- [Codable cheat sheet](https://www.hackingwithswift.com/articles/119/codable-cheat-sheet)
- [Swift Strong and Weak References](https://www.programiz.com/swift-programming/strong-weak-reference)
- [NSDateFormatter.com](https://www.nsdateformatter.com/)
- [Communication Patterns in Swift](https://medium.com/@hakanor/communication-patterns-in-swift-0725041ad409)
- [Mastering Swift Notification Observers with Coding Examples](https://vikramios.medium.com/swift-notification-observers-bbc5b86a7781)

### Arch

- [MVC](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)
- [MVC vs MVVM](https://www.netguru.com/blog/mvc-vs-mvvm-on-ios-differences-with-examples)

### Packages

- [SemanticUI](https://github.com/cocoacontrols/SemanticUI)
- [TinyConstraints](https://github.com/roberthein/TinyConstraints)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Moya](https://github.com/Moya/Moya)

## Annotations

###UIView:
Purpose:
Represents a rectangular area on the screen and handles drawing and event handling within that area. 
Examples:
Labels, buttons, images, text fields, and any other visual element you see on the screen are instances of UIView or its subclasses. 
Responsibility:
A UIView is primarily responsible for rendering content and responding to user interactions within its bounds. It knows how to draw itself and how to respond to touches, gestures, and other events. 
Life Cycle:
UIViews have their own lifecycle involving updates, layout, and rendering, which can be triggered by changes in the view's bounds or constraints. 

###UIViewController 
Purpose: Manages a single view and its associated content, handling user interactions and data flow. 
Lifecycle: Has a defined lifecycle (viewDidLoad, viewWillAppear, etc.) that UIKit manages. 
Presentation: Can be presented modally or pushed onto a navigation stack. 
Root View: Has a single root view, which can have subviews. 

###ChildViewController 
Purpose: A view controller that is managed by another view controller (the "parent"). 
Containment: Allows for creating modular, reusable UI components. 
Relationship: A parent view controller can have multiple child view controllers, creating a hierarchy. 
Benefits: Improves code organization, promotes reusability, and simplifies testing. 
Lifecycle: Child view controllers have their own lifecycle and can interact with the parent's lifecycle events. 
Example: A dashboard screen might have a main view controller managing the overall layout and child view controllers for individual sections like a user profile or recent activity. 

### UIViewController vs. UIViews
UIView is the basic building block for visual elements, while UIViewController manages the content and behavior of a view or a set of views. Essentially, UIView is the "what" (the visual representation), and UIViewController is the "how" (the logic and management behind the view). 

### Communication Patterns
Delegates & Protocols = one to one
Notifications & Observers = one to many

#### Delegates & Protocols
(1) Pros
Loose Coupling:
Delegates allow objects to interact without needing to know each other's specific implementation details. This means changes in one object are less likely to break other parts of the code. 
Code Reusability:
Protocols define a contract that multiple classes can adhere to. This enables code reuse, as the same protocol can be implemented by different objects, leading to more maintainable and extensible code. 
Flexibility and Extensibility:
Delegation allows for dynamic behavior. By changing the delegate object, you can easily modify the behavior of a class at runtime without modifying its core code. 
Event Handling:
Delegates are commonly used for handling events and callbacks, allowing one object to notify another about specific actions or changes. 

(2) Cons
Boilerplate Code:
Implementing delegates often requires more initial setup and boilerplate code compared to simpler approaches like closures, especially when defining the protocol and creating the delegate relationship. 
Potential for Strong Reference Cycles:
If not handled carefully, delegates can lead to strong reference cycles, where two objects hold strong references to each other, preventing them from being deallocated. This can cause memory leaks. 
Debugging Complexity:
Understanding the flow of execution when using delegates can be more complex, especially in larger projects with multiple layers of delegation. 
Tight Coupling (with caveats):
While delegation generally promotes loose coupling, using it in a way that overly constrains the delegate's implementation can lead to tight coupling, where changes in the protocol necessitate changes in the delegate implementation. 

#### Notifications & Observers 
(1) Pros
Decouples objects: Easy to modify or add new functionality without affecting other parts of the code. This can help make our code more modular and maintainable.
One-to-many relationship: A single observable object can notify multiple observer objects at once. This is useful when multiple objects need to be notified of changes in a state.
Event-driven programming: Simplify the design of code, making it more intuitive and easier to follow.

(2) Cons
Memory leaks: Prone to memory leaks if observers are not properly removed from the observable object when they are no longer needed. This might be problematic in long-running applications where objects are created and destroyed frequently.
Efficiency: Less efficient than other communication patterns, as each observer needs to be notified individually when a change occurs. This can result in performance issues if there are a large number of observers or if updates occur frequently.
Control flow: Difficult to reason about the flow of data and control, as observers can be notified at unpredictable times. This can make it harder to debug issues.

#### DispatchQueue.main.async
DispatchQueue.main.async is a method in Swift (and other languages with similar concurrency APIs) used to execute a block of code asynchronously on the main thread. It ensures that UI updates and other tasks that must run on the main thread are handled properly, preventing UI blocking and potential crashes. 
