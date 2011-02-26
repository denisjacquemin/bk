desc "cache assets, push to github, deploy to heroku, and notify hoptoad"
task :deploy => :environment do
  puts "-----> running rake cache_assets"
  system("rake cache_assets") ? true : fail

  #puts "-----> pushing to github"
  #system("git push origin master") ? true : fail

  #puts "-----> deploying to heroku"
  #system("git push heroku master") ? true : fail

  #puts "-----> notifying hoptoad"
  #system("rake hoptoad:deploy TO=production REVISION=`git rev-parse HEAD`") ? true : fail

  puts "-----> done"
end