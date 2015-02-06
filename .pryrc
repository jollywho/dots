def pbcopy(str)
  IO.popen('xclip', 'r+') {|io| io.puts str }
  output.puts "-- Copy to clipboard --\n#{str}"
end

Pry.config.commands.command "hiscopy", "History copy to clipboard" do |n|
  pbcopy _pry_.input_array[n ? n.to_i : -1]
end

Pry.config.commands.command "copy", "Copy to clipboard" do |str|
  unless str
    str = "#{_pry_.input_array[-1]}#=> #{_pry_.last_result}\n"
  end
  pbcopy str
end

Pry.config.commands.command "lastcopy", "Last result copy to clipboard" do
  pbcopy _pry_.last_result.chomp
end
#
# refs: https://github.com/pry/pry/wiki/FAQ#wiki-awesome_print
if defined? AwesomePrint
  begin
    require 'awesome_print'
    Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
    # Pry.config.print = proc { |output, value| output.puts value.ai } #ページングなし
  rescue LoadError => err
    puts "no awesome_print :("
    puts err
  end
end

    Pry.prompt = [
                  proc { |target_self, nest_level, pry|
                        "\001\e[1;31m\002⏣\e[0;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002#{":#{nest_level}" unless nest_level.zero?}\001\e[0;35m\002» "
                       },
                  proc { |target_self, nest_level, pry|
                        "\001\e[0;35m\002↳ "
                       }
                  ]
