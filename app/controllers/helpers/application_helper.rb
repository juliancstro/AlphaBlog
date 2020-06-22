module ApplicationHelper
    def gravatar_for(user, options = { size: 80})
        hash = Digest::MD5.hexdigest(user.email.downcase)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
        image_tag(gravatar_url, alt: user.username)
    end


    def wee?

        "hello!!"
    end

end
