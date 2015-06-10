@Components ||= {}
@Components.Watch ||= {}

class Components.Watch.Widget extends React.Component
  @propTypes =
    id: React.PropTypes.number
    type: React.PropTypes.string

  constructor: (props) ->
    super(props)
    promise = Watch.Fetcher.shared().promise(@props.id, @props.type)
    @state = promise.properties || {}

  componentWillMount: ->
    promise = Watch.Fetcher.shared().promise(@props.id, @props.type)
    promise.on('change', @refresh, @)

  componentWillUnmount: ->
    promise = Watch.Fetcher.shared().promise(@props.id, @props.type)
    promise.off('change', @refresh, @)

  refresh: (promise) ->
    @setState(promise.properties || {})

  watch: ->
    Watch.Fetcher.shared().watch(@props.id, @props.type)

  unwatch: ->
    Watch.Fetcher.shared().unwatch(@props.id, @props.type)

  text: ->
    if @state.watched then "Unwatch" else "Watch"

  render: ->
    return React.DOM.button { onClick: @clicked }, @text()

  clicked: =>
    if @state.watched then @unwatch() else @watch()