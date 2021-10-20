from flask import Flask, render_template, request, redirect, url_for, flash, session
from datetime import datetime

from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()

app = Flask(__name__)

app.secret_key = "Secret Key"
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:kinza3000@localhost:3306/school'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)

class Admin_login(db.Model):
    __tablename__ = "admin"
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    date_created = db.Column(db.DATE, default=datetime.now())

class Teachers_login(db.Model):
    __tablename__ = "teacher"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    qulification = db.Column(db.String(100))
    username = db.Column(db.String(100))
    password = db.Column(db.String(100), nullable=False)


class Course(db.Model):
    
    id = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(100))
   
class View_Course(db.Model):
    __tablename__="view_course"
    id = db.Column(db.Integer, primary_key=True)
    teacher_name = db.Column(db.String(100))
    session = db.Column(db.String(100))
    program = db.Column(db.String(100))
    course_name = db.Column(db.String(100))

class Session(db.Model):
    
    id = db.Column(db.Integer, primary_key=True)
    session = db.Column(db.String(100))

class Program(db.Model):
    
    id = db.Column(db.Integer, primary_key=True)
    program = db.Column(db.String(100))
   
class Assign_courses(db.Model):
    __tablename__="assign_course"
    id = db.Column(db.Integer, primary_key=True)
    teacher_name = db.Column(db.String(100))
    course = db.Column(db.String(100))
    program = db.Column(db.String(100))
    session = db.Column(db.String(100))
   

class Student(db.Model):
    __tablename__ = "student"
    id = db.Column(db.Integer, primary_key=True)
    roll_number = db.Column(db.String(100),nullable=False)
    name = db.Column(db.String(100),nullable=False)
    father_name = db.Column(db.String(100),nullable=False)
    session = db.Column(db.String(100),nullable=False)
    gender = db.Column(db.String(100),nullable=False)
    program = db.Column(db.String(100),nullable=False)
    shift = db.Column(db.String(100),nullable=False)

class Result(db.Model):
    __tablename__ = "result"
    id = db.Column(db.Integer, primary_key=True)
    roll_number = db.Column(db.String(100))
    name = db.Column(db.String(100))
    father_name  = db.Column(db.String(100))
    subject      = db.Column(db.String(100))
    percentage   = db.Column(db.String(100))
    gpa          = db.Column(db.String(100))
    cgpa         = db.Column(db.String(100))
    obtain_marks = db.Column(db.String(100))
    total_marks  = db.Column(db.String(100))
    grade        = db.Column(db.String(100))
    remarks      = db.Column(db.String(100))
    program      = db.Column(db.String(100))
    sesion      = db.Column(db.String(100))
    teacher_name = db.Column(db.String(100))


@app.route("/login", methods=['GET','POST'])
def login():
    if request.method == 'POST':
        identity=request.form.get("identity")
        
        if  identity == "teacher":
            username = request.form.get("username")
            password = request.form.get("password")
            print(username,password)
            user_teacher = Teachers_login.query.filter_by(username=username , password=password).first()
    
            if user_teacher:
                session["username"] = user_teacher.username
                session["password"] = user_teacher.password
                return redirect("/view_course")
           
        elif identity == "admin": 
            username = request.form.get("username")
            password = request.form.get("password")
            user_admin = Admin_login.query.filter_by(username = username, password =  password).first()
            
            if user_admin:
                session["name"] = user_admin.username
                return redirect("/")

    return render_template("login.html")   
    


@app.route("/add_student",methods=['GET', 'POST'])
def s():
    if request.method == 'POST':
        roll_number = request.form.get('roll_number')
        name = request.form.get('name')
        father_name = request.form.get('father_name')
        session = request.form.get('session')
        program = request.form.get('program')
        gender = request.form.get('gender')
        shift = request.form.get('shift')

        user = Student.query.filter_by(name=name).first()
        se = Session.query.filter_by(session=session).first()
        if not se:
            ad = Session(session=session)
            db.session.add(ad)
            db.session.commit()

        if not user:
            add = Student(name=name,father_name=father_name ,roll_number=roll_number,session= session,gender = gender, program = program, shift = shift)
            db.session.add(add)
            db.session.commit()
            return redirect("/add_student")
        else:
            print("this user is already")

    return render_template("student.html")

@app.route("/view_course",methods=['GET','POST'])
def view_course():
    name = session["username"]
    
    teacher = Teachers_login.query.filter(Teachers_login.username==name).first()
    ac = Assign_courses.query.filter(Assign_courses.teacher_name==teacher.name).all()


    return render_template("view_course.html",ac=ac)

@app.route("/view_student")
def view_students():
    if session.get("name"):

        st = Student.query.all()
        bs= Student.query.filter_by(program="BSCS").all()
        ms= Student.query.filter_by(program="MCS").all()
        it= Student.query.filter_by(program="BSIT").all()
        return render_template("show_student.html",st = st,bs=bs,it=it,ms=ms)
    else:
        return render_template("login.html")

@app.route("/assign_course",methods=['GET','POST'])
def assign_course():
    teacher = Teachers_login.query.all()
    course = Course.query.all()
    se = Session.query.all()
    pr=Program.query.all()

    if request.method == 'POST':
        teachers = request.form.get('teachers')
        courses = request.form.get('course')
        program = request.form.get('program')
        session = request.form.get('session')
        
        entry = Assign_courses(teacher_name=teachers,course=courses,program=program,session=session)
        db.session.add(entry)
        db.session.commit()
        return redirect("/assign_course")

    

    return render_template("course_assign.html",pr=pr,se=se,teacher=teacher,course= course )


