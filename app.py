from flask import Flask, jsonify
import json
import os

app = Flask(__name__)

FILE = "/data/notes.json"

if os.path.exists(FILE):
    with open(FILE, "r") as f:
        notes = json.load(f)
else:
    notes = []

@app.route('/')
def home():
    return jsonify({"message": "La API está activa"})


@app.route('/add/<note>')
def add_note_v1(note):
    notes.append(note)
    with open(FILE, "w") as f:
        json.dump(notes, f)
    return jsonify({ "note": note})

@app.route('/list')
def list_notes_v1():
    return jsonify({"notes": notes})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
