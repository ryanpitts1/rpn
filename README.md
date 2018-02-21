RPN [![Build Status](https://travis-ci.org/ryanpitts1/rpn.svg?branch=master)](https://travis-ci.org/ryanpitts1/rpn)
==================

An interactive [Reverse Polish notation] (RPN) calculator written in Ruby. This gem can be run from the command-line or from within your application.

[Reverse Polish notation]: https://en.wikipedia.org/wiki/Reverse_Polish_notation

# Installation

This gem is not currently hosted on RubyGems.org because of a gem naming conflict. You can install this gem using the Github repo location.

```
gem 'rpn', :git => 'git://github.com/ryanpitts1/rpn.git'
```

# Usage

### Via Command-Line

The RPN calculator can be used via the command-line or via Ruby code.

The RPN gem also comes with an executable that is automatically installed. You can run the executable using the `rpn` command in your terminal, for example:

```bash
$ rpn 5 5 +
```

Note, if you use multiplication via the command line it should be escaped
unless the arguments are wrapped in quotes. Both of the following will work:

```bash
$ rpn 3 3 \*
```

```bash
$ rpn "3 3 *"
```

If you enter `rpn` without any arguments you will drop into the [REPL] where you can compute in real time.

[REPL]: https://en.wikipedia.org/wiki/Read–eval–print_loop

```bash
$ rpn
> 3 2 +
5.0
> 6 -
-1.0
> 13 *
-13.0
> -1 /
13.0
> q
$
```

### Via Ruby

The second way to use `rpn` is via Ruby itself. Once you have the gem installed you can require the `rpn` gem and use it via your own code:

```ruby
require 'rpn'

puts Rpn::Calculator.compute('3 2 +')
```

You can also specify the operators via a configurable `operators` variable.

```ruby
require 'rpn'

Rpn.configure do |config|
  config.operators = {
    '+' => :+,
    '-' => :-,
    '*' => :*,
    '/' => :/
  }
end
```

### Supported Commands

- Values: integers (`2`), decimals (`2.5`), and negative numbers (`-2.5`).
- Default Operators: addition (`+`), subtraction (`-`), multiplication (`*`), and
  division (`/`).
- Exiting: `q` or `CTRL-D` return to the shell.

# Architectural Decisions

The RPN gem was kept pretty simple and straight-forward. Although, it also is flexible enough to let the user use the calculator in a variety of ways. The decision was made in this gem to allow the user to interact with the gem from the command-line as well as from within the codebase of an application.

The one architectural decision that was made to help with future design needs was to abstract the operators into a configurable variable. This allows the user to use an basic mathmatical operators of their choosing.  One example that could easily be added is calculating percentage by adding the `%` operator.

The gem comes with a suite of tests that test functionality of the classes themselves as well as the expected funstionality of the command-line use.

# Future Considerations

One thing that could be added in future iterations of this gem is the ability to handle unary operators such as `sqrt`. I would also like to support scientific notation operands such as `0.6e6`.

# Development

To get a working development environment ready for making changes to `rpn` you can clone this repository and do the following:

1. `bundle install` to install all required gems
1. `rspec spec` to run the test suite
1. `rubocop` to run the Ruby linter

You can execute the development binary (./bin/rpn) but you must load the `lib`
folder. You can do so like:

```bash
$ ruby -Ilib ./bin/rpn
```

You can also open an IRB instance with the development library available as
well:

```bash
$ irb -Ilib -rrpn
```

# License

See the [LICENSE](./LICENSE.txt) file.
