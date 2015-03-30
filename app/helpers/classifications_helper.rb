module ClassificationsHelper
  def update_places
    Player.all.group_by(&:score).sort_by(&:first).reverse.map(&:last).each_with_index { |player, index| player.each { |p| p.update(place: index + 1)}}
  end
end
