require '/home/shantanu/parser/lib/parser/current'
x = Parser::CurrentRuby.parse("x = 2 + 2");
p x
#x.tag