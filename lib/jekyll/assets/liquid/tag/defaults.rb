# Frozen-string-literal: true
# Copyright: 2012 - 2017 - MIT License
# Encoding: utf-8

module Jekyll
  module Assets
    module Liquid
      class Tag
        module Defaults
          require_relative "defaults/image"
          require_relative "defaults/sha"

          # --
          # TODO: In 3.0 env needs to be enforced, right now it's not
          #   because it's maintain 2.0 API.
          # --
          module_function
          def set_defaults_for!(tag, args, asset, env = nil)
            constants.select { |o| const_get(o).for?(tag) }.each do |v|
              const_get(v).new(args, asset, env).set!
            end
          end
        end
      end
    end
  end
end
