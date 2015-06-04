React = require 'react'

{RouteHandler} = require 'react-router'

Menu = require './menu'
Hero = require './hero'
FbEvents = require './fbEvents'
Contact = require './contact'
DataTable = require './table'

module.exports = React.createClass

  render: ->
    {db, members, facebook} = @props
    {mission, title} = db

    if bgImgs and bgImg
      mainStyle =
        backgroundImage: "url('#{bgImg.urlDark}')"
    else
      mainStyle = {}

    <main style={mainStyle}>
      <Hero lead={mission} alt={title} />
      <section>
        { React.createElement(RouteHandler, pageData) }
      </section>
      <Events events={facebook.events?.data} />
      <Members members={members} />
      <Contact contact={pageData.contact} title={title} />
    </main>
