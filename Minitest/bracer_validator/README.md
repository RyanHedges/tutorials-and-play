You're working with an intern that keeps coming to you with JavaScript code that
won't run because the braces, brackets, and parentheses are off. To save you
both some time, you decide to write a braces/brackets/parentheses validator.

Let's say:  
'(', '{', '[' are called "openers."  
')', '}', ']' are called "closers."  

Write an efficient function that tells us whether or not an input string's
openers and closers are properly nested.

Examples:  
"{ [ ] ( ) }" should return true  
"{ [ ( ] ) }" should return false  
"{ [ }" should return false  

This question was given by
[InterviewCake.com](https://www.interviewcake.com/question/bracket-validator)

#### Thoughts and Pseudo Code

##### Minitest
Testing is HARD! I found that MiniTest only mocks existing methods and you
can't stub on mock objects. Maybe this is good to help prevent you from
writing too much code that will get your tests green without actual code. The
problem I'm having is I can't drive out my code the way that I am used to.  
I decided to restart my tests now that I have some more knowledge about how
MiniTest works. I also skipped the pseudo code part so deleting code and
documenting my pseudo code is a good step.

##### Pseudo Code

Validator keeps track of openers?  
I care about openers. You know a closer is valid if its previous char is an 
opener.  
I want to call one method to do the work but I want to keep `command` and
`query` methods for an object.  

* Split up code string to chars in array
* Iterate through each item
* Find out if it's an opener or closer
  * If it's an opener put it into pair object and put it onto stack
  * If its a closer compare to first out pair object with opener -
    * If it's matching to closing pair = continue with check
    * If it does not match the opening pair = return false

