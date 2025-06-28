# autor_route.py UNIFICADO
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app import schemas, crud
from app.database import SessionLocal

router = APIRouter(prefix="/autores", tags=["Autores"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[schemas.Autor])
def read_autores(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return crud.get_autores(db, skip=skip, limit=limit)

@router.post("/", response_model=schemas.Autor)
def create_autor(autor: schemas.AutorCreate, db: Session = Depends(get_db)):
    return crud.create_autor(db, autor)