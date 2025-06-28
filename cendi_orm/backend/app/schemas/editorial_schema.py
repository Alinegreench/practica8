# editorial_schema.py CORREGIDO (quitar id_libro que no existe)
from typing import Optional, List
from pydantic import BaseModel

class EditorialBase(BaseModel):
    nombre_editorial: str
    direccion: str
    telefono: str

class EditorialCreate(EditorialBase):
    pass  # CORREGIDO: quitar id_libro

class Editorial(EditorialBase):
    id_editorial: int
    # CORREGIDO: quitar id_libro que no existe en el modelo
    # Incluir relaciones si las necesitas
    # libros: Optional[List["Libro"]] = []

    class Config:
        from_attributes = True  # Consistencia con Pydantic v2
