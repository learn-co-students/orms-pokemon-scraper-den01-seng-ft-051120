# frozen_string_literal: true
require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize db
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find id, db
    sql = "SELECT * FROM pokemon WHERE id = ?"
    pokemon_data = db.execute(sql, id).first
    new_pokemon = Pokemon.new db
    new_pokemon.id = pokemon_data[0]
    new_pokemon.name = pokemon_data[1]
    new_pokemon.type = pokemon_data[2]
    new_pokemon
  end
end
