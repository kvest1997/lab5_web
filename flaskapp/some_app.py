from flask import Flask

app = Flask(__name__)

# Декоратор для вывода страницы по умолчанию
@app.route("/")
def hello():
    return "<html><head></head><body><h1>Hello, World!</h1></body></html>"

if __name__ == '__main__':
    app.run(debug=True)