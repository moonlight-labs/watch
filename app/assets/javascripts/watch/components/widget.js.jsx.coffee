@Components ||= {}
@Components.Watch ||= {}

class Components.Watch.Widget extends React.Component
  @propTypes =
    watching: React.PropTypes.boolean

  render: ->
    return React.DOM.button { onclick: this.clicked }, "Watch"
