# Shell 1
class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

apple = Apple.new(variety: 'Honeycrisp', origin: 'Minnesota', history: 'Introduction to Market: 1991')

=> #<Apple:0x007f8bb79a6e20 @variety="Honeycrisp", @origin="Minnesota", @history="Introduction to Market: 1991">

#Commands in Shell 1
irb(main):012:0> Marshal.dump(apple)
=> "\x04\bo:\nApple\b:\r@varietyI\"\x0FHoneycrisp\x06:\x06ET:\f@originI\"\x0EMinnesota\x06;\aT:\r@historyI\"!Introduction to Market: 1991\x06;\aT"


# Shell 2
class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

#Commands in Shell 2
irb(main):010:0> apple_copy = "\x04\bo:\nApple\b:\r@varietyI\"\x0FHoneycrisp\x06:\x06ET:\f@originI\"\x0EMinnesota\x06;\aT:\r@historyI\"!Introduction to Market: 1991\x06;\aT"
=> "\u0004\bo:\nApple\b:\r@varietyI\"\u000FHoneycrisp\u0006:\u0006ET:\f@originI\"\u000EMinnesota\u0006;\aT:\r@historyI\"!Introduction to Market: 1991\u0006;\aT"
irb(main):011:0> Marshal.load(apple_copy)
=> #<Apple:0x007fd659154898 @variety="Honeycrisp", @origin="Minnesota", @history="Introduction to Market: 1991">

 #differnt id than apple object in Shell 1