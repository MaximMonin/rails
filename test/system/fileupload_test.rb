require "application_system_test_case"

class FileUploadTest < ApplicationSystemTestCase
  test "upload my files" do
    visit new_user_session_url
    fill_in "user_email", with: users(:one).email
    fill_in "user_password", with: 'secret'
    click_on "commit"
    click_on users(:one).username
    click_on "My files"
    assert_text "Upload new files"
    click_on "Upload new files"
    assert_text "Click or drag and drop files"

    attach_file(Rails.root.join('test/fixtures/files/profile.jpg'), class: 'dz-hidden-input', make_visible: true)
    attach_file(Rails.root.join('test/fixtures/files/video.mp4'), class: 'dz-hidden-input', make_visible: true)
    attach_file(Rails.root.join('test/fixtures/files/laravel7.pdf'), class: 'dz-hidden-input', make_visible: true)
    assert_text "video.mp4"
    assert_text "laravel7.pdf"
    page.has_content?('Delete Upload')
    take_screenshot

    # wait while files uplouds to server and image converts to preview
    sleep(inspection_time=3)
    
    files = UserFile.find_by_sql("SELECT * FROM user_files where user_files.user_id = " + users(:one).id.to_s + " order by user_files.created_at desc limit 3 offset 0")

    assert (files)
    files.each do | file |
      if file.filename == 'profile.jpg'
        assert (file.filepreview)
        assert (File.exist?(Rails.root.to_s + '/storage/' + file.filepreview))
        assert (File.exist?(Rails.root.to_s + '/storage/' + file.file))
        assert (File.size(Rails.root.to_s + '/storage/' + file.file) == File.size(Rails.root.join('test/fixtures/files/profile.jpg')))
      end
      if file.filename == 'video.mp4'
        assert (File.exist?(Rails.root.to_s + '/storage/' + file.file))
        assert (File.size(Rails.root.to_s + '/storage/' + file.file) == File.size(Rails.root.join('test/fixtures/files/video.mp4')))
      end
      if file.filename == 'laravel7.pdf'
        assert (File.exist?(Rails.root.to_s + '/storage/' + file.file))
        assert (File.size(Rails.root.to_s + '/storage/' + file.file) == File.size(Rails.root.join('test/fixtures/files/laravel7.pdf')))
      end
    end
    assert (files.length == 3)
  end
end
