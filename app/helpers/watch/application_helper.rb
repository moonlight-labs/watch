module Watch
  module ApplicationHelper

    def react_watch_widget(object, options = {})
      react_component 'Components.Watch.Widget', { id: object.id, type: "#{object.class}" }
    end

  end
end
