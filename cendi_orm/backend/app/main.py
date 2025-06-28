from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.database import engine
from app.database import Base
from app.routes.autor_route import router as autor_router
from app.routes.libro_route import router as libro_router
from app.routes.editorial_route import router as editorial_router
from app.routes.alumno_route import router as alumno_router
from app.routes.prestamo_route import router as prestamo_router

Base.metadata.create_all(bind=engine)

app = FastAPI(title="API Biblioteca CENDI")

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite todos los orígenes
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos los métodos (GET, POST, etc.)
    allow_headers=["*"],  # Permite todos los headers
)

app.include_router(autor_router)
app.include_router(libro_router)
app.include_router(editorial_router)
app.include_router(alumno_router)
app.include_router(prestamo_router)

@app.get("/")
def read_root():
    return {"message": "API Biblioteca CENDI funcionando correctamente"}

@app.get("/health")
def health_check():
    return {"status": "healthy", "database": "connected"}