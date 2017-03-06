# Sometimes you need to access data as a sequence of bits and bytes. For example, the headers in JPEG and MP3 files contain fields where a single byte may encode two or three separate values.
# Elixir supports this with the binary data type. Binary literals are enclosed between << and >> . The basic syntax packs successive integers into bytes:

bin = << 1, 2 >>
# <<1, 2>>
byte_size(bin)
# 2

# You can add modifiers to control the type and size of each individual field. Here’s a single byte that contains three fields of widths 2, 4, and 2 bits. (The example uses some built-in libraries to show the result’s binary value.)
bin = <<3 :: size(2), 5 :: size(4), 1 :: size(2)>>
# <<213>>
:io.format("~-8.2b~n", :binary.bin_to_list(bin))
# 11010101
# :ok
byte_size(bin)
# 1
# Binaries are both important and arcane. They’re important because Elixir uses them to represent UTF strings. They’re arcane because, at least initially, you’re unlikely to use them directly.
