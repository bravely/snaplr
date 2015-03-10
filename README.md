Snaplr
======

## Requirements

* Ruby 2.2.0
* Imagemagick 6.9.0-10
* PostgreSQL 9.3

I genuinely am unsure about Imagemagick versioning for Paperclip, but I'd like to think it works fairly far back, so if you have it installed, you should be alright.

If not, and you installed it via Homebrew in the past, you can upgrade with a simple:
```
brew update
brew upgrade imagemagick
```

You can similarly do the same with PostgreSQL.

Unneeded note: Traditionally I use rbenv instead of RVM, just so I have a more 'bare' Ruby experience that has less opportunity of having differences from my server.


## Installation

1. Git clone this down.

2. `bundle install`


## Usage

My workflow is TDD by default. Sometimes I'll mess up and forget in my haste, but the vast majority of the time, I think of my end-result API first, so that future development, whether as new features or maintenance, is as simple and easy as possible.

This is a longwinded way of saying, lets run tests first. And as much as a simple `rspec` is nice, it's neither convenient or tests for other things important to software development, such as security, readability, or for putting a command into our terminal taking up too much time. So instead, simply:

`bundle exec guard`

And you'll get your tests, rubocop linting, and brakeman security checks.

**But to see the actual end-result of the app**, feel free to do the usual:

`rails s`

## Additional Notes


