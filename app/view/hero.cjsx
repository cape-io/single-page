React = require 'react'

# HERO Component

module.exports = React.createClass
  render: ->
    {lead, title, tagline, img, alt} = @props
    if img?.source
      imgSrc = img.source
    else
      imgSrc = img

    <div id="hero", className="jumbotron">
      { if img then <img src={imgSrc} alt={title or alt or 'logo'} /> }
      <div className="grouped">
        { if title then <h1>{title}</h1> }
        { if tagline then <h2 className="tagline">{tagline}</h2> }
        { if lead then <p className="lead">{lead}</p> }
      </div>
    </div>
