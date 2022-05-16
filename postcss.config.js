// const purgecss = require('@fullhuman/postcss-purgecss')

let purgecss = () => {}

if (process.env.NODE_ENV !== 'development') {
   purgecss = require('@fullhuman/postcss-purgecss')
}

module.exports = {
  plugins: [
    purgecss({
      safelist: [
                  'fade', 
                  'show', 
                  /^collaps/, 
                  /^top-/, 
                  /^start-/, 
                  /^translate-middle-/,
                  /^btn-close/, 
                  /^position-/, 
                  /^nav-/, 
                  /^navbar-/, 
                  /^toast-/, 
                  /^popover-/, 
                  /^bs-popover-/
                ],
      content: [
        './app/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/frontend/**/*.js'
      ]
    })
  ]
}
