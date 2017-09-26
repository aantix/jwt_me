require "spec_helper"

RSpec.describe Input::Detector do
  let(:subject) {Input::Detector}
  let(:required_fields) {["email", "user_id"]}
  let(:arguments) {["email=jim.jones1@gmail.com", "user_id=123"]}
  let(:interactive_target) {Input::Interactive}
  let(:cli_target) {Input::Cli}

  describe "#interaction_klass" do
    it "selects the Input::Interactive class if 0 command-line params are specified " do
      expect(subject.interaction_klass([], required_fields)).to be_kind_of(interactive_target)
    end

    it "selects the Input::Cli class if command-line params are specified " do
      expect(subject.interaction_klass(arguments, required_fields)).to be_kind_of(cli_target)
    end
  end
end