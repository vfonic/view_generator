module View
  class ViewGenerator < Rails::Generators::NamedBase
    argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
    
    def self.start(args, config)
      begin
        modelClass = eval(args[0].camelize)
        
        accessible_attributes = modelClass.accessible_attributes.to_a
        accessible_attributes.delete_if(&:empty?)
        accessible_attributes = modelClass.new.attributes.keys - modelClass.protected_attributes.to_a if accessible_attributes.blank?
        accessible_attributes.each do |attribute|
          if attribute != "created_at" && attribute != "updated_at"
            attributes_string = attribute.to_s + ":" + modelClass.columns_hash[attribute].type.to_s # + " "
            args << attributes_string
          end
        end
      rescue
      ensure
        super
      end
    end
    
    def check_if_model_exists
      begin
        modelClass = eval(name.camelize)
        raise if modelClass.table_exists? == false
      rescue NameError
        puts "No such model: " + name.camelize
        puts "Try writing your model name in singular"
        raise $!
      rescue
        puts "Table " + name + " doesn't exist."
        puts "Try running 'rake db:migrate'"
        raise $!
      end
    end
    
    hook_for :template_engine, :as => :scaffold
  end
end
