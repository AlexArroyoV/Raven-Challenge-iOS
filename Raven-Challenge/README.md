# 🐛 iOS Developer Challenge - Debug & Fix

## 📱 Descripción del Proyecto

Aplicación iOS desarrollada en **SwiftUI** que consume la API del **New York Times** para mostrar los artículos más populares. La app implementa arquitectura limpia, persistencia con SwiftData, y manejo de errores.

### Stack Tecnológico
- Swift 5.0+
- SwiftUI
- SwiftData (Persistencia)
- Async/Await
- MVVM + Clean Architecture
- Xcode 16.1
- iOS 18.1+

---

## 🎯 El Challenge

Esta aplicación **tiene errores intencionados** que debes identificar y corregir. El código está "roto" y no compila ni funciona correctamente.

### Tu Objetivo
Hacer que la aplicación funcione **completamente** corrigiendo todos los errores encontrados.

---

## 📋 Categorías de Errores

La aplicación contiene errores en las siguientes categorías:

### 🔴 Nivel 1: Errores de Compilación
- Errores de sintaxis que impiden que el proyecto compile
- Paréntesis, corchetes o comillas faltantes
- Estructuras de código mal formadas

### 🟡 Nivel 2: Errores de Runtime
- Variables mal nombradas o inexistentes
- Propiedades que no coinciden con las definidas
- Tipos de datos incorrectos

### 🟠 Nivel 3: Errores Lógicos
- Condiciones invertidas
- Métodos HTTP incorrectos
- Validaciones defectuosas
- Asignaciones incorrectas

### 🟣 Nivel 4: Errores de Persistencia
- Problemas con SwiftData
- Contextos no guardados
- Operaciones de base de datos incompletas
- Threading incorrecto con ModelContext

### 🔵 Nivel 5: Memory Management
- Retain cycles en closures
- Memory leaks
- Referencias fuertes que deberían ser débiles
- Recursos no liberados correctamente

---

## 🚀 Comenzar el Challenge

### 1. Setup del Proyecto

```bash
# Navega al directorio del proyecto
cd RavenTest

# Abre el proyecto en Xcode
open RavenTest.xcodeproj
```

### 2. Primera Fase: Compilación

```bash
# Intenta compilar el proyecto
⌘ + B
```

**Verás errores de compilación** - Este es tu primer desafío. Revisa cuidadosamente:
- Errores de sintaxis
- Estructuras mal cerradas
- Strings mal formados

### 3. Segunda Fase: Ejecución

Una vez que compile, intenta ejecutar la app:

```bash
⌘ + R
```

**La app probablemente crasheará** - Revisa:
- Variables mal nombradas
- Propiedades inexistentes
- Referencias incorrectas

### 4. Tercera Fase: Funcionalidad

Si la app corre sin crashes, prueba la funcionalidad:

- ¿Se cargan los artículos del NY Times?
- ¿Funciona el modo offline (persistencia)?
- ¿La navegación funciona correctamente?
- ¿Los datos se muestran apropiadamente?

### 5. Cuarta Fase: Performance & Memory

Usa **Instruments** para detectar:

```bash
⌘ + I → Selecciona "Leaks"
```

- Memory leaks
- Retain cycles
- Recursos no liberados

---

## 📂 Estructura del Proyecto

```
RavenTest/
├── RavenTestApp.swift          # Entry point
├── Common/
│   ├── RequestBaseManager.swift # Networking
│   ├── NetworkMonitor.swift     # Network monitoring
│   └── CacheManager.swift       # Cache management
├── Scenes/
│   ├── Home/
│   │   ├── HomeModel.swift      # Data models
│   │   ├── HomeViewModel.swift  # Business logic
│   │   ├── HomeUseCase.swift    # Use cases
│   │   ├── HomeRepository.swift # Data repository
│   │   └── View/
│   │       ├── HomeView.swift
│   │       ├── ArticleRow.swift
│   │       └── ArticleDetailView.swift
│   └── Splash/
│       ├── SplashModel.swift
│       ├── SplashViewModel.swift
│       ├── SplashUseCase.swift
│       ├── SplashRepository.swift
│       └── SplashView.swift
```

---

## 🔍 Áreas Clave a Revisar

### Sintaxis y Estructura
- Revisa todos los archivos en busca de **sintaxis incorrecta**
- Verifica que todas las estructuras estén **correctamente cerradas**
- Busca **comillas, paréntesis o corchetes** faltantes

### Variables y Propiedades
- Algunos nombres de propiedades están **mal escritos** (typos)
- Verifica que las propiedades **existan** en los modelos
- Asegúrate de que las **asignaciones** sean correctas

### Lógica de Negocio
- Revisa las **condiciones** (algunas pueden estar invertidas)
- Verifica los **rangos de validación**
- Comprueba los **métodos HTTP** utilizados
- Valida las **operaciones booleanas**

### SwiftData
- ¿Se están **guardando** los datos correctamente?
- ¿El **ModelContext** se usa en el thread correcto?
- ¿Las operaciones de fetch están **completas**?
- ¿Hay operaciones **duplicadas** o innecesarias?

### Memory Management
- Busca closures que capturen `self` sin `[weak self]` o `[unowned self]`
- Identifica **Timers** o **listeners** que no se invaliden
- Revisa **arrays** o colecciones que crezcan indefinidamente
- Detecta **retain cycles** en callbacks

