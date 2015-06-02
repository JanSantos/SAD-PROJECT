if Rails.env.production?
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf"
else
  # Linux (check your processor for Intel x86 or AMD x64)
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf_linux_x86"
  # OS X
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf_darwin_x86"            
  # Windows
  # wkhtmltopdf_path = 'C:\Program Files/wkhtmltopdf/wkhtmltopdf.exe'
end

WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path }