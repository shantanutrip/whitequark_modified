=begin
module Parser
  module AST

    ##
    # {Parser::AST::Node} contains information about a single AST node and its
    # child nodes. It extends the basic [AST::Node](http://rdoc.info/gems/ast/AST/Node)
    # class provided by gem [ast](http://rdoc.info/gems/ast).
    #
    # @api public
    #
    # @!attribute [r] location
    #  Source map for this Node.
    #  @return [Parser::Source::Map]
    #
    class Node2 < ::AST::Node
      attr_reader :location, :tag

      alias loc location

      def initialize(tag_label, type, children, properties)
        super(type, children, properties)
        set_tag(tag_label)
        #@type, @children = type.to_sym, children.to_a.freeze
        #assign_properties(properties)
        #@hash = [@type, @children, self.class].hash
        freeze
      end

      ##
      # Assigns various properties to this AST node. Currently only the
      # location can be set.
      #
      # @param [Hash] properties
      # @option properties [Parser::Source::Map] :location Location information
      #  of the node.
      #
      def assign_properties(properties)
        if (location = properties[:location])
          location = location.dup if location.frozen?
          location.node = self
          @location = location
        end
      end

      def set_tag(tag_label)
        @tag = tag_label
      end
    end

  end
end
