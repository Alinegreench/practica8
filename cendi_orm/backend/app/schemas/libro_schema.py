# libro_schema.py CORREGIDO (debe incluir id_editorial)
from pydantic import BaseModel
from typing import Optional, List

class LibroBase(BaseModel):
    titulo: str
    anio_publicacion: Optional[int] = None
    num_paginas: Optional[int] = None
    id_editorial: int  # AGREGADO: Campo obligatorio

class LibroCreate(LibroBase):
    pass

class Libro(LibroBase):
    id_libro: int
    # Incluir relaciones si las necesitas en responses
    # editorial: Optional["Editorial"] = None
    # autores: Optional[List["Autor"]] = []

    class Config:
        from_attributes = True  # Consistencia con Pydantic v2