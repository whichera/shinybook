h = {
    password: "marz",
    password_confirmation: "marz"
}

if h[:password] == h[:password_confirmation]
    puts "true"
end