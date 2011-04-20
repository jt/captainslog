require 'date'

module Captainslog
  class Runner
    attr_accessor :args, :start_day

    def initialize(*args)
      @args      = args.dup
      @start_day = day_back 7
      run(args)
    end

    def self.execute(*args)
      new(*args).execute
    end

    def execute
      days.each_with_index do |day, i|
        return if i == days.size - 1
        puts day_header_for day
        authors_for(day).each do |author|
          puts author
          print commits_for_author_on(author, day)
        end
        puts "\n"
      end
      exit($?.exitstatus || 0)
    end

    def run(args)
      @start_day = day_back args.shift.to_i if args.any?
    end

    private

    def authors_for(day)
      %x[ git log --no-merges --format=\"%an\" --since=#{day_before(day)} --until=#{day}
      ].split("\n").uniq
    end

    def commits_for_author_on(author, day)
      %x[ git log --no-merges --author=\"#{author}\" --format=\" - %s\" --since=#{day_before(day)} --until=#{day} ]
    end

    def days
      %x[ git log --no-merges --format="%cd" --date=short --since=#{start_day} | sort -u -r
      ].split("\n").push(start_day)
    end

    def day_back(count)
      (Date.today - count.to_i).strftime('%Y-%m-%d')
    end

    def day_before(day)
      (Date.parse(day) - 1).strftime('%Y-%m-%d')
    end

    def day_header_for(day)
      "#{day} (#{day_word_for(day)})"
    end

    def day_word_for(day)
      Date.parse(day).strftime('%A')
    end
  end
end
