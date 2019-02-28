/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    func description() {
        print("The title is \(title), and the author is \(author). There are \(pages) pages in the book and it is \(price) dollars")
    }
}
var OwenMeany = Book(title: "A Prayer for Owen Meany", author: "John Irving", pages: 617, price: 7.19)
OwenMeany.description()
/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    mutating func addLike () {
        likes += 1
    }
}
var newspaper = Post(message: "The Washington Post", likes: 50, numberOfComments: 100)
print(newspaper.likes)
newspaper.addLike()
print(newspaper.likes)
//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
