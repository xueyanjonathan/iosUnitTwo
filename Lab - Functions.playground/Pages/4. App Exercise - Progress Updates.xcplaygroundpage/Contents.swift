/*:
 ## App Exercise - Progress Updates
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 In many cases you want to provide input to a function. For example, the progress function you wrote in the Functioning App exercise might be located in an area of your project that doesn't have access to the value of `steps` and `goal`. In that case, whenever you called the function, you would need to provide it with the number of steps that have been taken and the goal for the day so it can print the correct progress statement.
 
 Rewrite the function `progressUpdate`, only this time give it two parameters of type `Int` called `steps` and `goal`, respectively. Like before, it should print "You're off to a good start." if steps is less than 10% of goal, "You're almost halfway there!" if steps is less than half of goal, "You're over halfway there!" if steps is less than 90% of goal, "You're almost there!" if steps is less than goal, and "You beat your goal!" otherwise. Call the function and observe the printout.
 
 Call the function a number of times, passing in different values of `steps` and `goal`. Observe the printouts and make sure what is printed to the console is what you would expect for the parameters passsed in.
 */
func progressUpdate(_ steps: Int, _ goal: Int) {
    if Double(steps) < (Double(goal) * 0.1) {
        print("You are off to a good start.")
    } else if Double(steps) < (Double(goal) * 0.5) {
        print("You are almost halfway there")
    } else if Double(steps) < (Double(goal) * 0.9) {
        print("You are over halfway there")
    } else {
        print("You beat your goal!")
    }
}
progressUpdate(900, 10000)
progressUpdate(4900, 10000)
progressUpdate(8900, 10000)
progressUpdate(10100, 10000)
/*:
 Your fitness tracking app is going to help runners stay on pace to reach their goals. Write a function called pacing that takes four `Double` parameters called `currentDistance`, `totalDistance`, `currentTime`, and `goalTime`. Your function should calculate whether or not the user is on pace to hit or beat `goalTime`. If yes, print "Keep it up!", otherwise print "You've got to push it just a bit harder!"
 */
func pacing(currentDistance: Double, totalDistance: Double, currentTime: Double, goalTime: Double) {
    if currentDistance / currentTime < totalDistance / goalTime {
        print("You've got to push it just a bit harder.")
    } else if currentDistance / currentTime > totalDistance / goalTime {
        print("Keep it up!")
    }
}
pacing(currentDistance: 50, totalDistance: 100, currentTime: 10, goalTime: 10)
pacing(currentDistance: 100, totalDistance: 1000, currentTime: 1, goalTime: 1000)
//: [Previous](@previous)  |  page 4 of 6  |  [Next: Exercise - Return Values](@next)
