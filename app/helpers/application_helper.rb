module ApplicationHelper
  def flash_class(key)
    case key
    when 'success'
      'alert-success'
    when 'warning'
      'alert-warning'
    when 'danger'
      'alert-danger'
    end
  end

  def current_year
    "© #{Time.current.year} "
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
