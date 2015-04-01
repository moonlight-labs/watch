var FollowMixin = {
  getInitialState: function() {
    return({following: this.props.following});
  },

  getDefaultProps: function() {
    return({ 
      following: true,
      already_following_message: "Unwatch",
      not_following_message: "Watch"
    });
  },

  componentDidMount: function() {
    this.setState({following: this.is_following()});
  },

  handleClick: function() {
    if(this.state.following === true) {
      this.setState({following: false});
      this.unfollow();
    } else {
      this.setState({following: true});
      this.follow();
    }
  },

  render: function() {
    element = null;
    if(this.state.following === true) {
        element = React.createElement('a', 
                          {onClick: this.handleClick, className: "connect_button button"},
                          this.props.already_following_message
        );
      } else {
        element = React.createElement('a', 
                          {onClick: this.handleClick, className: "connect_button button"},
                          this.props.not_following_message
        );
      }
    return ( element );
  }
};


