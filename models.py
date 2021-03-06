import os

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, DateTime, Integer, String

''' Environment vars '''

DB_HOST = os.getenv('DB_HOST', '127.0.0.1:5432')
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'password123')
DB_NAME = os.getenv('DB_NAME', 'agency')
#DB_PATH = 'postgresql+psycopg2://{}:{}@{}/{}'.format(
#    DB_USER, DB_PASSWORD, DB_HOST, DB_NAME)
DB_PATH = os.getenv('DATABASE_PATH')


db = SQLAlchemy()


'''
setup_db(app)
    binds a flask application and a SQLAlchemy service
'''


def setup_db(app, database_path=DB_PATH):
    app.config["SQLALCHEMY_DATABASE_URI"] = database_path
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    db.app = app
    db.init_app(app)
    # db.create_all()


'''
db_drop_and_create_all()
    drops the database tables and starts fresh
    can be used to initialize a clean database
'''


def db_create_all():
    db.create_all()


def db_drop_and_create_all():
    db.drop_all()
    db.create_all()


def create_dummy_data():
    # Get some dummy data into the db
    actor1 = Actor(name='Derek Rink', age=52, gender='Male')
    actor1.insert()
    actor2 = Actor(name='Jake Pound', age=32, gender='Male')
    actor2.insert()
    actor3 = Actor(name='Clarissa Hunt', age=38, gender='Female')
    actor3.insert()
    actor4 = Actor(name='Derek Runk', age=52, gender='Male')
    actor4.insert()
    actor5 = Actor(name='Jake Dollar', age=32, gender='Male')
    actor5.insert()
    actor6 = Actor(name='Clarissa Pint', age=38, gender='Female')
    actor6.insert()
    movie1 = Movie(title='Time to go', release_date='2022-01-01')
    movie1.insert()
    movie2 = Movie(title='Time to come', release_date='2023-04-01')
    movie2.insert()
    movie3 = Movie(title='Time to stay', release_date='2022-05-01')
    movie3.insert()
    movie4 = Movie(title='Time to go', release_date='2022-01-01')
    movie4.insert()
    movie5 = Movie(title='Time to come', release_date='2023-04-01')
    movie5.insert()
    movie6 = Movie(title='Time to stay', release_date='2022-05-01')
    movie6.insert()


'''
Movie
'''


class Movie(db.Model):
    __tablename__ = 'Movie'

    id = Column(Integer, primary_key=True)
    title = Column(String(120), nullable=False)
    release_date = Column(DateTime, nullable=False)

    def __repr__(self):
        return f'<Movie ID: {self.id}, title: {self.title}, release_date: {self.release_date}>'

    def __init__(self, title, release_date):
        self.title = title
        self.release_date = release_date

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'id': self.id,
            'title': self.title,
            'release_date': self.release_date
        }


'''
Actor
'''


class Actor(db.Model):
    __tablename__ = 'Actor'

    id = Column(Integer, primary_key=True)
    name = Column(String(120), nullable=False)
    age = Column(Integer, nullable=False)
    gender = Column(String(7), nullable=False)

    def __repr__(self):
        return f'<Actor ID: {self.id}, name: {self.name}, age: {self.age}, gender: {self.gender}>'

    def __init__(self, name, age, gender):
        self.name = name
        self.age = age
        self.gender = gender

    def insert(self):
        db.session.add(self)
        db.session.commit()

    def update(self):
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def format(self):
        return {
            'id': self.id,
            'name': self.name,
            'age': self.age,
            'gender': self.gender
        }
