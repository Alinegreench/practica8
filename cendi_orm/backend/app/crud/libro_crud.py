# libro_crud.py UNIFICADO
from sqlalchemy.orm import Session
from app import models, schemas

def get_libros(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Libro).offset(skip).limit(limit).all()

def create_libro(db: Session, libro: schemas.LibroCreate):
    db_libro = models.Libro(**libro.model_dump())  # Pydantic v2
    db.add(db_libro)
    db.commit()
    db.refresh(db_libro)
    return db_libro

def get_libro(db: Session, libro_id: int):
    return db.query(models.Libro).filter(models.Libro.id_libro == libro_id).first()

# ==========================================