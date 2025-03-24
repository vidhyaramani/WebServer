from flask import Flask, request, jsonify
import random
import os

app = Flask(__name__)

def get_random_port():
    return random.randint(10000, 20000) # generate the function for random port 

@app.route('/api/v1/getQML', methods=['POST'])
def get_qml():
    data = request.get_json()
    if not data or 'filename' not in data:
        return jsonify({"error": "Filename is required"}), 400
        
    filename = data['filename']
    
    if not os.path.isfile(filename):
        return jsonify({"error": "File not found"}), 404
        
    with open(filename, 'r') as file:
        content = file.read()
        
    return jsonify({"content":content}), 200
    
if __name__== '__main__':
    port = get_random_port()
    print(f"starting server on port {port}")
    app.run(host='localhost',port=port)
#def home():
    #return "Hello"

#if __name__=='__main__':
    #app.run(debug=True, port=5001)
