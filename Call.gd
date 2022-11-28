extends Control

signal declined
signal ended_call

const RINGTONE = preload("res://sfx/Telefonizinho Tocando.ogg")

onready var call = $Call
onready var accept = $Call/Accept
onready var decline = $Call/Decline
onready var end_call = $Call/EndCall
onready var ring = $SFX
onready var speaker = $Speaker
onready var call_status = $Call/Status

func _ready() -> void:
    call.hide()

func _on_Accept_pressed() -> void:
    accept.hide()
    decline.hide()
    end_call.show()
    call_status.text = "Call in progress"
    ring.stop()
    yield(get_tree().create_timer(1), "timeout")
    speaker.stream = load("res://sfx/maujoaholder.wav")
    speaker.play()

func _on_Decline_pressed() -> void:
    ring.stop()
    call.hide()
    emit_signal("declined")

func _on_EndCall_pressed() -> void:
    ring.stop()
    call.hide()
    emit_signal("ended_call")

func _on_Speaker_finished() -> void:
    yield(get_tree().create_timer(1), "timeout")
    call.hide()
    emit_signal("ended_call")

func _on_CallTimer_timeout() -> void:
    call.show()
    call_status.text = "is calling..."
    accept.show()
    decline.show()
    end_call.hide()
    ring.play()
