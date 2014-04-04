[![Build Status](https://travis-ci.org/steakknife/bondo.svg)](https://travis-ci.org/steakknife/bondo)

# Bondo

### Deterministic Ruby multi-object "inheritance" (composition) spackle

## Advantages

- Dries in minutes
- Easy cleanup
- Add & remove instance methods of an individual object instance... on-the-fly

## Installation

    gem cert --add <(curl -L https://raw.githubusercontent.com/steakknife/bondo/master/gem-public_cert.pem)
    gem install bondo -P HighSecurity

## Notes

### Conflict-resolution behavior

#### Default

Last added bondo child object wins (gets called)

#### Custom

      # call all, first added order
      def foo
        bondo_children.reverse.map { |x| x.foo(*args, &block) }
      end

      # call all, last added order
      def foo(*args, &block)
        bondo_children.map { |x| x.foo(*args, &block) }
      end

      # call child 0 and child 3
      def foo(*args, &block)
        [ bondo_children[0].foo(*args, &block),
          bondo_children[3].foo(*args, &block)  ]
      end

## Usage

    require 'bondo'

    class Bar
      def start
      end
    end

    class Baz
      def eject
      end
    end

    class Foo < SomeClass
      include Bondo

      def initialize
        bondo_add Bar.new
        bondo_add Baz.new
      end
    end

    f = Foo.new
    f.stop
    f.eject

## License

MIT

## Copyright

Copyright 2014 Barry Allard

