# autor.py CORREGIDO
from sqlalchemy import Column, Integer, String, Table, ForeignKey  # ← AGREGADO ForeignKey
from sqlalchemy.orm import relationship
from ..database import Base

# Tabla de asociación (SQLAlchemy la manejará automáticamente)
autores_libros = Table(
    'autores_libros',
    Base.metadata,
    Column('id_autor', Integer, ForeignKey('autores.id_autor'), primary_key=True),
    Column('id_libro', Integer, ForeignKey('libros.id_libro'), primary_key=True)
)

class Autor(Base):
    __tablename__ = "autores"

    id_autor = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(100))
    nacionalidad = Column(String(100))

    # Relación many-to-many simple
    libros = relationship("Libro", secondary=autores_libros, back_populates="autores")
