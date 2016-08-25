# Pepagram

GMOペパボ株式会社で利用している、スタイルガイドジェネレータ [Hologram](http://trulia.github.io/hologram/) のテーマです。

## Preview

[![screenshot](http://pepabo.github.io/pepagram-example/screenshot.png)](http://pepabo.github.io/pepagram-example/public/styleguide/)

[:point_right: **このテーマを利用して制作したスタイルガイドのサンプル**](http://pepabo.github.io/pepagram-example/public/styleguide/)

[:memo: **スタイルガイドのサンプルのコード**](https://github.com/pepabo/pepagram-example/)

## Usage

アプリケーションの Gemfile に 1 行追記して、

```
gem 'hologram'
```

bundle install します。

```
$ bundle install
```

パッケージマネージャーに Bower を利用していたら:

```
$ bower install --save-dev pepagram
```

パッケージマネージャーに npm を利用していたら:

```
$ npm install --save-dev pepagram
```

`hologram_config.yml.sample` をコピーして、 `hologram_config.yml` を用意します。

このファイルを以下のように編集して、スタイルガイドの設定をします。

> それぞれの項目の詳細は [Hologram の README](https://github.com/trulia/hologram) を参照ください。

```yml
# Hologram の設定ファイルです。
# ファイル・ディレクトリのパスは、相対パスで指定します。

# Hologram 向けにスタイルガイドのコメントが書いてある、
# スタイルシートファイルのディレクトリを指定します。
source: stylesheets

# スタイルガイドの HTML ファイルを書き出すディレクトリを指定します。
destination: styleguide

# アプリケーションの CSS ファイルを指定します。
# スタイルガイドの HTML ファイルのあるディレクトリから相対パスで指定します。
application_css:
  - 'main.css'
  - 'component.css'

# スタイルガイドのテーマに関するファイルのディレクトリを指定します。
documentation_assets: doc_assets

# Markdown をレンダリングするときに、
# マークアップをカスタマイズするためのファイルを指定します。
custom_markdown: doc_assets/_markdown_renderer.rb

# スタイルガイドの設定をします。
# theme_color にプロジェクトのキーカラーを指定すると、好きな配色に変えられます。
# brand_image に画像ファイルを指定すると、好きな画像を設置できます。
pepagram:
  title: 'Example Style Guide'
  author: 'GMO Pepabo, Inc.'
  theme_color: '#3e6f99'
  brand_image: 'my-brand-image.jpg'
```

> #### たとえば Rails アプリケーションなら
>
> ```
> source: app/assets/stylesheets
> destination: public/styleguide
> application_css:
>   - '/assets/application.css'
> documentation_assets: vendor/assets/bower_components/pepagram/doc_assets
> custom_markdown: vendor/assets/bower_components/pepagram/doc_assets/_markdown_renderer.rb
> ```

設定ファイルのパスを指定して、 Hologram を実行します。

```
$ hologram -c hologram_config.yml
```

`destination` に指定したディレクトリに HTML ファイルが生成されるので、ブラウザで表示します。

## Development

```
$ npm install
$ npm run build
```

## License

The MIT License (MIT)

Copyright (c) 2016- GMO Pepabo, Inc.
