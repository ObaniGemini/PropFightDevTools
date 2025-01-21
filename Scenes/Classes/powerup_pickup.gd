class_name PowerupPickup extends Node2D

@export var effect : PackedScene
@export var pickup_sfx : AudioStreamPlayer

enum Type { Malus, Bonus }
@export var type : Type = Type.Malus
@export var can_duplicate := true
@export var time := 0.0
