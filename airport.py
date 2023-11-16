from whitenoise import WhiteNoise
import os
from waitress import serve
from apiwsgi import Wsgiclass
from jinja2 import Environment, FileSystemLoader
import mysql.connector

#waitress-serve --listen=127.0.0.1:8000 airport:app
#env\Scripts\activate 

conexion = mysql.connector.connect(
    user='root',
    password='MsQl2003',
    host='localhost',
    database='aeropuerto',
    port=3306,
    auth_plugin='mysql_native_password'
)
micursor = conexion.cursor()

app = Wsgiclass()

template_dir = os.path.join(os.path.dirname(__file__), 'templates')
env = Environment(loader=FileSystemLoader(template_dir))

@app.ruta("/")
def index(request, response):
    template= env.get_template('blog.html')
    rendered_html = template.render()
    response.text = rendered_html
    return response

#@app.ruta("/hola")
#def hola(request, response):
    #template= env.get_template('holahtml.html')
    #rendered_html = template.render(nombre = "Gabi")
    #response.text = rendered_html
    #return response

#@app.ruta("/logo")
#def logo(request, response):
    #template= env.get_template('home.html')
    #rendered_html = template.render()
    #response.text = rendered_html
    #return response

@app.ruta('/aviones')
def aviones(request, response):
    micursor.execute("""
    SELECT v.id AS 'Id de Vuelo',
           v.num_vuelo AS 'Número de Vuelo',
           v.destino AS 'Destino',
           v.fecha_salida AS 'Fecha de Salida',
           v.fecha_llegada AS 'Fecha de Llegada',
           v.escalas AS 'Escalas',
           ao.nombre AS 'Aeropuerto de Origen',
           ao.ciudad AS 'Ciudad de Origen',
           a.nombre AS 'Aerolínea'
    FROM vuelos v
    JOIN aeropuerto ao ON v.aeropuerto_origen = ao.id
    JOIN aerolinea a ON v.aerolinea_perteneciente = a.id
    ORDER BY v.id ASC;
    """)
    
    resultados = micursor.fetchall()

    template= env.get_template('aviones.html')
    rendered_html = template.render(cursor1=resultados)
    response.text = rendered_html
    return response

@app.ruta("/pasj_reg")
def logo(request, response):
    template= env.get_template('pasj_reg.html')
    rendered_html = template.render()
    response.text = rendered_html
    return response

if __name__ == '__main__':
    app=WhiteNoise(app, root='static/')
    serve(app ,listen = 'localhost:8000')
