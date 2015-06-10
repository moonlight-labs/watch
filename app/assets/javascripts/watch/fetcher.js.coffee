@Watch ||= {}

class Watch.Fetcher
  instance = null
  @shared: -> instance ?= new Watch.Fetcher

  constructor: ->
    @fetch()

  promise: (id, type)->
    @_data ?= {}
    @_data[type] ?= {}
    @_data[type][id] ?= new Watch.Promise

  watch: (id, type) ->
    @promise(id, type).set watched: true

    $.ajax 
      type: "POST"
      data: { id: id, type: type }
      url: "/watches.json"

  unwatch: (id, type) ->
    @promise(id, type).set watched: false

    $.ajax
      type: "DELETE"
      data: { id: id, type: type }
      url: "/watches.json"

  fetch: ->
    $.get "/watches.json", (data) =>
      for pair in data
        [id,type] = pair
        @promise(id, type).set watched: !!pair

