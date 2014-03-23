Marver
======

Marver is (going to be an) easy to use Ruby gem for [Marvel's API](http://developer.marvel.com/).
It is **still VERY MUCH in development** and it doesn't really do much right now. Also, any kind of contribution is **welcomed**.

## Installation

Add this line to your application's Gemfile:

    gem 'marver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marver

## Usage

```ruby
marver = Marver::Client.new('your_private_api_key', 'your_public_api_key')
marver.characters.find  # fetches 20 characters
```


### TO DO:

##### Entity Finder classes
Should be implemented within the Marver::Client class.

* CharacterFinder (in progress)
* SerieFinder
* StoryFinder
* ComicFinder
* EventFinder
* More?


##### Entity Builders
Maybe too much metaprogramming...


#### Author
Ile Eftimov <br/>
[twitter](http://twitter.com/fteem)  [website](http://eftimov.net)
