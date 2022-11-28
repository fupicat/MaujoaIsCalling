extends Node2D

func _ready() -> void:
    $UI/Phone.connect("declined", self, "scare")

func scare() -> void:
    $Maujoacreepy.show()
    $Maujoacreepy/SFX.play()
    $Maujoacreepy/SFX2.play()
