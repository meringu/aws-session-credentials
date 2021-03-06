module Aws
  module Session
    module Credentials
      # Holds credentials that are read by AWS SDKs
      class CredentialFile
        include FileProvider::IniFileProvider
        include ProfileStorage

        attr_reader :path

        def initialize(options = {})
          @path = File.expand_path(options[:path] || default_path)
        end

        def default_path
          File.join(%w(~ .aws credentials))
        end

        # @return [Hash<String,Hash>]
        def profiles_hash
          read.to_h
        end

        # @param [Hash<String,Hash>] prfs
        def profiles_hash=(hsh)
          hsh.each { |key, value| self[key] = value }
        end
      end
    end
  end
end
