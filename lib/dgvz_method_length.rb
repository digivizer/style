# frozen_string_literal: true

module RuboCop
  module Cop
    module Metrics
      # This cop checks if the length a method exceeds some maximum value.
      # Comment lines can optionally be ignored.
      # The maximum allowed length is configurable.
      class DGVZMethodLength < Cop
        include OnMethodDef
        include CodeLength

        private

        def on_method_def(node, _method_name, _args, _body)
          check_code_length(node)
        end

        def message(length, max_length)
          format('Method has far too many lines. [%<length>d/%<max_length>d]', :length => length, :max_length => max_length)
        end

        def code_length(node)
          lines = node.source.lines.to_a[1..-2] || []

          lines.count { |line| !dgvz_irrelevant_line(line) }
        end

        def blacklist
          cop_config['Blacklist']
        end

        def logger_line?(source_line)
          blacklist.find { |o| source_line.include?(o) }
        end

        def dgvz_irrelevant_line(source_line)
          source_line.blank? || (!count_comments? && comment_line?(source_line)) || logger_line?(source_line)
        end
      end
    end
  end
end
