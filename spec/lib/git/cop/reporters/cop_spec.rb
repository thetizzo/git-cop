# frozen_string_literal: true

require "spec_helper"

RSpec.describe Git::Cop::Reporters::Cop do
  subject(:cop_reporter) { described_class.new cop_instance }

  let(:severity) { :error }
  let(:cop_class) { class_spy Git::Cop::Styles::CommitAuthorEmail, label: "Commit Author Email" }

  let :cop_instance do
    instance_spy Git::Cop::Styles::CommitAuthorEmail,
                 class: cop_class,
                 severity: severity,
                 issue: issue
  end

  describe "#to_s" do
    context "with warning" do
      let(:severity) { :warn }
      let(:issue) { {hint: "A test hint."} }

      it "answers cop label and issue hint" do
        expect(cop_reporter.to_s).to eq(
          "\e[33m  Commit Author Email Warning. A test hint.\n\e[0m"
        )
      end
    end

    context "with error" do
      let(:severity) { :error }
      let(:issue) { {hint: "A test hint."} }

      it "answers cop label and issue hint" do
        expect(cop_reporter.to_s).to eq(
          "\e[31m  Commit Author Email Error. A test hint.\n\e[0m"
        )
      end
    end

    context "with unknown severity" do
      let(:severity) { :bogus }
      let(:issue) { {hint: "A test hint."} }

      it "answers cop label and issue hint" do
        expect(cop_reporter.to_s).to eq(
          "\e[37m  Commit Author Email. A test hint.\n\e[0m"
        )
      end
    end

    context "with issue lines" do
      let :issue do
        {
          hint: "A test hint.",
          lines: [
            {number: 1, content: "Curabitur eleifend wisi iaculis ipsum."},
            {number: 3, content: "Ipsum eleifend wisi iaculis curabitur."}
          ]
        }
      end

      it "answers cop label, issue label, issue hint, and issue lines" do
        expect(cop_reporter.to_s).to eq(
          "\e[31m  Commit Author Email Error. A test hint.\n" \
          "    Line 1: \"Curabitur eleifend wisi iaculis ipsum.\"\n" \
          "    Line 3: \"Ipsum eleifend wisi iaculis curabitur.\"\n\e[0m" \
        )
      end
    end
  end
end
