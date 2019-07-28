# frozen_string_literal: true

require "spec_helper"
require "git/cop/rake/tasks"

RSpec.describe Git::Cop::Rake::Tasks do
  subject(:tasks) { described_class.new cli: cli }

  let(:cli) { class_spy Git::Cop::CLI }

  before { Rake::Task.clear }

  describe ".setup" do
    it "installs rake tasks" do
      described_class.setup
      expect(Rake::Task.tasks.map(&:name)).to contain_exactly("git_cop")
    end
  end

  describe "#install" do
    before { tasks.install }

    it "executes --police option via git_cop task" do
      Rake::Task["git_cop"].invoke
      expect(cli).to have_received(:start).with(["--police"])
    end
  end
end
