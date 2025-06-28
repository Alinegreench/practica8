from sqlalchemy import Column, Integer, String, Text
from sqlalchemy.orm import relationship
from ..database import Base

class Editorial(Base):
    __tablename__ = "editoriales"

    id_editorial = Column(Integer, primary_key=True, index=True)
    nombre_editorial = Column(String(50))
    direccion = Column(Text)
    telefono = Column(String(12))

    libros = relationship("Libro", back_populates="editorial")



