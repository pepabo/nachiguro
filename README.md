## Nachiguro

[SUZURI](https://suzuri.jp) CSS Framework

### Installation

This package is not yet published on npm.

```
npm install -D pepabo/nachiguro
```

#### Assets prefix

Nachiguro includes some images for background properties. They will be compiled to:

```css
background: url('nachiguro/assets/images/indicator-eyes.gif');
```

Depending your application structure, it can't be referenced correctly when loaded on browser. To solve this you change `nachiguro/assets/` prefix by assigning `$ncgr-assets-prefix`.

```scss
$ncgr-assets-prefix: 'path/to/public/nachiguro/assets/';
@import 'nachiguro';
```

#### Use with sprockets

If you use nachiguro with Rails application and it uses sprockets, `nachiguro-sprockets` have to be imported before `nachiguro`. This replaces `url` with `asset-url`.

```scss
@import 'nachiguro-sprockets';
@import 'nachiguro';
```

#### Styleguide

If you want to update and read the styleguide, run the following command to open the `styleguide/index.html` in your browser.

```
npm run styleguide
```
