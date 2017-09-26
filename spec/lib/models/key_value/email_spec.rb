require "spec_helper"

RSpec.describe Models::KeyValue::Email do
  let(:key) {"email"}
  let(:value) {"jim@example.com"}
  let(:subject) {Models::KeyValue::Email.new(key, value)}

  describe "validations" do
    before do
      subject.validate
    end

    describe "email format" do
      context "invalid" do
        let(:value) {"jim-example.com"}

        it "generates an error" do
          expect(subject.errors.any?).to be true
        end
      end

      context "valid" do
        let(:value) {"jim@example.com"}

        it "does not generate an error" do
          expect(subject.errors.any?).to be false
        end
      end
    end

    describe "email presence"  do
      context "invalid" do
        let(:value) {nil}

        it "generates an error" do
          expect(subject.errors.any?).to be true
        end
      end

      context "valid" do
        let(:value) {"jim@example.com"}

        it "does not generate an error" do
          expect(subject.errors.any?).to be false
        end
      end
    end
  end
end
