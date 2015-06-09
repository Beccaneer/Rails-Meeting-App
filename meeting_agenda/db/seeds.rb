# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# creating rthomson
@user = User.new
	@user.fname = "Rebecca"
	@user.lname = "Thomson"
	@user.admin = true
	@user.watiam = "rthomson"
	@user.email = "rthomson@uwaterloo.ca"
@user.save
  
@user = User.new
  @user.fname = "Sean"
  @user.lname = "Speers"
  @user.admin = true
  @user.watiam = "sean"
  @user.email = "sean@uwaterloo.ca"
@user.save
  
@user = User.new
  @user.fname = "Tim"
  @user.lname = "Kim"
  @user.admin = false
  @user.watiam = "qtkim"
  @user.email = "qtkim@uwaterloo.ca"
@user.save

@user = User.new
  @user.fname = "David"
  @user.lname = "Skinner"
  @user.admin = false
  @user.watiam = "djskinne"
  @user.email = "djskinne@uwaterloo.ca"
@user.save
