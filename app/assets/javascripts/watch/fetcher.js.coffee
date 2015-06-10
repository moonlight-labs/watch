@Watch ||= {}

class Watch.Fetcher
  instance = null
  @shared: -> instance ?= new Watch.Fetcher

  constructor: ->
    @fetch()

  watch: (id, type) ->
    @watches()[type] ||= {}
    @watches()[type][id] = true

    $.ajax 
      type: "POST"
      data: { id: id, type: type }
      url: "/watches.json"

  unwatch: (id, type) ->
    @watches()[type] ||= {}
    @watches()[type][id] = false

    $.ajax 
      type: "DELETE"
      data: { id: id, type: type }
      url: "/watches.json"

  watched: (id, type) ->
    return !!@watches()?[type]?[id]

  watches: ->
    @_watches ?= {}

  fetch: ->
    $.get "/watches.json", (data) =>
      for pair in data
        [id,type] = pair
        @watches()[type] ?= {}
        @watches()[type][id] = !!pair
