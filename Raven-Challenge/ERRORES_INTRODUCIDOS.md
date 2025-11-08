# � DOCUMENTO CONFIDENCIAL - Solo para Evaluadores

# 🐛 Guía de Errores Introducidos - Challenge de Debugging

⚠️ **NOTA IMPORTANTE**: Este documento es **solo para referencia del evaluador**. NO compartir con candidatos.

---

## 📊 Resumen Ejecutivo

**Total de errores introducidos**: 27 errores distribuidos en 5 categorías

- **Errores de Sintaxis**: 7 errores (Nivel Junior)
- **Errores de Variables/Propiedades**: 4 errores (Nivel Junior-Mid)
- **Errores Lógicos**: 4 errores (Nivel Mid)
- **Errores de SwiftData/Persistencia**: 5 errores (Nivel Mid-Senior)
- **Memory Leaks/Retain Cycles**: 7 errores (Nivel Senior)

---

## 📋 Categorías de Errores (Sin ubicaciones específicas)

### 🔴 1. Errores de Sintaxis (7 errores)

Estos errores impiden la compilación del proyecto:

- **Arrays y diccionarios mal cerrados**: Falta cerrar corchetes en definiciones de configuración
- **Strings incompletos**: Comillas de cierre faltantes en CodingKeys y strings
- **Paréntesis sin cerrar**: Múltiples instancias de llamadas a funciones incompletas
- **Estructuras mal formadas**: Llaves faltantes en cierres de bloques de código
- **Inicializadores incompletos**: Parámetros de inicialización sin cerrar

**Archivos afectados**: RavenTestApp, SplashModel, ArticleRow, ArticleDetailView, HomeView, SplashView, HomeUseCase

---

### 🟡 2. Errores de Variables y Propiedades (4 errores)

Errores que causan crashes en runtime:

- **Typos en nombres**: Variables con nombres similares pero incorrectos (ej: "titel" vs "title")
- **Propiedades inexistentes**: Referencias a propiedades que no existen en el modelo
- **CamelCase incorrecto**: Errores sutiles en capitalización de propiedades
- **Asignaciones incorrectas**: Intentos de asignar valores a propiedades que no existen

**Archivos afectados**: HomeModel, HomeViewModel, ArticleRow, ArticleDetailView

---

### 🟠 3. Errores Lógicos (4 errores)

Errores que rompen la funcionalidad de la app:

- **Condiciones booleanas invertidas**: Lógica que hace exactamente lo contrario de lo esperado
- **Validaciones incorrectas**: Rangos de validación que excluyen casos válidos
- **Métodos HTTP erróneos**: Uso de verbos HTTP incorrectos para operaciones REST
- **Asignaciones de estado incorrectas**: Estados que se setean al revés

**Archivos afectados**: SplashViewModel, SplashUseCase, RequestBaseManager, SplashRepository

---

### 🟣 4. Errores de SwiftData/Persistencia (5 errores)

Problemas con la capa de persistencia:

- **Context.save() faltante**: Operaciones que no se persisten porque falta guardar el contexto
- **Return statements faltantes**: Funciones que no retornan valores cuando deberían
- **Inserciones duplicadas**: Entidades insertadas múltiples veces en el contexto
- **Threading incorrecto**: ModelContext usado desde threads incorrectos
- **Relaciones sin configurar**: Arrays de relaciones sin configuración apropiada

**Archivos afectados**: HomeModel, SplashUseCase

---

### 🔵 5. Memory Leaks y Retain Cycles (7 errores)

Problemas avanzados de gestión de memoria:

- **Closures con retain cycles**: Múltiples closures que capturan self fuertemente
- **Timers no invalidados**: Timers que mantienen referencias fuertes
- **Task.detached sin weak self**: Tasks que capturan self sin gestión apropiada
- **Arrays que crecen indefinidamente**: Colecciones que acumulan datos sin límite
- **Context saves duplicados**: Operaciones redundantes de guardado
- **Referencias fuertes a contexts**: ModelContext almacenado fuertemente cuando no debería
- **Callbacks con referencias fuertes**: Handlers que crean ciclos de retención

**Archivos afectados**: SplashViewModel, SplashUseCase, NetworkMonitor, CacheManager, SplashRepository

---

## 🎯 Distribución por Nivel de Dificultad

### Junior (7 errores)
Errores de sintaxis obvios que el compilador detecta inmediatamente. Cualquier desarrollador junior debería poder identificarlos y corregirlos siguiendo los mensajes del compilador.

### Mid-Level (8 errores)
Errores de variables y lógica que requieren entender el flujo de la aplicación y el modelo de datos. Requieren debugging activo y comprensión del código.

### Senior (12 errores)
Errores de persistencia, threading y memory management que requieren conocimiento profundo de SwiftData, concurrencia y gestión de memoria en Swift.

---

## 🔍 Estrategia de Evaluación

### Criterios de Evaluación por Nivel

**Para candidatos Junior:**
- ¿Puede identificar todos los errores de sintaxis?
- ¿Cuánto tiempo tarda en hacer que el proyecto compile?
- ¿Entiende los mensajes del compilador?

