# prestamo_crud.py ACTUALIZADO (para Pydantic v2)
from sqlalchemy.orm import Session
from app import models, schemas

def get_prestamos(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Prestamo).offset(skip).limit(limit).all()

def create_prestamo(db: Session, prestamo: schemas.PrestamoCreate):
    db_prestamo = models.Prestamo(**prestamo.model_dump())  # Pydantic v2
    db.add(db_prestamo)
    db.commit()
    db.refresh(db_prestamo)
    return db_prestamo

def get_prestamo(db: Session, prestamo_id: int):
    return db.query(models.Prestamo).filter(models.Prestamo.id_prestamo == prestamo_id).first()