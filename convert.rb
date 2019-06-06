system('sass-convert -R --from scss --to sass ./src')
system('find -L ./src -name "*.scss" | xargs rm')
