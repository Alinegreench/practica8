from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from ..database import Base

class Alumno(Base):
    __tablename__ = "alumnos"

    id_alumno = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(30))
    ap_paterno = Column(String(20))
    ap_materno = Column(String(20))
    escuela = Column(String(100))
    ciclo_escolar = Column(String(20))

    prestamos = relationship("Prestamo", back_populates="alumno")
