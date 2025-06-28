# autor_schema.py CORREGIDO (debe coincidir con el modelo)
from pydantic import BaseModel
from typing import List, Optional

class AutorBase(BaseModel):
    nombre: str
    nacionalidad: str

class AutorCreate(AutorBase):
    pass

class Autor(AutorBase):
    id_autor: int
    # Incluir relaciones si las necesitas en responses
    # libros: Optional[List["Libro"]] = []

    class Config:
        from_attributes = True  # Pydantic v2