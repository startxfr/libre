#! /usr/bin/env ruby

require 'optparse'
require 'ostruct'
require 'fileutils'
require 'singleton'

class Args
  include Singleton

  # Default values
  def initialize()
    @list = OpenStruct.new
    @list.watermark = true
    @list.watermark_name = ""
    @list.watermark_email = ""
    @list.session_id = ""
    @list.source_dir = "/usr/share/libre/course/sources"
    @list.output = "/usr/share/libre/course/book/book.pdf"
    @list.verbose = false

    @opt_parser = init_parser
  end

  def list
    @list
  end

  def usage
    @opt_parser
  end

  # Return a structure describing the options.
  def parse(args)
    @opt_parser.parse!(args)

    # Raise an error for mandatory options and exit
    if @list.watermark
      abort("Watermark need a name") if @list.watermark_name.empty?
      abort("Watermark need an email address") if @list.watermark_email.empty?
      abort("Watermark need a session ID") if @list.session_id.empty?
    end
    list
  end  # parse()

  private

  def init_parser
    OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options]"

      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-d", "--directory DIRECTORY", "Source directory") do |d|
        @list.source_dir = d
      end

      opts.on("-m", "--watermark-email EMAIL", "Watermark email (mandatory with the watermark)") do |m|
        @list.watermark_email = m
      end

      opts.on("-n", "--watermark-name NAME", "Watermark name (mandatory with the watermark)") do |n|
        @list.watermark_name = n
      end

      opts.on("-o", "--output FILE", "Output file") do |d|
        @list.output = d
      end

      opts.on("-s", "--session-id ID", "Session ID (mandatory with the watermark)") do |id|
        @list.session_id = id
      end

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        @list.verbose = v
      end

      opts.on("-w", "--[no-]watermark", "Add a watermark") do |w|
        @list.watermark = w
      end

      opts.separator ""
      opts.separator "Common options:"

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end
  end

end  # class Args

@options = Args.instance.parse(ARGV)

def watermark_bakground(name, email)
  return # Not used for now
  "<g transform='rotate(-45)' x='0' y='0'>
    <g class='watermark-names'>
      #{watermark_text(name, offset: 1.5)}
    </g>
    <g class='watermark-emails'>
      #{watermark_text(email)}
    </g>
  </g>"
end

def watermark(id, name, email)
  "<g class='watermark'>
    <text x='-29.7cm' y='1cm' transform='rotate(-90)'> &#169; STARTX - #{id} - #{name} - #{email} - Do not distribute</text>
    #{watermark_bakground(name, email)}
    <rect x='0' y='0' width='100%' height='100%' opacity='0'/>
  </g>"
end

def watermark_text(text, step: 3, offset: 0)
  column = ""
  15.times do |i|
    column += "<text y='#{i * step + offset}cm' x='-24cm'> #{"#{text}     "*10} </text>"
  end
  column
end

def add_watermark
  return unless @options.watermark
  puts "Generating Watermarked SVG" if @options.verbose

  content = File.read("#{@options.source_dir}/images/template/bg-page.svg")

  File.open("#{@options.source_dir}/images/template/bg-page.svg", "w") do |file|
    file.puts content.gsub("<!--:[watermark]:-->", watermark(@options.session_id, @options.watermark_name, @options.watermark_email))
  end
end

FileUtils.cp("#{@options.source_dir}/images/template/background.svg", "#{@options.source_dir}/images/template/bg-page.svg")
add_watermark()

puts "Processing PDF generation (could take several minutes)" if @options.verbose
if system("asciidoctor #{@options.verbose ? '--trace' : ''} -r asciidoctor-pdf -a pdf-stylesdir=#{@options.source_dir} -a pdf-style=startx -a lang=fr -a allow-uri-read -b pdf -d book -a pdf-fontsdir=#{@options.source_dir}/missedfonts -o #{@options.output} #{@options.source_dir}/book.asciidoc")
  puts "#{@options.output} was successfully generated" if @options.verbose
end
