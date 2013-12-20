module Selenium
  module Phantomjs
    class Instance
      PHANTOMJS_BIN = %x{which phantomjs}.strip.freeze

      attr_reader :pid_file

      def initialize(pid_file)
        raise "Please install phantomjs first and make sure that phantomjs is in your PATH" if PHANTOMJS_BIN == ''
        
        pid_dir = File.dirname(pid_file)
        FileUtils.mkpath(pid_dir) unless File.directory? pid_dir

        @pid_file = pid_file
      end

      def run(args, options = {})
        die!

        arguments = if args.is_a? Hash
          args.map do |k, v| 
            if v
              %Q{--#{k}=#{v}}
            else
              "--#{k}"
            end
          end
        else
          Array(args)
        end

        raise ArgumentError.new("PhantomJS: interactive shell is not supported.") if arguments.empty?

        command = [PHANTOMJS_BIN] + arguments
        @pid = Process.spawn(*command, options)
        Process.detach(@pid)

        sleep 1
        raise "PhantomJS: failed to start" unless alive?
        File.open(pid_file, 'w') { |f| f.write @pid }

        @pid
      end

      def alive?
        !! pid && begin
          !! Process.kill(0, pid)
        rescue Errno::ESRCH, RangeError
          false
        end
      end

      def die!
        Process.kill('TERM', pid) if alive?
        File.delete(pid_file) if File.exists? pid_file
        @pid = nil
      end

      def pid
        @pid ||= if File.exists? pid_file
          File.open(pid_file, 'r') do |f|
            begin
              f.readline.to_s.strip.to_i
            rescue EOFError
              nil
            end
          end
        end
      end
    end
  end
end
