module Watch
  module ApplicationHelper

    def react_watch_widget(object, options = {})
      react_component 'Components.Watch.Widget'
    end

  end
end
