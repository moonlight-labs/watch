@Components ||= {}
@Components.Watch ||= {}

class Components.Watch.Widget extends React.Component
  @propTypes =
    watching: React.PropTypes.boolean

  render: ->
    return React.DOM.button { onclick: this.clicked }, 

#
#
# var FollowProjectButton = React.createClass({
#
#   // mixins: [watchMixin];
#
#   getInitialState: function(id) {
#
#     return {watch: false};
#
#   },
#   handleClick: function(event) {
#     this.setState({watch: !this.state.watch});
#   },
#   render: function() {
#     var text = this.state.watch ? 'unwatch' : 'watch';
#     return (
#       <p onClick={this.handleClick}>
#         <button>{text}</button>
#       </p>
#     );
#   }
#
#
# });
