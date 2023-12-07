# frozen_string_literal: true

# author: Harry Lee

module RuboCop
  module Cop
    module Style
      # This cop checks for uses of `raise e`.
      # @example
      # case e
      # when condition
      #   statement
      # else
      #   raise e
      # end
      class RaiseException < Cop
        MSG = 'Raise strings or constants, not variables.'

        ALLOWED_TYPES = %i[const str]

        def on_send(node)
          return unless node.command?(:raise)

          # args will contain the type of arguments ex) (send nil :e)
          _receiver, _selector, args = *node

          add_offense(node, :expression, MSG) unless ALLOWED_TYPES.include?(args.type)
        end
      end
    end
  end
end
