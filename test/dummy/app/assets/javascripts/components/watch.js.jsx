// var watchMixin = {
//   private:
//   _enumStates = [undefined, True, False] 
//   function onStateChanged(newState, oldState) {
//     self.render(newState => view)
//   }

//   public:
//   onState = undefined
//   node undefinedView = '<span>...</span>'
//   node onView = '<span>On</span>'
//   node offView = '<span>Off</span>'
//   eventHandler onClick()
//   eventHandler onStateOff()
//   eventHandler onStateOn()
//   eventHandler  onStateUndefined()
// };

var FollowProjectButton = React.createClass({

  // mixins: [watchMixin];

  getInitialState: function(id) {

    return {watch: false};

  },
  handleClick: function(event) {
    this.setState({watch: !this.state.watch});
  },
  render: function() {
    var text = this.state.watch ? 'unwatch' : 'watch';
    return (
      <p onClick={this.handleClick}>
        <button>{text}</button>
      </p>
    );
  }


});
