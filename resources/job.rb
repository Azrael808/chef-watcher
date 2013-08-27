actions :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :label, :kind_of => String
attribute :path, :kind_of => String
attribute :exclude, :kind_of => Array
attribute :monitor, :kind_of => String
attribute :recursive, :kind_of => [TrueClass, FalseClass]
attribute :command, :kind_of => String
