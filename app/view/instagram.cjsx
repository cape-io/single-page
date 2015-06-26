React = require 'react'
_ = require 'lodash'

module.exports = React.createClass
  render: ->
    {images} = @props

    pics = _.map images, (picInfo, i) ->
      {id, caption} = picInfo
      if picInfo.images?.standard_resolution
        {url, width, height} = picInfo.images.standard_resolution
      if caption?.text
        caption = caption.text

      <li className="four columns" key={id}>
        <div className="polaroid">
          <img src={url} width={width} height={height} />
          <p>{caption}</p>
        </div>
      </li>

    <section id="instagram">
      <ul className="group"> {pics} </ul>
    </section>
