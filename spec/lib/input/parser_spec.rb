require "spec_helper"

RSpec.describe Input::Parser do
  let(:subject) {Input::Parser.new(input)}
  let(:klass) {Input::Parser}

  let(:input) {["email=jim@example.com", "user_id=userid123", "xyz=123"]}
  
  describe ".parse" do
    let(:target) {[Models::KeyValue::Email,
                   Models::KeyValue::UserId,
                   Models::KeyValue::Base]}
    it "creates a collection of input model instances based on input" do
      expect(subject.parse.collect(&:class)).to eq(target)
    end
  end

  describe ".parse_item" do

    it "returns the appropriate key value class for key/value string" do
      expect(klass.parse_item("email=jim@example.com")).to be_kind_of(Models::KeyValue::Email)
      expect(klass.parse_item("user_id=123")).to be_kind_of(Models::KeyValue::UserId)
      expect(klass.parse_item("xyz=123")).to be_kind_of(Models::KeyValue::Base)
    end
  end
end