@Watch ?= {}

class Watch.Promise

  on: (name, callback, context) ->
    @_observers ?= []
    @_observers.push(name: name, callback: callback, context: context)

  off: (name, callback, context) ->
    @_observers ?= []
    @_observers = @_observers.filter (other) -> 
      other.name is name and other.callback is callback and other.context is context

  trigger: (name) ->
    if @_observers
      for observer in @_observers when observer.name is name
        observer.callback.call(observer.context, @)

  set: (properties = {}) ->
    @properties = properties
    @trigger('change')

  get: (property) ->
    @properties?[property]