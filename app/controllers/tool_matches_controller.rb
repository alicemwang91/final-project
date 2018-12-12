class ToolMatchesController < ApplicationController
  def index
    @tool_matches = ToolMatch.all

    render("tool_match_templates/index.html.erb")
  end

  def show
    @tool_match = ToolMatch.find(params.fetch("id_to_display"))

    render("tool_match_templates/show.html.erb")
  end

  def new_form
    @tool_match = ToolMatch.new

    render("tool_match_templates/new_form.html.erb")
  end

  def create_row
    @tool_match = ToolMatch.new

    @tool_match.beans_id = params.fetch("beans_id")
    @tool_match.tools_id = params.fetch("tools_id")

    if @tool_match.valid?
      @tool_match.save

      redirect_back(:fallback_location => "/tool_matches", :notice => "Tool match created successfully.")
    else
      render("tool_match_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tool_match = ToolMatch.find(params.fetch("prefill_with_id"))

    render("tool_match_templates/edit_form.html.erb")
  end

  def update_row
    @tool_match = ToolMatch.find(params.fetch("id_to_modify"))

    @tool_match.beans_id = params.fetch("beans_id")
    @tool_match.tools_id = params.fetch("tools_id")

    if @tool_match.valid?
      @tool_match.save

      redirect_to("/tool_matches/#{@tool_match.id}", :notice => "Tool match updated successfully.")
    else
      render("tool_match_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @tool_match = ToolMatch.find(params.fetch("id_to_remove"))

    @tool_match.destroy

    redirect_to("/tool_matches", :notice => "Tool match deleted successfully.")
  end
end
