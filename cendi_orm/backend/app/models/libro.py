# libro.py CORREGIDO
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from ..database import Base
from .autor import autores_libros  # ← AGREGADO: importar la tabla

class Libro(Base):
    __tablename__ = "libros"

    id_libro = Column(Integer, primary_key=True, index=True)
    titulo = Column(String(120))
    anio_publicacion = Column(Integer)
    num_paginas = Column(Integer)
    id_editorial = Column(Integer, ForeignKey("editoriales.id_editorial"))

    # Relaciones
    editorial = relationship("Editorial", back_populates="libros")
    autores = relationship("Autor", secondary=autores_libros, back_populates="libros")
    prestamos = relationship("Prestamo", back_populates="libro")


