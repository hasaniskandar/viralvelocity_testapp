class ContactsController < ApplicationController
  load_and_authorize_resource

  def create
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @contact }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @contact }
    end
  end

  def update
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
