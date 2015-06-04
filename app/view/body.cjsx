React = require 'react'

Header = require './header'
Main = require './main'
Footer = require './footer'

module.exports = React.createClass
  render: ->
    {theme, db, facebook, instagram} = @props
    {settings} = theme
    {title, tagline, about, mission, author, currentYear, startYear} = db

    <body>
      <Header
        title={title}
        tagline={tagline}
        about={about}
        mission={mission}
        settings={settings}
      />

      { React.createElement(Main, @props) }

      <Footer currentYear={currentYear} startYear={startYear} author={author} title={title} />
      <div id="fb-root"></div>
    </body>
