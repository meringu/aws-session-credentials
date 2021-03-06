module Aws
  module Session
    module Credentials
      # Holds configuration
      class Config
        include ProfileStorage
        include RoleStorage
        include FileProvider::YamlFileProvider

        attr_reader :path

        def initialize(options = {})
          @path = File.expand_path(options[:path] || default_path)
        end

        def default_path
          File.join(%w(~ .aws aws-session-config.yml))
        end

        # @return [Hash<String,Hash>]
        def profiles_hash
          self[:profiles] || {}
        end

        # @param [Hash] hsh
        def profiles_hash=(hsh)
          self[:profiles] = hsh
        end

        # @return [Hash<String,Hash>]
        def roles_hash
          self[:roles] || {}
        end

        # @param [Hash] hsh
        def roles_hash=(hsh)
          self[:roles] = hsh
        end
      end
    end
  end
end
