# cliqr

[![Build](http://img.shields.io/travis-ci/anshulverma/cliqr.svg?style=flat-square)](https://travis-ci.org/anshulverma/cliqr)
[![Coverage](http://img.shields.io/codeclimate/coverage/github/anshulverma/cliqr.svg?style=flat-square)](https://codeclimate.com/github/anshulverma/cliqr)
[![Quality](http://img.shields.io/codeclimate/github/anshulverma/cliqr.svg?style=flat-square)](https://codeclimate.com/github/anshulverma/cliqr)
[![Dependencies](http://img.shields.io/gemnasium/anshulverma/cliqr.svg?style=flat-square)](https://gemnasium.com/anshulverma/cliqr)
[![Inline docs](http://inch-ci.org/github/anshulverma/cliqr.svg)](http://inch-ci.org/github/anshulverma/cliqr)

[![Version](http://img.shields.io/gem/v/cliqr.svg?style=flat-square)](https://rubygems.org/gems/cliqr)
[![Downloads](http://img.shields.io/gem/dt/cliqr.svg?style=flat-square)](https://rubygems.org/gems/cliqr)

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [cliqr](#cliqr)
    - [Summary](#summary)
    - [Examples](#examples)
        - [Simple CLI app example](#simple-cli-app-example)
    - [Installation](#installation)
    - [Building](#building)
    - [Contributing](#contributing)

<!-- markdown-toc end -->


## Summary

`cliqr` is a lightweight framework and DSL to easily build a command
line application. Features include:

- Command Routing
- DSL for simple interface definition
- Usage info generation
- Error handling

## Examples

The DSL provides several helper methods to build interfaces of different
styles. Here are some examples.

### Simple CLI app example

Here is a simple hello-world example for using Cliqr.

``` ruby
require 'cliqr'

# a custom command handler
class MyCommandHandler < Cliqr.command
  def execute
    puts 'executing my awesome command'
  end
end

cli = Cliqr.interface do
  basename 'my-command'
  description 'this is an awesome command...try it out'
  handler MyCommandHandler

  option 'an-option' do
    short 'a'
    description 'this is a option'
  end
end

puts cli.usage
#> my-command -- this is an awesome command...try it out
#>
#> USAGE:
#>     my-command
#>
#> Available options:
#>
#>     --an-option, -a  :  this is a option

cli.execute
#> executing my awesome command
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cliqr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cliqr

## Building

There are various metric with different thresholds settings that needed
to be satisfied for a successful build. Here is a list:

- `rubocop` to make sure the code style checks are maintained
- `yardstick` to measure document coverage
- `codeclimate` to make we ship quality code
- `coveralls` to measure code coverage
- `rdoc` to build and measure documentation

To run all of the above, simply run:

```bash
$ rake
```

## Contributing

1. Fork it ( https://github.com/anshulverma/cliqr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
