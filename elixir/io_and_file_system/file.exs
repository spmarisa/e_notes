# The File module contains functions that allow us to open files as IO devices. By default, files are opened in binary mode, which requires developers to use the specific IO.binread/2 and IO.binwrite/2 functions from the IO module:

{:ok, file} = File.open "hello", [:write]
# {:ok, #PID<0.47.0>}
IO.binwrite file, "world"
# :ok
File.close file
# :ok
File.read "hello"
# {:ok, "world"}
File.read! "hello"
# "world"


# Besides functions for opening, reading and writing files, the File module has many functions to work with the file system. Those functions are named after their UNIX equivalents. For example,

# File.rm/1 can be used to remove files,
# File.mkdir/1 to create directories,
# File.mkdir_p/1 to create directories and all their parent chain.
# There are even File.cp_r/2 and File.rm_rf/1 to respectively copy and remove files and directories recursively (i.e., copying and removing the contents of the directories too).

# You will also notice that functions in the File module have two variants: one “regular” variant and another variant with a trailing bang (!). For example, when we read the "hello" file in the example above, we use File.read/1. Alternatively, we can use File.read!/1:

File.read("unknown")
File.read!("unknown")


file = "ex"
case File.read(file) do
  {:ok, body}      -> # do something with the `body`
  {:error, reason} -> # handle the error caused by `reason`
end


# However, if you expect the file to be there, the bang variation is more useful as it raises a meaningful error message. Avoid writing:

{:ok, body} = File.read(file)



#write a string to a file
:ok = File.write("example.txt","Hello File!")

{:error, reason} = File.write("example.txt","Hello File!")

:ok = File.write!("example2.txt","Hello File!")




#check if a file exist
true  = File.exists?("exists.txt")
false = File.exists?("doesnt_exist.txt")





#read file using File.stream!
stream = File.stream!("scratch.txt")

# The stream is read by each line when Enumerated
Enum.each(stream, fn(x) -> IO.puts x end)

["Line 1\n", "Line 2\n"] = Enum.into(stream, [])

#number of lines
2 = Enum.reduce(stream, 0, fn(x, acc) -> acc + 1 end)







#read file into a string
{:ok, contents} = File.read("exists.txt")
{:error, reason} = File.read("doesnt_exist.txt")

contents = File.read!("exists.txt")

# Raises a File.Error
contents = File.read!("doesnt_exist.txt")
