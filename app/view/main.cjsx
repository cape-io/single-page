React = require 'react'

{RouteHandler} = require 'react-router'

Menu = require './menu'
Hero = require './hero'
FbEvents = require './fbEvents'
Contact = require './contact'
Members = require './members'

module.exports = React.createClass

  render: ->
    {db, members, theme, bars} = @props
    {mission, title, bgImg, contact, events, profilePhoto} = db
    {bgImgs} = theme

    if bgImgs and bgImg
      mainStyle =
        backgroundImage: "url('#{bgImg.urlDark}')"
    else
      mainStyle = {}

    <main style={mainStyle}>
      <Hero lead={mission} alt={title} img={profilePhoto} />
      <section>
        { React.createElement(RouteHandler, db) }
      </section>
      <FbEvents events={events} />
      <Members members={members} bars={bars} />
      {if contact then <Contact contact={contact} title={title} /> }
    </main>