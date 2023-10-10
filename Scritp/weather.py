import requests
from jinja2 import Environment


def estado_cielo(estado_cielo):
  """
  Traduce el estado del cielo de la API de OpenWeatherMap.

  Args:
    estado_cielo: El estado del cielo en inglés.

  Returns:
    El estado del cielo en español.
  """
  estados_cielo = {
    "clear": "Despejado",
    "clouds": "Nublado",
    "rain": "Lluvioso",
    "snow": "Nevado",
    "sleet": "Lluvia helada",
    "thunderstorm": "Tormentas eléctricas",
  }

  return estados_cielo[estado_cielo]

def clima():

    city = input("Ingrese su ciudad:")

    url = 'http://api.openweathermap.org/data/2.5/weather?q={}&appid=aqui_token&units=metric'.format(city)

    res = requests.get(url)
    data = res.json()

    # Obtiene la temperatura actual en grados Celsius
    temperature_in_celsius = data["main"]["temp"]

    # Obtiene el estado del cielo
    weather = data["weather"][0]["main"]

    # "Traduccion" estado cielo

    # Traduce el estado del cielo al español
    weather_en_espanol = estado_cielo(weather.lower() )

    # Crea un entorno Jinja2
    env = Environment()

    # Carga la plantilla HTML
    template = env.from_string("""
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <title>Clima </title>
        <style>
            h1 {
                font-family: sans-serif;
                font-size: 20px;
                color: #0099CC;
            }
            p {
                font-family: sans-serif;
                font-size: 16px;
                color: #00CC99;
            }
        </style>
    </head>
    <body>
        <h1>Clima en {{city}}</h1>
        <p>La temperatura actual es de {{ temperature_in_celsius }} grados Celsius.</p>
        <p>El estado del cielo es {{ weather_en_espanol }}.</p>
    </body>
    </html>
    """)

    # Renderiza la plantilla HTML con los datos
    html = template.render(city=city, temperature_in_celsius=temperature_in_celsius, weather_en_espanol=weather_en_espanol)

    # Guarda el archivo HTML
    with open("weather.html", "w") as f:
        f.write(html)

    # Documenta el script y muestra cómo ejecutarlo
    print("Ejecuta el script con el siguiente comando:")
    print("python weather.py")

clima()
