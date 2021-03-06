# encoding: utf-8
#########################################################
###
##  File: kick_the_tires.rb
##  Desc: Poke around; check things out; see if you want it
##  By:   Dewayne VanHoozer (dvanhoozer@gmail.com)

require 'awesome_print'
require 'pathname'

module KickTheTires

  @ktt_disabled = false

  if caller.empty?
    required_by_filename = __FILE__
  else
    required_by_filename = caller.last.split(':').first
  end

  SOURCE = Pathname.new(required_by_filename).readlines.map{|a_line| a_line.chomp.strip}

  def show_source
    return if @ktt_disabled
    puts
    puts "-"*75
    a_string    = caller.last
    source_line = a_string.split(' ').first.split(':')[1].to_i
    puts "Source #=> [#{source_line}] #{SOURCE[source_line-1]}" # MAGIC: zero-based index
  end

  def show(a_thing)
    return if @ktt_disabled
    show_source
    puts "Showing #{a_thing.class} #=>"
    ap a_thing, {indent: 2, raw: true}
  end

  def assert(a_thing)
    return if @ktt_disabled
    assert_equal true, a_thing
  end

  def refute(a_thing)
    return if @ktt_disabled
    assert_equal false, a_thing
  end

  def assert_equal(expected_this, got_that)
    return if @ktt_disabled
    unless expected_this.to_s == got_that.to_s
      show_source
      puts 'Result #=>'
      puts "Expected This: #{expected_this}"
      puts "But Got That:  #{got_that}"
      puts
    end
  end

  # disable the asserts and shows
  def take_it_for_a_spin
    @ktt_disabled = true
  end

  def give_the_keys_back
    @ktt_disabled = false
  end

  def out_for_a_drive?
    @ktt_disabled
  end


  # TODO: Need a little more thinking about this
  #       pry currently uses and older version of pry
  #       than cli_helper
=begin
  def hands_on
    show_source
    puts "Entering pry.  Type 'help' for available commands."
    puts "Enter the command 'up' to kick the tires on the new ride."
    binding.pry
  end
=end

end # module KickTheTires
