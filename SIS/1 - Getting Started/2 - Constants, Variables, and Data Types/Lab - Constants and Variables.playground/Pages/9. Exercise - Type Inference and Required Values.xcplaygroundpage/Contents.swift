/*:
## Exercise - Type Inference and Required Values
 
 Declare a variable called `name` of type `String`, but do not give it a value. Print `name` to the console. Does the code compile? Remove any code that will not compile.
 */
var txt : String
//print(String)
//It doesnt compile
//:  Now assign a value to `name`, and print it to the console.
txt = "Name"
print(txt)
//:  Declare a variable called `distanceTraveled` and set it to 0. Do not give it an explicit type.
//var distanceTraveled = 0
var distanceTraveled : Double = 0
//:  Now assign a value of 54.3 to `distanceTraveled`. Does the code compile? Go back and set an explicit type on `distanceTraveled` so the code will compile.
distanceTraveled = 54.3
// no, becouse Cannot assign value of type 'Double' to type 'Int'
print(distanceTraveled)

/*:
[Previous](@previous)  |  page 9 of 10  |  [Next: App Exercise - Percent Completed](@next)
 */
