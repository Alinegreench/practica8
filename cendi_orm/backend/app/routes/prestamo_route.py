from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import schemas, crud
from app.database import SessionLocal

router = APIRouter(prefix="/prestamos", tags=["Prestamos"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[schemas.Prestamo])
def read_prestamos(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return crud.get_prestamos(db, skip=skip, limit=limit)

@router.post("/", response_model=schemas.Prestamo)
def create_prestamo(prestamo: schemas.PrestamoCreate, db: Session = Depends(get_db)):
    return crud.create_prestamo(db, prestamo)
