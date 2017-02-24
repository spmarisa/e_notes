# The majority of the functions in the File module expect paths as arguments. Most commonly, those paths will be regular binaries. The Path module provides facilities for working with such paths:

Path.join("foo", "bar")
# "foo/bar"
Path.expand("~/hello")
# "/Users/jose/hello"

# Using functions from the Path module as opposed to directly manipulating strings is preferred since the Path module takes care of different operating systems transparently. Finally, keep in mind that Elixir will automatically convert slashes (/) into backslashes (\) on Windows when performing file operations.

# With this we have covered the main modules that Elixir provides for dealing with IO and interacting with the file system. In the next sections, we will discuss some advanced topics regarding IO. Those sections are not necessary in order to write Elixir code, so feel free to skip them, but they do provide a nice overview of how the IO system is implemented in the VM and other curiosities.
