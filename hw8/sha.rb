require "load_file"

module SHA
  include Load

  input = Load.file("sha.txt")

  p input
end
