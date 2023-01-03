from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')


# 추가된 라우트
@app.route('/connecting_to_metamask')
def connecting_to_metamask():
    return render_template('connecting_to_metamask.html')


@app.route('/about')
def about():
    return 'About 페이지'


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True)

