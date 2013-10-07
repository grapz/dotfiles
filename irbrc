# gem install awesome_print
# gem install hirb
require "awesome_print"
require "irb/completion"
require "rubygems"
require "wirble"
#require "hirb"
#
AwesomePrint.irb!
Wirble.init
Wirble.colorize
