//Xcode has another interface called playground.Using p/g we don't have to create a whole project in Xcode.you’ll be using Playgrounds to dig deeper into programming in Swift. This way, you can easily focus on the core concepts of the Swift language, like functions and classes, without getting worrying about UI like buttons, labels, and sliders.

import UIKit

var greeting = "silver lining"

// var for variables means they are mutable [value can be changed]
//let for constant means they are immutable [value cannot be changed]

//converting types Int to String
//let ageAsString = String(myAge)

var env = "build"
var maximumAttempts:Int
if env == "development" {
    maximumAttempts = 100
} else {
    maximumAttempts = 10
}
//if age > 11 {
//    print("go to school")
//}
let age=13
if age > 11
{
    print("go to school")
}


//var env = "build"
//var maximumAttempts: Int
//
//if env == "development" {
//    maximumAttempts = 100
//} else {
//    maximumAttempts = 10
//}
/*
 
 */

//OPTIONALS -   it let you declare varaibles and constant that may or maynot have value inside. We use optionals when we are not condident that value will exist when our program runs
let msg="see'u"
let msg1="this is sidebar"
print(msg)
print("this is console")

//If you go to Editor > Show Raw Markup, you’ll see that these are a special type of comment in Xcode known as “Documentation Markup”.

//The two forward slashes, followed by a colon, tell Xcode “Hey, the code in here is written in something called Markdown”, and Xcode will display this differently from the rest of the code.
//
//Markdown is a simple language that lets you format text and add things like links; you don’t need to know Markdown for this course.

//diretly assigning boolean value
let yes=true
let no=false

//now defing boolean using expressions
/* if diff == 0
{
    
}       */

let passingGrade=70
let StudentGrade=77
let StudendPaseed=passingGrade>StudentGrade
if passingGrade>StudentGrade
{
    print("passs")
}
else{
    print("faill")
}

let chris=50
let sam=60
sam==chris
sam != chris
let sampassed=sam>passingGrade
let chrispassed=chris>passingGrade

!sampassed
// Not Operator

//AND Operator
let bothpassed = sampassed&&chrispassed
let eitherpassed = sampassed||chrispassed

var betterstudent:String
if sam>chris
{
    betterstudent="sam"
}
else{
    betterstudent="chris"
}


//Ternary Operator
// expression ? true value : false value
var betterStudent = sam > chris ? "Sam" : "Chris"

let myAge1=22
if myAge1 >= 13 && myAge1 <= 19 {
    print("Teenager")
} else
{
    print("Not a teenager")
}


//Swift can also compare Strings

let acom="oz"
let avom1="qzw"

acom==avom1

acom > avom1

let myAge = 22
let isVoting = myAge >= 18

// Logical operator only used for booleans
//let name = "oza"
//!name  --> cannot convert string value to boolean


//OPTIONALS: it represent either a value or absence of a value,which is called nil.
// We have to define type of optionals.

// add ? to make optional
var petName: String?
petName="mang"
print(petName)  //--> optional mango bcoz value is still wrapped up
// How to change optional to no value --> just use value "nil" instead of a value
petName=nil

//Unwrapping a Optional

var result: Int? = 22   // making optional
print (result)
// print (result+1)  --> to do this we have to unwrap optional
//compiler don't know if optional has value or its nil until we unwrapped the optional
// the best way is Force Unwrapping--> only use this when we know optional has a value otherwise error if optional is declared nil

petName="mang"
var petage: Int? = 11
//unwrapping petname by ! mark
var unwrappedPetName = petName!
print("petname is \(unwrappedPetName)")
var unwrappedPetAge = petage!
print("petage is \(unwrappedPetAge)")

//if optional value defined to nil so Force unwrapping will not work so use OPTIONAL BINDING

//USING OPTIONAL BINDING- it is similar to if-else statememt if optionals are nil so else will execute
if let petName=petName,
let petage=petage {
    print("The pet is \(petName) and they are \(petage)")
} else {
    print("No pet name or age")
    
}




let hasAllergies=true
let dogName:String?
dogName = hasAllergies ? nil :"mang"


let parseInt=Int("10")
//convert string to Interger --> Swift implicitly creates ParseInt as an optional just in case it can't convert what is inside string.

// string to integer
let newParsedInt=Int("alen") //--> here swift can't convert String to Interger, it just sets newParsedInt to nil.






































