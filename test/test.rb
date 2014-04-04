#!/usr/bin/env ruby
$: << 'lib'
require 'bondo'

class Foo
  def f
    $f = 1
  end

  def x
    fail 'Foo.x should NOT have been called'
  end
end

class Bar
  def g
    $g = 1
  end

  def x
    $x = true
  end
end

class Composite
  include Bondo

  def initialize
    bondo_add Foo.new
    bondo_add Bar.new
  end
end

x = Composite.new

# test 0
x.f
fail 'f failed' unless $f

# test 1
x.g
fail 'g failed' unless $g

# test 2
begin
  x.h
rescue NoMethodError
else
  fail 'h should not work'
end

# test 3
x.x
fail 'Bar.x should have been called' unless $x

$stderr.puts 'ok'
