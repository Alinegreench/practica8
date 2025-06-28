# prestamo_schema.py ACTUALIZADO (para consistencia)
from pydantic import BaseModel
from datetime import date
from typing import Optional

class PrestamoBase(BaseModel):
    id_alumno: int
    id_libro: int
    fecha_prestamo: date
    fecha_devolucion: date

class PrestamoCreate(PrestamoBase):
    pass

class Prestamo(PrestamoBase):
    id_prestamo: int
    # alumno: Optional["Alumno"] = None
    # libro: Optional["Libro"] = None

    class Config:
        from_attributes = True  # Consistencia con Pydantic v2