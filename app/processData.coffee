_ = require 'lodash'

module.exports = (data) ->
  data.db = data.db or {}
  {db, theme} = data
  {css, js, settings} = theme
  {author, description} = db
  meta = [
    ['viewport', 'width=device-width, initial-scale=1']
    ['generator', 'CAPE.io, v5.0.1 see www.cape.io']
  ]
  if _.isString author
    meta.push ['author', author]
  if description
    meta.push ['description', description]

  data.theme.meta = meta

  data.currentYear = new Date().getFullYear()

  if db
    data.startYear = db.startYear or db.since

  return data
