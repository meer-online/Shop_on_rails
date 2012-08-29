ActiveAdmin.register User do
  index do
  	column :email
  	column :salt
  	column :created_at
  	column :updated_at
  	default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
