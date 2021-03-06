React = require 'react'

{RouteHandler} = require 'react-router'

Menu = require './menu'
Instagram = require './instagram'
Hero = require './hero'
FbEvents = require './fbEvents'
Contact = require './contact'
Members = require './members'
Vintage = require './vintage'
Directions = require './directions'

module.exports = React.createClass

  render: ->
    {db, members, theme, bars, instagram, facebook} = @props
    {mission, title, bgImg, contact, events, profilePhoto, vintage, directions} = db
    {bgImgs} = theme

    if bgImgs and bgImg
      mainStyle =
        backgroundImage: "url('#{bgImg.urlDark}')"
    else
      mainStyle = {}
    if facebook
      if facebook.impressum and not mission
        mission = facebook.impressum
      if facebook.coverPhotos?.length and not profilePhoto
        profilePhoto = facebook.coverPhotos[0].urlWide

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
      { if vintage then React.createElement(Vintage, vintage) }
      { if contact then <Contact contact={contact} title={title} /> }
      { if directions then React.createElement(Directions, directions) }
    </main>
