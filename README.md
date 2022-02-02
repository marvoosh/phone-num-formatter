# 📞 Phone Number Formatter - UK 📞

### A module that takes an input of a UK phone number and returns it in one specific format of +447 followed by 9 digits. The module is able to handle invalid inputs.

## Using the module

The module call is `Formatter::PhoneNumber::UK.format('Your number here as string')`. For example `Formatter::PhoneNumber::UK.format('071234 56789')`.

The module will return the formatted phone number as a string.

The module will raise an error if:

- The number's prefix is not one of: +44, 44, 0.
- The number after the prefix is not 7.
- the amount of digits after the number 7 is not 9.
- Any other reason the number is not valid.

## Approaching the challenge

First thing I did is research.
I started with finding out more on how to use modules and raise errors.

Next I coded the actual format method trying to keep it simple and the code DRY.
I wrote the regex first to make sure it will match all possiblities given and added more of my own. After getting rid of any whitspaces I used a case control flow to impliment the format requested.

After that I implimented the errors classes, starting with the most general error (e.g. InvalidPhoneNumber) and working down to the more specific error cases (e.g. InvalidPrefix).
The errors are raised in that order so only if it is not cought by the more spesific case it will then be cought by the less specific one.

InvalidPrefix > InvalidNumberLength(including number 7 after prefix) > InvalidPhoneNumber.

Finally I attempted writing some tests for the project.
I don't have much experience in test writing, yet I wanted to give a go and I am looking forward to learning more on the matter.

## Tech-stack

For this project I have used:

- Ruby
- Regex
- Rspec
