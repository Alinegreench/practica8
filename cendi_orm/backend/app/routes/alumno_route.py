from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import schemas, crud
from app.database import SessionLocal

router = APIRouter(prefix="/alumnos", tags=["Alumnos"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[schemas.Alumno])
def read_alumnos(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return crud.get_alumnos(db, skip=skip, limit=limit)

@router.post("/", response_model=schemas.Alumno)
def create_alumno(alumno: schemas.AlumnoCreate, db: Session = Depends(get_db)):
    return crud.create_alumno(db, alumno)
