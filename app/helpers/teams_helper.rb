module TeamsHelper
  def tournaments_for_select
    Tournament.all.collect { |t| [t.name, t.id] }
  end
end
