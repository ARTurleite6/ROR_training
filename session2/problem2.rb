class FileSystem
  # @param [Array] file_tree
  def initialize(file_tree)
    @file_tree = file_tree
  end

  def total_number_of_files
    find.count
  end

  def find_file(file_name)
    find(file_name: file_name)
  end

  def filter_by_extension(ext)
    find(extension: ext)
  end

  private

  # I made this function, so if i search for a folder, it returns all the files inside of it
  # @return [Array<String>]
  def find(file_name: "", extension: "")
    list_files = []
    operation = Proc.new do |elem|
      if is_file?(elem) and elem.include?(file_name) and has_extension(elem, extension)
        list_files << elem
      end
    end
    traverse_folder(@file_tree, operation)
    puts list_files
    list_files
  end

  def has_extension(file_name, ext)
    _, extension = file_name.split('.')
    !extension.nil? && extension.include?(ext)
  end

  def traverse_folder(folder, operation, base_folder: "")
    return if folder.empty?
    # puts folder.inspect
    folder.each do |elem|
      case elem
      in Array => arr
        new_base_folder = base_folder + "#{arr[0]}/" if arr.length >= 1 and !is_file?(arr[0])
        traverse_folder(arr[1..], operation, base_folder: new_base_folder)
      else
        puts "Elem: #{elem}"
        operation.call(base_folder + elem)
      end
    end
  end

  def is_file?(element)
    return false if element.is_a?(Array)
    _, extension = element.split('.')
    not extension.nil?
  end
end