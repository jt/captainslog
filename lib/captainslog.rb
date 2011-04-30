require 'date'

module Captainslog
  extend self

  def history
    @history ||= 6
  end

  def today
    @today ||= Date.today
  end

  def tomorrow
    @tomorrow ||= today + 1
  end

  def run(*args)
    @history = (args.shift.to_i - 1) if args.any?
    execute
  end

  def execute
    print "Captain's Log, Stardate #{today - history} to today...\n\n"
    tomorrow.step(tomorrow - history, -1) do |day|
      log = log_for day
      puts header_for(day - 1)
      puts log.empty? ? '*no commits' : log
      puts "\n"
    end
    exit($?.exitstatus)
  end

  private

  def header_for(day)
    "#{day} (#{day.strftime('%A')})"
  end

  def log_for(day)
    %x[ git shortlog --since=\"#{(day - 1).to_time}\" --until=\"#{day}\" --no-merges --format=\"- %s\" -w\"80,0\" ].split("\n").reject{|s| s.empty?}.join("\n")
  end
end
