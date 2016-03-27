User.destroy_all
u1 = User.create :email => 'ianlenehan@me.com', :password => 'balmain', :password_confirmation => 'balmain', :name_first => 'Ian', :name_last => 'Lenehan', :admin => true
u2 = User.create :email => 'joe@mail.com', :password => 'balmain', :password_confirmation => 'balmain', :name_first => 'Joe', :name_last => 'Bloggs'

Group.destroy_all
g1 = Group.create :name => 'WDI13 Movie Night'

Event.destroy_all
e1 = Event.create :location => "Ian's House", :imdb_id => 'tt0172495', :date => '2016/04/04', :time => '8pm', :details => 'Be there or be square'
e2 = Event.create :location => "Joe's House", :imdb_id => 'tt0102059', :date => '2016/02/04', :time => '7.30pm', :details => 'My eyes are ceramic. Caught a bazooka round at Little Big Horn. Or was it Okinawa? The one without the Indians.'

Rating.destroy_all
r1 = Rating.create :rating_score => "Poo"
r2 = Rating.create :rating_score => "Amazing"
r3 = Rating.create :rating_score => "Average"
r4 = Rating.create :rating_score => "Amazing"

g1.users << u1 << u2

e1.users << u1 << u2
e2.users << u2

e1.ratings << r2 << r3
e2.ratings << r1 << r4
u1.ratings << r2 << r4
u2.ratings << r1 << r3
