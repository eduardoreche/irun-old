class Comment < ActiveRecord::Base
  
  belongs_to :user
  
  def file=(value)
    if value.size > 0
      t = Time.new
      self.attachment = "#{t.to_i}_#{File.basename(value.original_filename)}"
      filepath = "#{RAILS_ROOT}/public/uploads/attachments/#{self.attachment}"
      File.open(filepath, "wb") do |f|
        f.write(value.read)
      end
    end
  end
  
end
