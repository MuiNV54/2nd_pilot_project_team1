# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PASSWORD = "12345678"
BIRTHDAY = "1-1-1991"

user_list = [
	{name: "MuiNV", email: "mui@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "QuynhBV", email: "quynh@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "GiangND", email: "giang@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "KhanhCD", email: "khanh@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "ChuyenVV", email: "chuyen@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "VuLD", email: "vu@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "HangNM", email: "hang@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "female"},
	{name: "LanDT", email: "lan@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "female"},
	{name: "TuLA", email: "tu@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"},
	{name: "TuanCA", email: "tuan@framgia.com", birthday: BIRTHDAY, password: PASSWORD, gender: "male"}
]

user_list.each do |user|
	User.create! user
end

c = Array.new(11) 
(1..10).each do |num|
	c[num] = User.find num
end

(1..5).each do |i|
	(i+5..10).each do |j|
		Friendship.create! user_id: c[i].id, friend_id: c[j].id
		Status.create! content: "Status from #{c[i].name} to #{c[j].name}", host_id: c[i].id, user_id: c[j].id
	end
end

(1..10).each do |i|
	Status.create! content: "Status from #{c[i].name} by my self", host_id: c[i].id, user_id: c[i].id
end