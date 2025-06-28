from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app import schemas, crud
from app.database import SessionLocal

router = APIRouter(prefix="/editoriales", tags=["Editoriales"])

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=list[schemas.Editorial])
def read_editoriales(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return crud.get_editoriales(db, skip=skip, limit=limit)

@router.get("/{editorial_id}", response_model=schemas.Editorial)
def read_editorial(editorial_id: int, db: Session = Depends(get_db)):
    editorial = crud.get_editorial(db, editorial_id=editorial_id)
    if editorial is None:
        raise HTTPException(status_code=404, detail="Editorial no encontrada")
    return editorial

@router.post("/", response_model=schemas.Editorial)
def create_editorial(editorial: schemas.EditorialCreate, db: Session = Depends(get_db)):
    return crud.create_editorial(db, editorial)
