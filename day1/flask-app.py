import http.server
import socketserver
import platform

PORT = 5000

class InfoHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/info":
            self.send_response(200)
            self.send_header("Content-type", "text/html; charset=utf-8")
            self.end_headers()
            
            python_version = platform.python_version()
            app_info = f"""
            <!DOCTYPE html>
            <html>
            <head><title>Informacje o aplikacji</title></head>
            <body>
                <h1>Informacje o aplikacji</h1>
                <p>To jest prosta aplikacja serwerowa napisana w Pythonie bez użycia frameworków.</p>
                <p>Wersja Pythona: {python_version}</p>
                <p>Ścieżka: <code>/info</code></p>
            </body>
            </html>
            """
            self.wfile.write(app_info.encode("utf-8"))
        else:
            self.send_error(404, "Strona nie znaleziona")

with socketserver.TCPServer(("", PORT), InfoHandler) as httpd:
    print(f"Serwer działa na porcie {PORT}")
    httpd.serve_forever()
