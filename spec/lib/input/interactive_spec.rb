require "spec_helper"

RSpec.describe Input::Interactive do
  let(:subject) {Input::Interactive.new(required_fields)}

  let(:input) {["jim@example.com\n", "userid123\n", "xyz", "123", "\r\n"]}

  let(:target) {{"email"   => "jim@example.com",
                 "user_id" => "userid123",
                 "xyz"     => "123"}}

  let(:required_fields) {["email", "user_id"]}

  let(:arguments) {[]}

  before do
    # Stub puts to disable interactive output for test
    allow(STDOUT).to receive(:puts).and_return(nil)
    allow(STDIN).to receive(:gets).and_return(*input)
    
    subject.process
  end

  describe ".to_hash" do
    it "creates a hash with the required fields" do
      expect(subject.to_hash).to eq(target)
    end
  end

  describe ".items" do
    let(:target) {[Models::KeyValue::Email,
                   Models::KeyValue::UserId,
                   Models::KeyValue::Base]}
    it "creates a collection of input model instances based on input" do
      expect(subject.items.collect(&:class)).to eq(target)
    end
  end
end