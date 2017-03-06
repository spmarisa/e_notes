# A single function definition lets you define different implementations, depending on the type and contents of the arguments passed

handle_open = fn
    {:ok, file} -> "Read data: #{IO.read(file, :line)}"
    {_, error} -> "Error: #{:file.format_error(error)}"
 end

handle_open.(File.open("code/intro/hello.exs"))
handle_open.(File.open("nonexistent"))
