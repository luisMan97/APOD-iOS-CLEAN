# APOD-iOS-CLEAN

## Installation
Run git clone to download proyect

```ruby
git clone https://github.com/luisMan97/APOD-iOS-CLEAN.git
```

#### Third Party Libraries
The project does not use third party libraries. Don't cocoapods, don't cartage, don't worry :)

#### Funcionalidades
- La pantalla principal cuenta con una listado de los últimos 8 APOD (Astronomy Picture of the Day) de la API publica de la NASA.
- La pantalla principal cuenta con una vista desplegable en la sección superior que permite realizar una busqueda de la imagen del día seleccionando determinada fecha.
- Cuando se selecciona un APOD se va al detalle del APOD.
- Se muestra mensaje de error cuando el servicio falla o no hay conexión a internet.
- Hay una modal de loading que se muestra cada vez que se hace la petición al servicio web.

#### Funcionalidades técnicas:
- La aplicación está desarrollada en Swift 5, con SwiftUI y Combine.
- La aplicación tiene cómo arquitectura un tipo de MVVM extendido (CLEAN Architecture).
- La aplicación usa programación reactiva.
- La aplicación implementa diferentes patrones de diseño (Repository, Builder entre otros).
- La aplicación no usa librerías de terceros.
- La aplicación usa una capa genérica y extensible con URLSession para hacer los llamados a los servicios.  
- La aplicación usa Codable para el mapeo de JSON a objetos. 
- La aplicación contiene un .gitignore para no subir archivos innecesarios.

#### Arquitectura
Se implementó CLEAN como arquitectura, con las siguientes capas:
1) View: Contiene las View de SwiftUI
2) Presentation: Contiene los ViewModels
3) Interactor/UseCases: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Entity/Domain: Contiene las entidades
5) Data: Contiene el patrón repository para obtener los datos ya sea de una API o una base de datos local
6) Framework: Contiene la implementación a más detalle de la obtención de datos usando ya la respectiva librería o framework (Alamofire, URLSession, CoreData y etc)
