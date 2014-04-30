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
Marver.configure do |config|
  config.public_key = 'your_public_key'
  config.private_key = 'your_private_key'
end

client = Marver::Client.new
client.characters.find({ name: 'Hulk' }) # Returns Hulk
client.serie.find({ name: 'The Avengers' }) # Returns The Avengers
```


### TO DO:

#### Summaries can fetch full view objects
* CreatorSummary
* EventSummary
* SerieSummary
* StorySummary

##### Entity Finder classes
Should be implemented within the Marver::Client class.

* CharacterFinder (in progress)
* SerieFinder
* StoryFinder
* ComicFinder
* EventFinder
* More?

#### Author
Ile Eftimov <br/>
[twitter](http://twitter.com/fteem)  [website](http://eftimov.net)
