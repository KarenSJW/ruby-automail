#!/usr/local/bin/ruby

require 'csv'
require 'net/smtp'



# 讀取csv
_receiver = ""
CSV.foreach("mail_headphone.csv") do |row|

	_mail = <<MESSAGE_CONTENT
From: kevenkmupsy@gmail.com
To: #{row[2]}
Subject: headphone問卷發信測試

#{row[1]}你好
這是致伸科技的使用者經驗部門
請至以下連結填寫問卷：http://tinyurl.com/khdrgs9
在問卷開頭填入你專屬的代號#{row[0]}即可
最後別忘了在問卷最後填寫你的收件地址和收件姓名
我們會將禮券寄送給你

MESSAGE_CONTENT
	

  Net::SMTP.start('smtp.gmail.com', 587, 'kevenkmupsy@gmail.com', 'kevenkmupsy', '9922cola', :plain) do |smtp|
  		smtp.send_message( _mail, row[2])
	end

end
