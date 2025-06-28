# autor_crud.py UNIFICADO
from sqlalchemy.orm import Session
from app import models, schemas

def get_autores(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Autor).offset(skip).limit(limit).all()

def create_autor(db: Session, autor: schemas.AutorCreate):
    db_autor = models.Autor(**autor.model_dump())  # Pydantic v2
    db.add(db_autor)
    db.commit()
    db.refresh(db_autor)
    return db_autor

def get_autor(db: Session, autor_id: int):
    return db.query(models.Autor).filter(models.Autor.id_autor == autor_id).first()
