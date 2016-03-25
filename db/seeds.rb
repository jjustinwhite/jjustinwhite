User.create!(name: "Frank Zappa",
						 email: "frank@zappa.com",
						 password: "foobar",
						 password_confirmation: "foobar",
						 admin: true,
						 activated: true,
						 activated_at: Time.zone.now)