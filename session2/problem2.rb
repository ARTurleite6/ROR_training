class FileSystem
  # @param [Array] file_tree
  def initialize(file_tree)
    @files = construct_tree(file_tree)
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
    @files.select do |elem|
      elem.include?(file_name) and has_extension(elem, extension)
    end
  end

  def construct_tree(file_tree)
    list_files = []
    operation = Proc.new do |elem|
      if is_file?(elem)
        list_files << "." + elem
      end
    end
    traverse_folder(file_tree, operation)
    list_files
  end

  def has_extension(file_name, ext)
    _, extension = file_name[1..].split('.')
    !extension.nil? && extension.include?(ext)
  end

  #@param [Array<String] arr
  #@return [Array<String>]
  def get_folder_path(arr)
    arr.take_while do |elem|
      !is_file?(elem)
    end
  end

  def traverse_folder(folder, operation, base_folder: "")
    return if folder.empty?

    arr_path = get_folder_path(folder)
    new_base_folder = base_folder + arr_path.join("/") + "/"
    folder = folder[arr_path.length..]

    folder.each do |elem|
      case elem
      in Array => arr
        traverse_folder(arr, operation, base_folder: new_base_folder)
      else
        operation.call(new_base_folder + elem)
      end
    end
  end

  def is_file?(element)
    return false if element.is_a?(Array)
    _, extension = element.split('.')
    not extension.nil?
  end
end