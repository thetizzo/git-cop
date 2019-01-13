# frozen_string_literal: true

require "spec_helper"

RSpec.describe Git::Cop::Validators::Email do
  subject(:email) { described_class.new text }

  let(:text) { "test@example.com" }

  describe "#valid?" do
    context "with valid email" do
      let(:text) { "test@example.com" }

      it "answers true" do
        expect(email.valid?).to eq(true)
      end
    end

    context "with minimum requirements" do
      let(:text) { "a@b.c" }

      it "answers true" do
        expect(email.valid?).to eq(true)
      end
    end

    context "with subdomain" do
      let(:text) { "test@sub.example.com" }

      it "answers true" do
        expect(email.valid?).to eq(true)
      end
    end

    context "with missing '@' symbol" do
      let(:text) { "example.com" }

      it "answers false" do
        expect(email.valid?).to eq(false)
      end
    end

    context "with missing domain" do
      let(:text) { "test@example" }

      it "answers false" do
        expect(email.valid?).to eq(false)
      end
    end
  end
end
