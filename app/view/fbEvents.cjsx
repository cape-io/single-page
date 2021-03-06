React = require 'react'
_ = require 'lodash'
moment = require 'moment'

module.exports = React.createClass
  eventEl: (eventInfo) ->
    {name, cover, description, start_time, end_time, location, id, ticket_uri, venue} = eventInfo
    eventUrl = "https://www.facebook.com/events/#{id}/"
    if start_time
      dateFormat = 'dddd, MMMM Do [at] h:mma'
      startMoment = moment.parseZone(start_time)
      startStr = startMoment.format(dateFormat)
      if end_time
        endMoment = moment.parseZone(end_time)
        if startMoment.isSame(endMoment, 'day')
          endStr = "\u2014" + endMoment.format('h:mma')
        else
          endStr = endMoment.format(dateFormat)
      dateTime =
        <li className="date-time">
          <span className="start-time">{startStr}</span>
          {if endStr then <span className="end-time">{endStr}</span>}
        </li>

    if location
      if venue and venue.id
        venueLink = "https://www.facebook.com/#{venue.id}"
        locationEl = <li className="location"><a href={venueLink}>{location}</a></li>
      else
        locationEl = <li className="location">{location}</li>

    <li className="item event" key={id}>
      <ul className="info">
        {if cover then <li className="cover"><a href={eventUrl}><img src={cover.source} alt={cover.id} /></a></li>}
        {if name then <li className="name"><h3><a href={eventUrl}>{name}</a></h3></li>}
        { dateTime }
        { locationEl }
        {if description then <li className="description" dangerouslySetInnerHTML={ __html: description }></li>}
        {if ticket_uri then <li className="tickets"><a href={ticket_uri}>Get Tickets!</a></li>}
      </ul>
    </li>

  render: ->
    {events, noEventsTxt} = @props

    unless noEventsTxt
      noEventsTxt = 'There are currently no events scheduled in the near future. Please check back soon.'

    if events and events.length
      eventsEl = _.map events, @eventEl
    else
      eventsEl = <li className="no-events">{noEventsTxt}</li>

    <section id="events">
      <h3>Events</h3>
      <ul className="fb-events">
        {eventsEl}
      </ul>
    </section>
