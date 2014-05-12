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

Also, you can inspect summary (trimmed) objects of the associated entities to one entity.

```ruby
Marver.configure do |config|
  config.public_key = 'your_public_key'
  config.private_key = 'your_private_key'
end

client = Marver::Client.new
hulk = client.characters.find({ name: 'Hulk' })
hulk.comics  # Returns an array of comics summaries
hulk.stories # Returns an array of stories where Hulk appears
```

A summary object can also morph into a "full view" object.

```ruby
comic = hulk.comics.first  # Take first comic where Hulk appears
comic.full # This will issue an API call and grab the full object with all data for that comic
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

#### Author
Ile Eftimov <br/>
[twitter](http://twitter.com/fteem)  [website](http://eftimov.net)
