class FavoriteMailer < ActionMailer::Base
  default from: "ekhan15@yahoo.com"

  def new_comment(user, post, comment)

    # New Headers
    header["Message-ID"] = "<comments/#{comment.id}@ekhan-bloccit.herokuapp>"
    headers["In-Reply-To"] = "<post/#{post.id}@ekhan-bloccit.herokuapp>"
    headers["References"] = "<post/#{post.id}@ekhan-bloccit.herokuapp>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
