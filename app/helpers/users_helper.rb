module UsersHelper
  def user_image(user, classes)
    @image = user.image
    if @image.present?
      @image_user = image_tag(@image.url, class: classes)
    else
      @image_user = image_tag("default.jpeg", class: classes)
    end
  end
end
