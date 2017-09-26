require 'active_model'
require 'active_support'
require 'active_support/core_ext'
require 'jwt'
require 'clipboard'
require 'pry'

module JwtMe
  class JwtMe
    REQUIRED_FIELDS = ['email', 'user_id']

    def self.run
      klass   = Input::Detector.interaction_klass(ARGV, REQUIRED_FIELDS)
      klass.process

      if klass.valid?
        payload = klass.to_hash
        token   = JWT.encode payload, nil, 'none'

        output_results(payload, token)

        Clipboard.copy token
      else
        klass.output_errors
      end
    end

    private 
    def self.output_results(payload, token)
      puts "---------------- Results ----------------"
      puts "Payload: "
      puts payload.to_s

      puts
      puts "JWT Token: "
      puts token

      puts
      puts "(Token value copied to clipboard)"
    end
  end
end

# Require all classes under lib/
Dir.glob('lib/**/*/') do |dir|
  Dir.glob("./#{dir}**/*.rb").each do |path|
    require path
  end
end