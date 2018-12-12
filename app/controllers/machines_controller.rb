class MachinesController < ApplicationController
  def index
    @machines = Machine.all

    render("machine_templates/index.html.erb")
  end

  def show
    @machine = Machine.find(params.fetch("id_to_display"))

    render("machine_templates/show.html.erb")
  end

  def new_form
    @machine = Machine.new

    render("machine_templates/new_form.html.erb")
  end

  def create_row
    @machine = Machine.new

    @machine.name = params.fetch("name")
    @machine.price = params.fetch("price")
    @machine.service = params.fetch("service")
    @machine.photo = params.fetch("photo")

    if @machine.valid?
      @machine.save

      redirect_back(:fallback_location => "/machines", :notice => "Machine created successfully.")
    else
      render("machine_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @machine = Machine.find(params.fetch("prefill_with_id"))

    render("machine_templates/edit_form.html.erb")
  end

  def update_row
    @machine = Machine.find(params.fetch("id_to_modify"))

    @machine.name = params.fetch("name")
    @machine.price = params.fetch("price")
    @machine.service = params.fetch("service")
    @machine.photo = params.fetch("photo")

    if @machine.valid?
      @machine.save

      redirect_to("/machines/#{@machine.id}", :notice => "Machine updated successfully.")
    else
      render("machine_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @machine = Machine.find(params.fetch("id_to_remove"))

    @machine.destroy

    redirect_to("/machines", :notice => "Machine deleted successfully.")
  end
end
