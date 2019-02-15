# frozen_string_literal: true

require "reline"

unless STDOUT.tty? && STDIN.tty?
  Reline.send(:remove_const, "IOGate")
  Reline.const_set("IOGate", Reline::GeneralIO)
  Reline.send(:core).config.instance_variable_set(:@test_mode, true)
  Reline.send(:core).config.reset
  Reline.input = $stdin
end
