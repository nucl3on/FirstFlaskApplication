from flask import Flask, render_template, url_for, request, redirect
from flask_mysqldb import MySQL



project = Flask(__name__)
project.config['MYSQL_HOST'] = 'localhost'
project.config['MYSQL_USER'] = 'root'
project.config['MYSQL_PASSWORD'] = ''
project.config['MYSQL_DB'] = 'test'
project.config['MYSQL_PORT'] = 3306
db_obj = MySQL(project)



@project.route('/addhash', methods = ['POST'])#Create
def addhash():
    if request.method == "POST":
        plaintext = request.form['plaintext']
        md5 = request.form['md5']
        length = request.form['length']
        connect = db_obj.connection.cursor()
        connect.execute("INSERT INTO secret (plaintext, md5, length) VALUES (%s, %s, %s)", (plaintext, md5, length))
        db_obj.connection.commit()

        return redirect(url_for('index'))


@project.route('/')#Retrieve
def index():
    connect = db_obj.connection.cursor()
    connect.execute("SELECT  * FROM secret")
    passwords = connect.fetchall()
    connect.close()

    return render_template('index.html', secrets=passwords )


@project.route('/update',methods=['POST'])#Update
def update():

    if request.method == 'POST':
        idn = request.form['id']
        plaintext = request.form['plaintext']
        md5 = request.form['md5']
        length = request.form['length']
        connect = db_obj.connection.cursor()
        connect.execute("""
               UPDATE secret
               SET plaintext=%s, md5=%s, length=%s
               WHERE id=%s
            """, (plaintext, md5, length, idn))
        db_obj.connection.commit()
        return redirect(url_for('index'))


@project.route('/delete', methods = ['POST'])#Delete
def delete():
    if request.method == "POST":
        idn = request.form['id']
        connect = db_obj.connection.cursor()
        connect.execute("DELETE FROM secret WHERE id=%s", (idn,))
        db_obj.connection.commit()

        return redirect(url_for('index'))


if __name__ == "__main__":
    project.run(debug=True)
