require "spec_helper"

RSpec.describe Models::KeyValue::UserId do
  let(:key) {"user_id"}
  let(:subject) {Models::KeyValue::UserId.new(key, value)}

  describe "validations" do
    before do
      subject.validate
    end

    describe "user_id presence"  do
      context "invalid" do
        let(:value) {nil}

        it "generates an error" do
          expect(subject.errors.any?).to be true
        end
      end

      context "valid" do
        let(:value) {"123"}

        it "does not generate an error" do
          expect(subject.errors.any?).to be false
        end
      end
    end
  end
end
