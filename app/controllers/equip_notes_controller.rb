class EquipNotesController < ApplicationController
  def index
    @equip_notes = EquipNote.all
  end
end
