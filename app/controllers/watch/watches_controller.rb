require_dependency "watch/application_controller"

module Watch
  class WatchesController < ApplicationController

    # POST /watch
    def create
      watcher.watch!(watchable)

      respond_to do |format|
        format.json { head :ok }
      end
    end

    # DELETE /watch
    def destroy
      watcher.unwatch!(watchable)

      respond_to do |format|
        format.json { head :ok }
      end
    end

    # GET /watching
    def index
      if stale?(etag: watcher, last_modified: (watcher.updated_at || watcher.created_at).utc)
        watches = watcher.watches

        respond_to do |format|
          format.json { render json: watches.pluck(:watchable_id, :watchable_type), root: !watches, status: :ok }
        end
      end
    end

  protected

    def watchable
      params[:type].constantize.find(params[:id])
    end

    def watcher
      ::Watch.configuration.watcher.call(self)
    end

  end
end