@app.route("/submit/<program>/<ses>",methods=['GET','POST'])
def submit(program,ses):
    s = Session.query.all()
    st = Student.query.filter(Student.program==program).filter(Student.session==ses).all()
    for sess in s:
        sessi =  sess.session
        if program =="BSCS" and ses == sessi:
                
            name = session['username']
            ad = Teachers_login.query.filter(Teachers_login.username==name).all()
            for a in ad:
                ab = a.name
            ac = Assign_courses.query.filter(Assign_courses.teacher_name==ab).all()

            return render_template("temp.html",ac=ac,st=st)
        if program =="BSIT" and ses == sessi:
            
            name = session['username']
            ad = Teachers_login.query.filter(Teachers_login.username==name).all()
            for a in ad:
                ab = a.name
            ac = Assign_courses.query.filter(Assign_courses.teacher_name==ab).all()
           
            return render_template("temp.html",ac=ac,st=st)
        if program =="MCS" and ses == sessi:
            name = session['username']
            ad = Teachers_login.query.filter(Teachers_login.username==name).all()
            
          
            for a in ad:
                ab = a.name
            ac = Assign_courses.query.filter(Assign_courses.teacher_name==ab).all()
            print(program,ses)
            return render_template("temp.html",ac=ac,st=st,program=program,ses=ses )
    return render_template("temp.html")

@app.route("/student_result",methods=['GET','POST'])
def studentresult():
    
    if request.method == 'POST':
        
            roll_number = request.form.getlist('roll_number')

            name=    request.form.getlist('name')          
            father_name=request.form.getlist('father_name')
            subject      = request.form.get('subject')
            percentage   = request.form.getlist('percentage')	
            gpa          = request.form.getlist('gpa')
            cgpa         = request.form.getlist('cgpa')
            obtain_marks = request.form.getlist('obtain_marks')
            total_marks  = request.form.getlist('total_marks')
            program      = request.form.getlist('program')
            sesssion     = request.form.getlist('sessionss')
            grade        = request.form.getlist('grade')

            remarks      = request.form.getlist('remarks')
         
            for i in range(len(roll_number)):
              
                teacher      = session['username']
                teacher_name = Teachers_login.query.filter(Teachers_login.username==teacher).first()
                std          = db.session.query(Student).filter(Student.roll_number==roll_number[i]).first()
                st           = Result.query.filter_by(roll_number=roll_number[i]).all()
                add = Result(sesion=sesssion[i],program=program[i], teacher_name=teacher_name.name,name=name[i],father_name=father_name[i],roll_number=roll_number[i], gpa = gpa[i], cgpa = cgpa[i], percentage = percentage[i], grade = grade[i],remarks=remarks[i], obtain_marks=obtain_marks[i],total_marks=total_marks[i],subject=subject)
                db.session.add(add)
                db.session.commit()
              
            for i in range(len(roll_number)):
 
                
                db.session.add(add)
                db.session.commit()
                return redirect("/view_course")



    return render_template("view_course.html")



    
@app.route("/BSCS")
def BSCS():
    if session.get("name"):

        pr = Student.query.filter_by(program='BSCS').all()
        return render_template("bscs.html",pr=pr)
    else:
        return redirect("/")

@app.route("/BSIT")
def BSIT():
    if session.get("name"):

        pr = Student.query.filter_by(program='BSIT').all()
        return render_template("bscs.html",pr=pr)

    else:
        return redirect("/")

@app.route("/MCS")
def MCS():
    if session.get("name"):

        pr = Student.query.filter_by(program='MCS').all()
        return render_template("vs.html",pr=pr)

    else:
        return redirect("/")

@app.route("/va")
def va():
    vs= Assign_courses.query.all()
    if session.get('name'):
        return render_template("vs.html",vs=vs)
    else:
        return render_template("login.html")



    
@app.route("/st_result", methods=['GET','POST'])
def st_result():

        
    result = Result.query.with_entities(Result.teacher_name,Result.subject,Result.program,Result.sesion).group_by(Result.teacher_name,Result.subject,Result.program,Result.sesion).all()   
  
    return render_template("result.html",result=result)



@app.route("/view_results/<program>", methods=['GET','POST'])
def view_results(program):

    results = Result.query.all()

    if program == "MCS":
        r = Result.query.filter(Result.program==program).all()
       
        return render_template("view_results.html",r=r)
    elif program == "BSCS":
        print("helofsadhflk;aj")
        r = Result.query.filter(Result.program==program).all()

        return render_template("view_results.html",r=r)
    elif program == "BSIT":
        r = Result.query.filter(Result.program==program).all()

        return render_template("view_results.html",r=r)
    # return render_template("view_results.html")

@app.route("/", methods=['GET','POST'])
def t():
    if session.get("name"):

        if request.method == 'POST':
            name = request.form.get('name')
            username = request.form.get('username')
            password = request.form.get('password')
            qulification = request.form.get('qulification')
    
            user = Teachers_login.query.filter_by(username=username).first()
            
            if not user:
                add = Teachers_login(name=name ,username = username,password = password,qulification = qulification)
                db.session.add(add)
                db.session.commit()
                return redirect("/t")
            else:
                print("this user is already")

        return render_template("teacher.html")
    elif session.get("username"):
        return render_template("master_template.html")

    return render_template("login.html")

@app.route("/logout", methods=['GET', 'POST'])
def logout():
    session['username'] = []
    session['password'] = []
    session['name'] = []
    return redirect('/login')


if __name__ == "__main__":
    app.run(debug=True,port = 5000)
