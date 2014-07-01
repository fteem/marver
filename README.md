Marver
======

![TravisCI](https://travis-ci.org/fteem/marver.svg?branch=master)

Marver is an easy to use Ruby gem for [Marvel's API](http://developer.marvel.com/).
It is still very much work in progress. Has lots of rough edges that you might cut yourself on. You've been warned.

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
client.characters.find({ name: 'Hulk' })
client.series.find({ title: 'The Avengers' })
client.events.find({ title: 'Fall of the mutants' })
client.stories.find({ title: 'Name of a story' }) 
client.comics.find({ title: 'Spiderman' }) 
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
comic = hulk.comics.first  # Take first comic where Hulk appears.
comic.full # This will issue an API call and grab the full object with all data for that comic.
```

### TO DO:

##### Entity Finder classes
Should be implemented within the Marver::Client class.

CreatorFinder

#### Author
Ile Eftimov <br/>
[twitter](http://twitter.com/fteem)  [website](http://eftimov.net)

Any kind of contribution is welcomed & encouraged :)