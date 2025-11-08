# 🐛 Challenge de Debugging - iOS SwiftUI

## 📱 Descripción del Proyecto

Esta es una aplicación iOS desarrollada en SwiftUI que consume la API del New York Times para mostrar los artículos más populares. La aplicación implementa:

- ✅ Arquitectura limpia (Repository, UseCase, ViewModel)
- ✅ SwiftData para persistencia local
- ✅ Manejo de errores
- ✅ Navegación con NavigationStack
- ✅ AsyncImage para carga de imágenes

## 🎯 Objetivo del Challenge

La aplicación **contiene errores intencionados** que debes encontrar y corregir. Los errores están distribuidos en diferentes categorías:

### Tipos de Errores

1. **Errores de Sintaxis** - Impiden la compilación del proyecto
2. **Errores de Variables** - Nombres incorrectos que causan crashes
3. **Errores Lógicos** - Condiciones invertidas que rompen la funcionalidad
4. **Errores de SwiftData** - Problemas con la persistencia de datos
5. **Memory Leaks** - Retain cycles que causan fugas de memoria
6. **Errores de Threading** - Uso incorrecto de ModelContext en diferentes threads

## 🚀 Instrucciones

### 1. Setup Inicial

```bash
# Clona el repositorio
git clone [URL_DEL_REPO]

# Abre el proyecto en Xcode
open RavenTest/RavenTest.xcodeproj
```

### 2. Tu Misión

1. **Compila el proyecto** - Verás múltiples errores de compilación
2. **Corrige los errores de sintaxis** - Haz que el proyecto compile
3. **Ejecuta la app** - Identifica los errores de runtime
4. **Corrige la lógica** - Asegúrate de que la funcionalidad sea correcta
5. **Revisa memory leaks** - Usa Instruments para detectar fugas de memoria
6. **Valida la persistencia** - Asegura que SwiftData funcione correctamente

### 3. Criterios de Éxito

La aplicación estará correctamente arreglada cuando:

- ✅ El proyecto compile sin errores
- ✅ La aplicación inicie correctamente mostrando el splash screen
- ✅ Los artículos se carguen desde la API
- ✅ Los artículos se persistan con SwiftData
- ✅ La navegación funcione correctamente
- ✅ No existan memory leaks
- ✅ Los datos se muestren sin errores en modo offline

## 🔍 Áreas a Revisar

### Archivos Principales

```
RavenTest/
├── RavenTestApp.swift          ⚠️ Errores de sintaxis
├── Common/
│   ├── RequestBaseManager.swift ⚠️ Errores de lógica HTTP
│   ├── NetworkMonitor.swift     ⚠️ Retain cycles
│   └── CacheManager.swift       ⚠️ Memory leaks, SwiftData
├── Scenes/
│   ├── Home/
│   │   ├── HomeModel.swift      ⚠️ Errores de variables, SwiftData
│   │   ├── HomeViewModel.swift  ⚠️ Errores de asignación
│   │   ├── HomeUseCase.swift    ⚠️ Errores de sintaxis
│   │   └── View/
│   │       ├── HomeView.swift         ⚠️ Errores de sintaxis
│   │       ├── ArticleRow.swift       ⚠️ Errores múltiples
│   │       └── ArticleDetailView.swift ⚠️ Errores múltiples
│   └── Splash/
│       ├── SplashModel.swift        ⚠️ Errores de sintaxis
│       ├── SplashViewModel.swift    ⚠️ Errores lógicos, retain cycles
│       ├── SplashUseCase.swift      ⚠️ Errores de SwiftData, threading
│       ├── SplashRepository.swift   ⚠️ Memory leaks, método HTTP
│       └── SplashView.swift         ⚠️ Errores de sintaxis
```

## 🛠️ Herramientas Recomendadas

1. **Xcode Build Errors** - Para errores de compilación
2. **Runtime Console** - Para crashes y mensajes de error
3. **Instruments - Leaks** - Para detectar memory leaks
4. **SwiftData Debug** - Para validar persistencia
5. **Network Debug** - Para validar llamadas a la API

## 📝 Documentación

- Cada error está cuidadosamente documentado (archivo oculto para referencia)
- Los errores están categorizados por nivel de dificultad
- Algunos errores son sutiles y requieren atención al detalle

## ⏱️ Tiempo Estimado

- **Junior Developer**: 3-4 horas
- **Mid-Level Developer**: 2-3 horas
- **Senior Developer**: 1-2 horas

## 🎓 Habilidades Evaluadas

- ✅ Comprensión de Swift y SwiftUI
- ✅ Debugging y resolución de problemas
- ✅ Conocimiento de SwiftData
- ✅ Manejo de memory management
- ✅ Comprensión de arquitectura limpia
- ✅ Atención al detalle
- ✅ Uso de herramientas de desarrollo

## 📊 Evaluación

Tu solución será evaluada en:

1. **Corrección** (40%) - ¿Funcionan todas las features?
2. **Completitud** (30%) - ¿Se corrigieron todos los errores?
3. **Código Limpio** (20%) - ¿Las correcciones son elegantes?
4. **Documentación** (10%) - ¿Documentaste los cambios realizados?

## 💬 Entregables

Al finalizar, debes entregar:

1. ✅ El código corregido funcionando
2. ✅ Un documento describiendo los errores encontrados
3. ✅ Capturas de pantalla de la app funcionando
4. ✅ (Opcional) Reporte de Instruments mostrando no hay leaks

## 🚦 Getting Started

```bash
# 1. Intenta compilar
cmd + B

# 2. Lee los errores del compilador

# 3. Comienza por los errores de sintaxis

# 4. Ejecuta la app cuando compile
cmd + R

# 5. Revisa el comportamiento y logs

# 6. Usa breakpoints para debugging

# 7. Ejecuta Instruments para memory leaks
cmd + I -> Selecciona "Leaks"
```

## ❓ Preguntas Frecuentes

**P: ¿Puedo agregar código nuevo?**
R: Sí, si es necesario para corregir los errores (ej: [weak self])

**P: ¿Puedo usar bibliotecas externas?**
R: No, solo debes corregir el código existente

**P: ¿Hay un orden específico para corregir los errores?**
R: Comienza por los errores de compilación, luego runtime, luego memoria

**P: ¿Cómo sé si terminé?**
R: La app debe funcionar completamente sin crashes ni leaks

## 🤝 Buena Suerte!

Recuerda: Este challenge simula situaciones reales donde heredas código con problemas. La habilidad de debugging es crucial para cualquier desarrollador iOS.

---

**Nota**: No busques la lista de errores. Parte del challenge es identificarlos por ti mismo 😉
