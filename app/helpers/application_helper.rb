module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_path('user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def fa_icon(icon_class)
    content_tag('span', '', class: "fa fa-#{icon_class}")
  end

  def event_title_form
    if request.original_url == new_event_url
      t('events.new.title')
    else
      t('events.edit.title')
    end
  end

  def event_back_link(event)
    if request.original_url == new_event_url
      link_to(t('events.form.links.root_back'), root_path)
    else
      link_to(t('events.form.links.event_back'), event_path(event))
    end
  end
end
