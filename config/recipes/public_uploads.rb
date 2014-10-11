require File.expand_path(File.dirname(__FILE__) + '/helpers')

Capistrano::Configuration.instance.load do
  # set_default(:uploads_path) { "/mnt/projects/ads_online_#{ stage }/shared/uploads" }
  set_default(:uploads_path) { "#{shared_path}/uploads" }

  after "deploy:setup",             "public_uploads:setup"
  after "deploy:create_symlink",    "public_uploads:create_symlink"

  namespace :public_uploads do
    desc "Creates a shared folder for uploads"
    task :setup, roles: :web do
      run "mkdir -p #{uploads_path}"
    end

    desc "Symlinks the public uploads to the current public/uploads"
    task :create_symlink, roles: :web do
      run "ln -nfs #{uploads_path} #{current_path}/public/uploads"
    end
  end
end
