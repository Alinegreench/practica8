# alumno_schema.py ACTUALIZADO (para consistencia)
from pydantic import BaseModel
from typing import Optional, List

class AlumnoBase(BaseModel):
    nombre: str
    ap_paterno: str
    ap_materno: str
    escuela: str
    ciclo_escolar: str

class AlumnoCreate(AlumnoBase):
    pass

class Alumno(AlumnoBase):
    id_alumno: int
    # prestamos: Optional[List["Prestamo"]] = []

    class Config:
        from_attributes = True  # Consistencia con Pydantic v2
