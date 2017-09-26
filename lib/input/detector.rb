module Input
  class Detector
    def self.interaction_klass(arguments, required_fields)
      # If we've specified additional arguments besides the
      #   program name, we'll assume the user is inputting
      #   key/value pairs directly from the command-line
      arguments.any? ? Cli.new(arguments, required_fields) : Interactive.new(required_fields)
    end
  end
end