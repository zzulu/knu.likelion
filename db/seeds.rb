# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = 'capollux@naver.com'
user.password = '12341234'
user.password_confirmation = '12341234'
user.name = '황준우'
user.save!

Post.create(user_id: 1, title: "안녕하세요. 황준우입니다.", context: "2015. 11. 10., 오후 9:30, Lee Duhee <iamdoo2@gmail.com> 작성:\r\n\r\n
멋사4기 전체 운영진 지원 확인 메일입니다.\r\n
(죄송합니다만) 지원자가 많아서, 간단한 숙제를 진행 하도록 하겠습니다.\r\n
10월 16일 월요일 새벽 1시까지, CRUD가 되는 블로그 하나를 짜서 github에 공유해주시기 바랍니다.\r\n
절대 노력 많이 해서 꾸미지 마세요. 그냥 동작만 하면 됩니다.\r\n
이 이메일의 답 메일로 github 주소를 보내주시면 됩니다.\r\n
지원해주셔서 감사합니다.\r\n
이두희 드림.")

Reply.create(user_id: 1, post_id: 1, context: "안녕하세요.")