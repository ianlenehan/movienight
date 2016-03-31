User.destroy_all
u1 = User.create :email => 'ianlenehan@me.com', :password => 'balmain', :password_confirmation => 'balmain', :name_first => 'Ian', :name_last => 'Lenehan', :admin => true


Group.destroy_all


Event.destroy_all


Rating.destroy_all
