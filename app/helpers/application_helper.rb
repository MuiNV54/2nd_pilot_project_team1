module ApplicationHelper
	def current_user? user
    user == current_user
  end

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def gravatar_for user
    if user.avatar?
      image_tag user.avatar.avatar
    else
      image_tag("https://fbcdn-profile-a.akamaihd.net/hprofile-ak-
        frc1/c178.0.604.604/s160x160/252231_1002029915278_1941483569_n.jpg", style:"width: 50px")
    end
  end

  def small_avatar user
    if user.avatar?
      image_tag user.avatar.small_avatar
    else
      image_tag("https://fbcdn-profile-a.akamaihd.net/hprofile-ak-
        frc1/c178.0.604.604/s160x160/252231_1002029915278_1941483569_n.jpg", style:"width: 32px")
    end
  end
end