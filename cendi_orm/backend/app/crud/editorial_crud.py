# editorial_crud.py CORREGIDO (eliminar id_libro)
from sqlalchemy.orm import Session
from app import models, schemas

def get_editoriales(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Editorial).offset(skip).limit(limit).all()

def get_editorial(db: Session, editorial_id: int):
    return db.query(models.Editorial).filter(models.Editorial.id_editorial == editorial_id).first()

def create_editorial(db: Session, editorial: schemas.EditorialCreate):
    # CORREGIDO: eliminar id_libro que no existe en el modelo
    db_editorial = models.Editorial(
        nombre_editorial=editorial.nombre_editorial,
        direccion=editorial.direccion,
        telefono=editorial.telefono
        # ELIMINAR: id_libro=editorial.id_libro
    )
    db.add(db_editorial)
    db.commit()
    db.refresh(db_editorial)
    return db_editorial