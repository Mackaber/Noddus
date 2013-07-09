module ApplicationHelper

 def show_navbar_image
   if !(current_user.avatar.to_s == "")
     link_to cl_image_tag(current_user.avatar,
     :border => 0, :class => "span1", :style => "width:22px;position: absolute;margin-left: -68px;",
     :width => 22, :height => 22, :crop => :thumb, :gravity => :face)
   elsif current_user.imagen
     link_to image_tag(current_user.imagen,
     :border => 0, :class => "span1", :style => "width:22px;position: absolute;margin-left: -68px;")
   else
     link_to image_tag("foto_perfil.gif", :border => 0,:class => "span1", :style => "width:22px;position: absolute;margin-left: -68px;")
   end
 end

 def show_full_image(user)
   if !(user.avatar.to_s == "")
     cl_image_tag(user.avatar, :style => "width:280px",:width => 280, :height => 280, :crop => :thumb, :gravity => :face)
   elsif user.imagen
      image_tag(user.imagen, :style => "width:280px")
   else
      image_tag("foto_perfil.gif")
   end
 end

end
