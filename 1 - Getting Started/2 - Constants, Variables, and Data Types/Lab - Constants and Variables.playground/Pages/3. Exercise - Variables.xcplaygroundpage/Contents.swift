/*:
## Exercise - Variables
 
 Declare a variable `schooling` and set it to the number of years of school that you have completed. Print `schooling` to the console.
 */
var schooling : Int = 11
print(schooling)

let schooling2 : Int = 10
print(schooling2)
//:  Now imagine you just completed an additional year of school, and update the `schooling` variable accordingly. Print `schooling` to the console.
schooling += 1
//schooling2 += 1

print(schooling)
print(schooling2)
//:  Does the above code compile? Why is this different than trying to update a constant? Print your explanation to the console using the `print` function.
print("Because we can change the value of var variable")
print("We can't change the value of a let(constant) variable")
print("because it's constant, it can't be changed.")
/*:
[Previous](@previous)  |  page 3 of 10  |  [Next: App Exercise - Step Count](@next)
 */
