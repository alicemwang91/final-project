class ToolsController < ApplicationController
  def index
    @tools = Tool.all

    render("tool_templates/index.html.erb")
  end

  def show
    @tool = Tool.find(params.fetch("id_to_display"))

    render("tool_templates/show.html.erb")
  end

  def new_form
    @tool = Tool.new

    render("tool_templates/new_form.html.erb")
  end

  def create_row
    @tool = Tool.new

    @tool.name = params.fetch("name")
    @tool.price = params.fetch("price")
    @tool.photo = params.fetch("photo")

    if @tool.valid?
      @tool.save

      redirect_back(:fallback_location => "/tools", :notice => "Tool created successfully.")
    else
      render("tool_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tool = Tool.find(params.fetch("prefill_with_id"))

    render("tool_templates/edit_form.html.erb")
  end

  def update_row
    @tool = Tool.find(params.fetch("id_to_modify"))

    @tool.name = params.fetch("name")
    @tool.price = params.fetch("price")
    @tool.photo = params.fetch("photo")

    if @tool.valid?
      @tool.save

      redirect_to("/tools/#{@tool.id}", :notice => "Tool updated successfully.")
    else
      render("tool_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @tool = Tool.find(params.fetch("id_to_remove"))

    @tool.destroy

    redirect_to("/tools", :notice => "Tool deleted successfully.")
  end
end
