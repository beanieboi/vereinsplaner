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
        flash: { notice: 'Document erfolgreich hinzugefügt' }
      )
    else
      render 'new'
    end
  end

  private

  def document_params
    params.require(
      :document
    ).permit(
      :file
    )
  end
end
