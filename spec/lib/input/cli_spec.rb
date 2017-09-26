require "spec_helper"

RSpec.describe Input::Cli do
  let(:target) {{"email" => nil, "user_id" => nil}}
  let(:required_fields) {["email", "user_id"]}
  let(:arguments) {[]}
  let(:subject) {Input::Cli.new(arguments, required_fields)}

  before do
    subject.process
  end

  describe ".to_hash" do
    it "creates a hash with the required fields" do
      expect(subject.to_hash).to eq(target)
    end
  end

  describe ".items" do
    let(:target) {[Models::KeyValue::Email,
                   Models::KeyValue::UserId]}
    it "creates a collection of input model instances based on input" do
      expect(subject.items.collect(&:class)).to eq(target)
    end
  end

  # Generating error messages relies upon the requirement that the items collection
  # has been generated from those string values.
  # Because of this requirement, we exercise the base class method contextually
  # through the dervied Input::Cli class.
  describe ".error_messages" do
    describe "email" do
      let(:arguments) {["email=jim-example.com", "user_id=userid123"]}

      it "outputs error if email is missing @ sign" do
        expect(subject.invalid?).to be true
        expect(subject.send(:error_messages)).to include('Invalid email format.')
      end
    end

    describe "user id" do
      let(:arguments) {["email=jim@example.com"]}

      it "outputs error if user id is blank" do
        expect(subject.invalid?).to be true
        expect(subject.send(:error_messages)).to include("User ID can't be blank.")
      end
    end
  end
end