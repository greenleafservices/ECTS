class EquipWarrantyNotesController < ApplicationController
  def index
    @equip_warranty_notes = EquipWarrantyNote.all
  end
end
