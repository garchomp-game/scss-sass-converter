def main(params)
  if params == 'scss'
    from = 'scss'
    to = 'sass'
  elsif params == 'sass'
    from = 'sass'
    to = 'scss'
  else
    puts '変換したいタイプを正しく入力しなおしてください'
    main()
  end
  system("sass-convert -R --from #{from} --to #{to} ./src ./#{to}")
end

def check
  gem_name, *gem_ver_reqs = 'sass'
  gdep = Gem::Dependency.new(gem_name, *gem_ver_reqs)
  found_gspec = gdep.matching_specs.max_by(&:version)
  return found_gspec
end
scss_count = Dir.glob("src/**/*.scss").count()
sass_count = Dir.glob("src/**/*.sass").count()
if !File.exist?('./src')
  puts  '先にsrcフォルダーを作成し、scssもしくはsassを入れてください。'
elsif scss_count == 0 && sass_count == 0
  puts 'scss拡張子もしくはsass拡張子のファイルがありません'
elsif check()
  if scss_count != 0
    main('scss')
  elsif sass_count != 0
    main('sass')
  end
else
  puts '先にgem install sassをしてください'
end
