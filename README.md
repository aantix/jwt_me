# JWT Me - Jim Jones (jim.jones1@gmail.com)

## Generate a JWT token Via the Command-line

### Video Demonstration

A video demonstration of this program can be found here : 

https://youtu.be/5rhk86SZug4
 
### Installation

From the command-line:

```
git clone https://github.com/aantix/jwt_me.git
```

And then execute:

```
$ cd jwt_me
$ bin/jwt_me
```

## Modes

There are two modes for which to interact with `jwt_me`.

### Interactive Mode

If you execute the command `jwt_me` without any additional command-line key-value pairs, 
the system will interactively prompt you for the appropriate keys and value pairs.  
Email and User IDs are required.  Addional key/value pairs can be defined therafter.
   
```
➜  jwt_me git:(master) ✗ bin/jwt_me
Enter 'email' value:
jim@example.com

Enter 'user_id' value:
userid123

Enter key 1:
(press enter to complete)
location

Enter 'location' value:
San Francisco, CA

Enter key 2:
(press enter to complete)

---------------- Results ----------------
Payload:
{"email"=>"jim@example.com", "user_id"=>"userid123", "location"=>"San Francisco, CA"}

JWT Token:
eyJhbGciOiJub25lIn0.eyJlbWFpbCI6ImppbUBleGFtcGxlLmNvbSIsInVzZXJfaWQiOiJ1c2VyaWQxMjMiLCJsb2NhdGlvbiI6IlNhbiBGcmFuY2lzY28sIENBIn0.

(Token value copied to clipboard)
```

### Command-line Mode

Alternatively, you can define the key-value pairs directly from the command line. 

```
➜  jwt_me git:(master) ✗ jwt_me email=jim@example.com user_id=userid123 location="San Francisco, CA"
---------------- Results ----------------
Payload:
{"email"=>"jim@example.com", "user_id"=>"userid123", "location"=>"San Francisco, CA"}

JWT Token:
eyJhbGciOiJub25lIn0.eyJlbWFpbCI6ImppbUBleGFtcGxlLmNvbSIsInVzZXJfaWQiOiJ1c2VyaWQxMjMiLCJsb2NhdGlvbiI6IlNhbiBGcmFuY2lzY28sIENBIn0.

(Token value copied to clipboard)
```

## Tests

To run the tests, from the project directory, enter the command `rake`

```
➜  jwt_me git:(master) rake
/Users/aantix/.rvm/rubies/ruby-2.4.0/bin/ruby -I/Users/aantix/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.6.0/lib:/Users/aantix/.rvm/gems/ruby-2.4.0/gems/rspec-support-3.6.0/lib /Users/aantix/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.6.0/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb

Input::Cli
  .to_hash
    creates a hash with the required fields
  .items
    creates a collection of input model instances based on input
  .error_messages
    email
      outputs error if email is missing @ sign
    user id
      outputs error if user id is blank

Input::Detector
  #interaction_klass
    selects the Input::Interactive class if 0 command-line params are specified
    selects the Input::Cli class if command-line params are specified

Input::Interactive
  .to_hash
    creates a hash with the required fields
  .items
    creates a collection of input model instances based on input

Input::Parser
  .parse
    creates a collection of input model instances based on input
  .parse_item
    returns the appropriate key value class for key/value string

Models::KeyValue::Email
  validations
    email format
      invalid
        generates an error
      valid
        does not generate an error
    email presence
      invalid
        generates an error
      valid
        does not generate an error

Models::KeyValue::UserId
  validations
    user_id presence
      invalid
        generates an error
      valid
        does not generate an error

Finished in 0.06242 seconds (files took 0.49099 seconds to load)
16 examples, 0 failures
```