**Para candidatos Mid-Level:**
- ¿Identifica errores de variables y lógica rápidamente?
- ¿Usa el debugger efectivamente?
- ¿Prueba la funcionalidad metódicamente?

**Para candidatos Senior:**
- ¿Detecta los memory leaks sin usar Instruments?
- ¿Identifica problemas de threading con SwiftData?
- ¿Entiende las implicaciones de cada error?
- ¿Propone mejoras adicionales?

---

## 📝 Notas para el Evaluador

### Red Flags 🚩

- Candidato que corrige solo errores de compilación y considera el trabajo completo
- No prueba la funcionalidad de la app después de corregir
- No usa herramientas de debugging (breakpoints, console, Instruments)
- Corrige errores creando más problemas
- No documenta qué encontró y cómo lo corrigió

### Señales Positivas ✅

- Enfoque sistemático (sintaxis → runtime → lógica → memoria)
- Uso efectivo de herramientas de debugging
- Pruebas exhaustivas después de cada corrección
- Documentación clara de los cambios
- Propone mejoras adicionales al código
- Hace commits organizados por tipo de error

---

## ⏱️ Tiempos de Referencia

Basado en nivel de experiencia:

- **Junior**: 3-4 horas (debería encontrar al menos 11 errores)
- **Mid-Level**: 2-3 horas (debería encontrar al menos 19 errores)
- **Senior**: 1-2 horas (debería encontrar los 27 errores)

---

## 🎓 Qué Evaluar Específicamente

### Habilidades Técnicas
- [ ] Comprensión de sintaxis de Swift
- [ ] Debugging con Xcode
- [ ] Conocimiento de SwiftUI
- [ ] Manejo de SwiftData
- [ ] Gestión de memoria (ARC, retain cycles)
- [ ] Concurrencia en Swift (async/await, Task)
- [ ] Arquitectura limpia

### Habilidades Blandas
- [ ] Atención al detalle
- [ ] Metodología de trabajo
- [ ] Capacidad de documentación
- [ ] Comunicación de hallazgos
- [ ] Pensamiento crítico

---

## 📌 Instrucciones de Uso

1. **Antes del challenge**: No mostrar este documento al candidato
2. **Durante el challenge**: Observar el enfoque y metodología del candidato
3. **Después del challenge**: Usar este documento para verificar qué errores encontró
4. **En la revisión**: Discutir los errores que no encontró y por qué

---

**Creado para**: Proceso de evaluación técnica de desarrolladores iOS  
**Versión**: 1.0  
**Fecha**: Noviembre 2025

---

### 2. **Errores de Variables/Propiedades**

#### HomeModel.swift
- **Línea ~18**: Variable mal nombrada en el init
  ```swift
  self.title = titel  // Variable incorrecta
  // Debería ser: self.title = title
  ```

#### HomeViewModel.swift
- **Línea ~18**: Propiedad inexistente `datas`
  ```swift
  self.datas = data  // datas no existe
  // Debería ser: self.data = data
  ```

#### ArticleRow.swift
- **Línea ~14**: Propiedad `imageUrl` no existe (es `imageURL`)
  ```swift
  if let url = URL(string: article.imageUrl)
  // Debería ser: article.imageURL
  ```

#### ArticleDetailView.swift
- **Línea ~33**: Propiedad `titel` no existe (es `title`)
  ```swift
  Text(article.titel)
  // Debería ser: Text(article.title)
  ```

---

### 3. **Errores Lógicos**

#### SplashViewModel.swift
- **Línea ~23**: Lógica invertida - asigna `false` en lugar de `true`
  ```swift
  isLoaded = false  // Debería ser true cuando carga exitosamente
  // Debería ser: isLoaded = true
  ```

#### SplashUseCase.swift (saveArticles)
- **Línea ~50**: Condición invertida - omite artículos nuevos en lugar de duplicados
  ```swift
  if existing.isEmpty { continue }  // Lógica invertida
  // Debería ser: if !existing.isEmpty { continue }
  ```

#### SplashUseCase.swift (loadArticles)
- **Línea ~36**: Condición invertida - retorna cuando está vacío en lugar de cuando tiene datos
  ```swift
  if local.isEmpty { return local }  // Lógica invertida
  // Debería ser: if !local.isEmpty { return local }
  ```

#### RequestBaseManager.swift
- **Línea ~30**: Rango de códigos HTTP incorrecto (300-400 son redirecciones, no éxitos)
  ```swift
  (300..<400).contains(httpResponse.statusCode)
  // Debería ser: (200..<300).contains(httpResponse.statusCode)
  ```

---

### 4. **Errores de Configuración/API**

#### SplashRepository.swift
- **Línea ~25**: Método HTTP incorrecto - usa POST en lugar de GET
  ```swift
  method: .POST
  // Debería ser: method: .GET
  ```

---

## 🎯 Objetivo del Challenge

