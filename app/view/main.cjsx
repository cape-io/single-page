React = require 'react'

{RouteHandler} = require 'react-router'

Menu = require './menu'
Instagram = require './instagram'
Hero = require './hero'
FbEvents = require './fbEvents'
Contact = require './contact'
Members = require './members'

module.exports = React.createClass

  render: ->
    {db, members, theme, bars, instagram} = @props
    {mission, title, bgImg, contact, events, profilePhoto} = db
    {bgImgs} = theme

    if bgImgs and bgImg
      mainStyle =
        backgroundImage: "url('#{bgImg.urlDark}')"
    else
      mainStyle = {}

    <main className="container" style={mainStyle}>
      <Hero lead={mission} alt={title} img={profilePhoto} />
      {
        if instagram
          <Instagram images={instagram} />
      }
      <FbEvents events={events} />
      {
        if members and bars
          <Members members={members} bars={bars} />
      }
      {if contact then <Contact contact={contact} title={title} /> }
    </main>
