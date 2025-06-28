from sqlalchemy import Column, Integer, Date, ForeignKey
from sqlalchemy.orm import relationship
from ..database import Base

class Prestamo(Base):
    __tablename__ = "prestamos"

    id_prestamo = Column(Integer, primary_key=True, index=True)
    id_alumno = Column(Integer, ForeignKey("alumnos.id_alumno"))
    id_libro = Column(Integer, ForeignKey("libros.id_libro"))
    fecha_prestamo = Column(Date)
    fecha_devolucion = Column(Date)

    alumno = relationship("Alumno", back_populates="prestamos")
    libro = relationship("Libro", back_populates="prestamos")
