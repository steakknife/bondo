# Usage
#
#    require 'bondo'
#
#    class Bar
#      def start
#      end
#    end
#
#    class Baz
#      def eject
#      end
#    end
#
#    class Foo < SomeClass
#      include Bondo
#
#      def initialize
#        bondo_add Bar.new
#        bondo_add Baz.new
#      end
#    end
#
#    f = Foo.new
#    f.stop
#    f.eject
#
module Bondo
  def bondo_children
    @bondo_children ||= []
  end 

  def bondo_add(*children)
    children.each { |child| bondo_children.unshift child } unless bondo_has_all?(*children)
  end

  def bondo_has_all?(*children)
    children.all? { |child| bondo_has? child }
  end

  def bondo_has?(child)
    bondo_children.include? child
  end

  def bondo_remove(child)
    bondo_children.delete child if bondo_has? child
  end

  def respond_to_missing?(symbol_or_string, include_all)
    bondo_children.map { |x| x.respond_to? symbol_or_string, include_all }.any? || super
  end

  def method_missing(symbol_or_string, *args, &block)
    if respond_to_missing?(symbol_or_string, false)
      bondo_children.map { |x|
        return x.send(symbol_or_string, *args, &block) if x.respond_to? symbol_or_string
      }
    end
    super
  end
end
