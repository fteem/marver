Marver
======

![TravisCI](https://travis-ci.org/fteem/marver.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/fteem/marver.png)](https://codeclimate.com/github/fteem/marver)

Marver is an easy to use Ruby gem for [Marvel's API](http://developer.marvel.com/). 
It contains wrappers around the API entities and provides a very easy interface to communicate 
with the API. You can take a look at the usage examples below on how to use it.

Note: I would recommend waiting for v1.0 before using the gem in production environment.

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
client.characters.find_by_name 'Hulk'
client.series.find_by_title 'The Avengers'
client.events.find_by_title 'Fall of the mutants'
client.stories.find_by_title 'Name of a story'
client.comics.find_by_title 'Spiderman'
```

You can read more about using this gem in the [wiki](https://github.com/fteem/marver/wiki).

### Still on the TO DO list:
- Summary collections pagination.
  - Example: For a Comic that more than 20 Event summary objects (default amount fetched) the user should be able to step through them.
- Error handling.
- Inspect dependency graph?
  - https://github.com/dcadenas/rubydeps

#### Author
Ile Eftimov <br/>
[twitter](http://twitter.com/fteem)  [website](http://eftimov.net)
