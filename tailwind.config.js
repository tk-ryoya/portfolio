module.exports = {
  content: [
    './app/views/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  daisyui: {
    // themes: ["valentine"],
    themes: [
      {
        mytheme: {
         "primary": "#ecfccb",
         "secondary": "#fee2e2",
         "accent": "#f5f5f4",
         "neutral": "#67e8f9",
         "base-100": "#cffafe",
         "info": "#fef3c7",
         "success": "#88DCDD",
         "warning": "#ffedd5",
         "error": "#e9d5ff",
        },
      },
    ],
  },
}
