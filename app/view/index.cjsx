React = require 'react'
_ = require 'lodash'

Body = require './body'

module.exports = React.createClass
  contextTypes: {
    router: React.PropTypes.func.isRequired
  }
  render: ->
    {theme, db} = @props
    {css, js, meta, settings, navTitle} = theme
    {homepageId, display, defaultDisplay, fluid} = settings
    {pageId, contentId, filterType, filterValue} = @context.router.getCurrentParams()
    if currentRoutes = @context.router.getCurrentRoutes()
      currentRouteIndex = currentRoutes.length-1
      currentRoute = currentRoutes[currentRouteIndex]
      parentRoute = currentRoutes[currentRouteIndex-1]
    # Theme overrides the settings in index.yaml.

    pageTitle = if db.title then db.title else "[title]"

    <html>
      <head>
        <title>{pageTitle}</title>
        <meta charSet="utf-8" />
        {
          _.map meta, (metaArr, i) ->
            <meta key={'m'+i} name={metaArr[0]} content={metaArr[1]} />
        }
        {
          _.map css, (cssFilePath, i) ->
            <link key={'c'+i} rel="stylesheet" type="text/css" href={cssFilePath} />
        }
        {
          _.map js, (jsFilePath, i) ->
            <script key={'j'+i} type="text/javascript" src={jsFilePath} async defer />
        }
      </head>
      { React.createElement(Body, @props) }
    </html>
