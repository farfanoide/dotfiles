
Pry::Commands.command(/^$/, "repeat last command") do
  _pry_.input = StringIO.new(Pry.history.to_a.last)
end
