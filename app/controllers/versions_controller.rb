class VersionsController < ApplicationController

  def revert
    @version = PaperTrail::Version.find(params[:id])
    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end
    link_name = params[:redo] == "true" ? "redo" : "undo"
    link = view_context.link_to(link_name, revert_version_path(@version.next, redo: !(params[:redo] == "true")), method: :post)
    redirect_to request.referer , :notice => "Undid #{@version.event} #{link}"
  end

end