El candidato debe:
1. ✅ Identificar y corregir todos los errores de sintaxis que impiden la compilación
2. ✅ Encontrar y corregir los errores de propiedades que causan crashes en runtime
3. ✅ Detectar y arreglar los errores lógicos que rompen la funcionalidad
4. ✅ Asegurar que la app compile y funcione correctamente

---

## 5. **Errores de SwiftData / Persistencia**

#### HomeModel.swift
- **Línea ~20**: Propiedad array bidireccional sin configuración adecuada
  ```swift
  var relatedArticles: [ArticleEntity] = []
  // Puede causar problemas de relaciones circulares en SwiftData
  // Falta configurar la relación apropiadamente
  ```

- **Línea ~39-41**: Entidad insertada dos veces en el contexto
  ```swift
  context.insert(entity)
  context.insert(entity)  // ERROR: Inserción duplicada
  // Debería insertarse solo una vez
  ```

#### SplashUseCase.swift
- **Línea ~45**: Falta `context.save()` - los datos no se persisten
  ```swift
  context.insert(entity)
  }
  // No se llama context.save() - error de persistencia
  // Debería tener: try context.save()
  ```

- **Línea ~49**: Falta retorno en `fetchSavedArticles`
  ```swift
  try context.fetch(descriptor)
  // Falta: return try context.fetch(descriptor)
  ```

- **Línea ~25-31**: Operación de SwiftData en thread incorrecto
  ```swift
  Task.detached {
      try? await self.saveArticles(articles)  // ERROR: Context usado en otro thread
  }
  // ModelContext debe usarse en el actor/thread donde fue creado
  ```

---

## 6. **Memory Leaks / Retain Cycles**

#### SplashViewModel.swift
- **Línea ~28-32**: Retain cycle en closure
  ```swift
  dataLoadedHandler = {
      self.handleDataLoaded()  // ERROR: self capturado fuertemente
  }
  // Debería ser: dataLoadedHandler = { [weak self] in
  //                self?.handleDataLoaded()
  //              }
  ```

#### SplashUseCase.swift
- **Línea ~27-30**: Retain cycle en Task.detached
  ```swift
  Task.detached {
      try? await self.saveArticles(articles)  // ERROR: self capturado fuertemente
      self.onArticlesSaved?()
  }
  // Debería capturar con [weak self]
  ```

#### NetworkMonitor.swift (Archivo nuevo)
- **Línea ~22-27**: Retain cycle en pathUpdateHandler
  ```swift
  monitor.pathUpdateHandler = { path in
      self.onNetworkChange?(isConnected)  // ERROR: self capturado fuertemente
      self.handleNetworkChange(isConnected: isConnected)
  }
  // Debería usar [weak self]
  ```

#### CacheManager.swift (Archivo nuevo)
- **Línea ~25-30**: Timer retiene self fuertemente
  ```swift
  cleanupTimer = Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { timer in
      self.clearOldCache()  // ERROR: self capturado fuertemente
      self.onCacheCleared?()
  }
  // Timer debe invalidarse en deinit, pero deinit nunca se llama por el retain cycle
  // Debería usar [weak self]
  ```

- **Línea ~41-42**: Context save duplicado innecesario
  ```swift
  try context.save()
  try context.save() // Save duplicado - desperdicio de recursos
  ```

- **Línea ~18**: Mantener referencia fuerte a ModelContext
  ```swift
  private var context: ModelContext
  // Puede causar problemas, considera usar weak o pasar context como parámetro
  ```

#### SplashRepository.swift
- **Línea ~18**: Array que crece indefinidamente
  ```swift
  private var cachedResponses: [NYTResponse] = []
  ```
  
- **Línea ~33**: Acumulación infinita en memoria
  ```swift
  cachedResponses.append(response)
  // Nunca se limpia, causando memory leak al acumular todas las respuestas
  ```

---

## 📊 Resumen de Errores

- **Errores de Sintaxis**: 7 errores
- **Errores de Variables/Propiedades**: 4 errores
- **Errores Lógicos**: 4 errores
- **Errores de Configuración**: 1 error
- **Errores de SwiftData/Persistencia**: 5 errores
- **Memory Leaks/Retain Cycles**: 6 errores

**Total**: 27 errores introducidos

---

## 💡 Consejos para el Candidato

1. ✅ Comienza arreglando los errores de compilación (sintaxis)
2. ✅ Lee los mensajes de error del compilador cuidadosamente
3. ✅ Usa el debugger para identificar errores de runtime
4. ✅ Prueba la funcionalidad completa después de cada corrección
5. ✅ Verifica que la API esté respondiendo correctamente
6. ✅ Usa Instruments para detectar memory leaks
7. ✅ Verifica que los datos se persistan correctamente con SwiftData
8. ✅ Revisa todos los closures para asegurar [weak self] o [unowned self] donde sea necesario
9. ✅ Valida el uso correcto de ModelContext en el actor/thread apropiado

---

## 🎓 Nivel de Dificultad

- **Junior**: Errores de sintaxis (7)
- **Mid-Level**: Errores de variables y lógica básica (8)
- **Senior**: Errores de persistencia, memory leaks y threading (11)
