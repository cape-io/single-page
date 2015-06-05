React = require 'react'

module.exports = React.createClass
  render: ->
    {members, bars} = @props

    MemberRows = for member, i in members
      {firstname, lastname, position} = member
      key = firstname+lastname
      if member.bars
        BarList = for bar, i in member.bars
          {name, url} = bars[bar]

          <li key={name}>
            <a href={url}>{name}</a>
          </li>

      <tr className="member" key={key}>
        <td><p>
          <span className="fname">{firstname}</span> <span className="lname">{lastname}</span>
        </p></td>
        <td><p>{position}</p></td>
        <td><ul>
          {BarList}
        </ul></td></tr>

    <section id="members">
      <h3>Members</h3>
      <table id="bbg">
        <thead>
          <tr>
            <th className="views-align-left">Member</th>
            <th></th>
            <th className="views-align-left">Bar</th>
          </tr>
        </thead>
        <tbody>
          {MemberRows}
        </tbody>
      </table>
    </section>
