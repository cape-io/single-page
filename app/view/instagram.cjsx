React = require 'react'

module.exports = React.createClass
  render: ->
    {images} = @props

    pics = for pic, i in images
      <li className="four columns" key={pic.id}>
        <div className="polaroid">
          <img src={pic.url} width={pic.width} height={pic.height} />
          <p>{pic.caption}</p>
        </div>
      </li>

    <section id="instagram">
      <ul className="group"> {pics} </ul>
    </section>
