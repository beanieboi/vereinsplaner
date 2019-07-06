class DocumentsController < ApplicationController
  def paper_trail_enabled_for_controller
    super && false
  end

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to(
        documents_path,
        flash: { notice: 'Dokument erfolgreich hinzugefügt' }
      )
    else
      render 'new'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy
      redirect_to documents_path, notice: 'Dokument erfolgreich gelöscht.'
    else
      redirect_to documents_path, notice: 'Dokument konnte nicht gelöscht werden.'
    end
  end

  private

  def document_params
    params.require(
      :document
    ).permit(
      :file,
      :tags => [],
    )
  end
end
