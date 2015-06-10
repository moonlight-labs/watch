@Components ||= {}
@Components.Watch ||= {}

class Components.Watch.Widget extends React.Component
  @propTypes =
    id: React.PropTypes.number
    type: React.PropTypes.string

  constructor: (props) ->
    super(props)
    @state = Watch.Fetcher.shared()

  watched: ->
    this.state.watched(@props.id, @props.type)

  watch: ->
    this.state.watch(@props.id, @props.type)

  unwatch: ->
    this.state.unwatch(@props.id, @props.type)

  text: ->
    if @watched() then (@props.unwatch or "Unwatch") else (@props.watch or "Watch")

  render: ->
    return React.DOM.button { onClick: @clicked }, @text()

  clicked: =>
    if @watched() then @unwatch() else @watch()