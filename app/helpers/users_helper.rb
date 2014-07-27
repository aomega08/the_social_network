module UsersHelper
  def headline_link(text, path)
    if request.path == path
      haml_tag :li, class: 'current' do
        haml_concat link_to text, path
        haml_tag :i, class: 'fa fa-caret-up'
      end
    else
      haml_tag :li do
        haml_concat link_to text, path
      end
    end
  end
end