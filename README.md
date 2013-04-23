# ViewGenerator

Generates views for existing ActiveRecord model passed as argument.
No need to specify model attributes, it will pick them up from attr_accessible

## Installation

Add this line to your application's Gemfile:

    gem 'view_generator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install view_generator

## Usage

Example:

    rails generate view Thing

This will create:
* 4 CRUD views for Thing model, based on Thing accessible attributes and on default template engine

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
