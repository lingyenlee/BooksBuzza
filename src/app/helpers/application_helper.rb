module ApplicationHelper
     #------display fb profile or user picture or default picture------
  def get_picture(user)
    
    @avatar = user.picture
    @avatar_fb = user.image
     
    if user.picture.attached?
       @avatar = image_tag(user.picture, alt: "#{user.username}")
     elsif @avatar_fb
       @avatar_fb = image_tag("http://graph.facebook.com/#{user.uid}/picture", alt: "#{user.username}") 
     else
       @avatar = image_tag("default.png", alt: "#{user.username}")
     end
  end
end
