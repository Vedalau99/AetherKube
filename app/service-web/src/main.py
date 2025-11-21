from flask import Flask, render_template, jsonify

app = Flask(__name__, template_folder='templates', static_folder='static')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/health')
def health():
    return jsonify(status='healthy')

@app.route('/api/info')
def info():
    return jsonify(app='AetherKube service-web', version='0.1.0')

if __name__ == '__main__':
    # For local dev
    app.run(host='0.0.0.0', port=8080, debug=True)
