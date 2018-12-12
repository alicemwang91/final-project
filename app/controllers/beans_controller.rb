class BeansController < ApplicationController
  def index
    @beans = Bean.all

    render("bean_templates/index.html.erb")
  end

  def show
    @bean = Bean.find(params.fetch("id_to_display"))

    render("bean_templates/show.html.erb")
  end

  def new_form
    @bean = Bean.new

    render("bean_templates/new_form.html.erb")
  end

  def create_row
    @bean = Bean.new

    @bean.name = params.fetch("name")
    @bean.origin = params.fetch("origin")
    @bean.roast = params.fetch("roast")
    @bean.process_method = params.fetch("process_method")
    @bean.flavor = params.fetch("flavor")
    @bean.altitude = params.fetch("altitude")
    @bean.precipitation = params.fetch("precipitation")
    @bean.instruction = params.fetch("instruction")
    @bean.recommended_machine_id = params.fetch("machine_id")
    @bean.photo = params.fetch("photo")

    if @bean.valid?
      @bean.save

      redirect_back(:fallback_location => "/beans", :notice => "Bean created successfully.")
    else
      render("bean_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bean = Bean.find(params.fetch("prefill_with_id"))

    render("bean_templates/edit_form.html.erb")
  end

  def update_row
    @bean = Bean.find(params.fetch("id_to_modify"))

    @bean.origin = params.fetch("origin")
    @bean.roast = params.fetch("roast")
    @bean.process_method = params.fetch("process_method")
    @bean.flavor = params.fetch("flavor")
    @bean.altitude = params.fetch("altitude")
    @bean.precipitation = params.fetch("precipitation")
    @bean.instruction = params.fetch("instruction")
    @bean.recommended_machine_id = params.fetch("machine_id")
    @bean.photo = params.fetch("photo")

    if @bean.valid?
      @bean.save

      redirect_to("/beans/#{@bean.id}", :notice => "Bean updated successfully.")
    else
      render("bean_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @bean = Bean.find(params.fetch("id_to_remove"))

    @bean.destroy

    redirect_to("/beans", :notice => "Bean deleted successfully.")
  end
end
