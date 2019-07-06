class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    binding.pry
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
