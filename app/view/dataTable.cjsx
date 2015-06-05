React = require 'react'
{Table, unsafe} = require 'reactable'

# DataTable Component

module.exports = React.createClass
  render: ->
    {data} = @props

    <div className="skinny scrollable">
      <Table data={data} sortable={true} />
    </div>
