config = require 'config'

p = module.exports

p.globAllImg         = './public/!(assets)/**/*.{png,jpg,jpeg,gif,svg,json}'
p.globAllLess        = './public/!(assets)/**/*.less'
p.globAllCoffee      = './public/!(assets)/**/*.coffee'
p.globPageLess       = './public/pages/*/*.less'
p.globPageCoffee     = './public/pages/*/*.coffee'
p.globAssetsImg      = './public/assets/**/*.{png,jpg,jpeg,gif,svg,json}'
p.globAssetsCss      = './public/assets/**/*.css'
p.globAssetsJs       = './public/assets/**/*.js'

p.commonCoffee       = './public/coffee/common.coffee'
p.commonLess         = './public/less/common.less'

p.assetsDir          = config.assets_dir_path
p.assetsManifestName = 'rev-manifest.json'
p.assetsManifest     = "#{p.assetsDir}/#{p.assetsManifestName}"