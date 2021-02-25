crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "ログインページ", new_user_session_path
  parent :root
end

crumb :new do
  link "新規登録ページ", new_user_registration_path
end

crumb :show do |item|
  link  "商品詳細ページ",item_path(item)    #A urlにidを含むときは、ブロック変数を使い、パスに引数を与える
  parent :root                           #B 親にidを使う時もカンマで区切って、ブロック変数を書く、ビューにもカンマで区切り、インスタンス変数を書く
end


crumb :index do |item|
  link "商品購入ページ", item_purchase_records_path(item)
  parent :show,item
end



# crumb :projects do   
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project) <- A
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)  <-B
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).