---

## ✅ Criterios de Éxito

Tu solución estará completa cuando:

1. ✅ **El proyecto compile sin errores**
2. ✅ **La aplicación inicie correctamente**
3. ✅ **Los artículos se carguen desde la API**
4. ✅ **La persistencia funcione** (prueba modo avión)
5. ✅ **La navegación sea fluida**
6. ✅ **No existan crashes**
7. ✅ **No haya memory leaks** (verificado con Instruments)
8. ✅ **El código sea limpio y mantenible**

---

## 🛠️ Herramientas Recomendadas

### Debugging
- **Xcode Debugger** - Para inspeccionar variables y flujo
- **Breakpoints** - Para pausar la ejecución
- **Console Log** - Para ver mensajes de error

### Performance
- **Instruments - Leaks** - Para detectar memory leaks
- **Instruments - Allocations** - Para ver uso de memoria
- **Network Link Conditioner** - Para simular red lenta

### SwiftData
- **SwiftData Debug** - Para ver operaciones de persistencia
- **Console Logs** - Para errores de Core Data/SwiftData

---

## 📝 Entregables

Al finalizar el challenge, debes proporcionar:

### 1. Código Corregido
- Todo el proyecto funcionando correctamente
- Commits organizados por tipo de error (opcional pero recomendado)

### 2. Documento de Errores Encontrados
Un archivo markdown listando:
- Descripción de cada error encontrado
- Archivo y línea donde estaba
- Tipo de error (sintaxis, lógica, memoria, etc.)
- Cómo lo corregiste

### 3. Screenshots
- App en estado inicial (Splash)
- Lista de artículos cargados
- Vista de detalle de un artículo
- (Opcional) Instruments mostrando sin leaks

### 4. Notas Adicionales (Opcional)
- Mejoras que sugerirías
- Patrones que optimizarías
- Tests que agregarías

---

## ⏱️ Tiempo Estimado

- **Nivel Junior**: 3-4 horas
- **Nivel Mid**: 2-3 horas  
- **Nivel Senior**: 1-2 horas

**Nota**: No hay límite de tiempo, tómate el que necesites para entregar una solución completa.

---

## 💡 Consejos

1. **No te apresures** - Lee los errores cuidadosamente
2. **Compila frecuentemente** - Corrige en pequeños incrementos
3. **Prueba después de cada fix** - Verifica que no rompiste nada más
4. **Usa git** - Haz commits después de cada corrección importante
5. **Lee la documentación** - Si no entiendes algo, investiga
6. **Instrumenta el código** - Agrega prints temporales si es necesario
7. **Revisa dos veces** - Algunos errores son sutiles

---

## 🎓 Habilidades Evaluadas

Este challenge evalúa:

- ✅ **Debugging** - Capacidad de encontrar y corregir errores
- ✅ **Swift & SwiftUI** - Conocimiento del lenguaje y framework
- ✅ **SwiftData** - Manejo de persistencia
- ✅ **Memory Management** - Comprensión de ARC y retain cycles
- ✅ **Arquitectura** - Entendimiento de Clean Architecture
- ✅ **Atención al detalle** - Capacidad de detectar errores sutiles
- ✅ **Resolución de problemas** - Enfoque sistemático
- ✅ **Código limpio** - Calidad de las correcciones

---

## ❓ FAQs

**P: ¿Puedo agregar código nuevo?**  
R: Sí, si es necesario para corregir errores (ej: agregar `[weak self]`)

**P: ¿Puedo modificar la arquitectura?**  
R: No, mantén la estructura existente. Solo corrige los errores.

**P: ¿Puedo usar bibliotecas externas?**  
R: No, trabaja solo con el código existente.

**P: ¿Hay un API Key funcional?**  
R: Sí, la API key del NY Times está incluida y es funcional.

**P: ¿Cómo sé cuántos errores hay?**  
R: No se especifica intencionalmente. Busca hasta que todo funcione perfectamente.

**P: ¿Puedo preguntar si tengo dudas?**  
R: Intenta resolver por tu cuenta primero. Si estás realmente bloqueado, pregunta.

---

## 🚦 Cómo Empezar

### Paso 1: Clona y Abre
```bash
git clone [URL_DEL_REPO]
cd Raven-Challenge/RavenTest
open RavenTest.xcodeproj
```

### Paso 2: Intenta Compilar
```bash
⌘ + B
```

### Paso 3: Lee los Errores
Lee **cuidadosamente** cada error del compilador.

### Paso 4: Corrige Uno a Uno
No intentes arreglar todo a la vez. Ve paso a paso.

### Paso 5: Prueba
Después de cada corrección, compila y ejecuta.

### Paso 6: Documenta
Anota cada error que encuentres y cómo lo corregiste.

---

## 🎯 Buena Suerte!

Este challenge simula situaciones reales donde heredas código legacy con problemas. La capacidad de debugging y refactoring es fundamental para cualquier desarrollador iOS profesional.

**Remember**: El objetivo no es solo hacer que funcione, sino entender **por qué** estaba roto y **cómo** lo arreglaste.

---

**Happy Debugging! 🐛➡️✨**
