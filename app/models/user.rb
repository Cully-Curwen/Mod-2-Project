class User < ApplicationRecord
    validates :first_name, presence: true 
    validates :last_Name, presence: true 
    #the syntax below heps when i have two text field that should recieve exactly the same content
    # in the view it will look like

# <%= text_field :person, :email %>
# <%= text_field :person, :email %>

end
