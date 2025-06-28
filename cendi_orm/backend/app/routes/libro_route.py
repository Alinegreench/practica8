# libro_route.py UNIFICADO
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app import schemas, crud
from app.database import SessionLocal

router = APIRouter(prefix="/libros", tags=["Libros"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[schemas.Libro])
def read_libros(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return crud.get_libros(db, skip=skip, limit=limit)

@router.post("/", response_model=schemas.Libro)
def create_libro(libro: schemas.LibroCreate, db: Session = Depends(get_db)):
    return crud.create_libro(db, libro)