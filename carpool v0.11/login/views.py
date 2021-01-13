from django.shortcuts import render,redirect
from . import models,forms
import hashlib
# Create your views here.
def index(request):
    if not request.session.get('is_login', None):
        return redirect('/login/')
    return redirect('/search/')

def login(request):
    if request.session.get('is_login', None):  # 不允许重复登录
        return redirect('/index/')
    if request.method == 'POST':
        login_form = forms.UserForm(request.POST)
        message = '请检查填写的内容！'
        if login_form.is_valid():
            username = login_form.cleaned_data.get('username')
            password = login_form.cleaned_data.get('password')
            s = hashlib.sha256()    # Get the hash algorithm.
            s.update(password.encode("utf8"))    # Hash the data.
            hashpwd = s.hexdigest()

            try:
                user = models.User.objects.get(name=username)
            except :
                message = '用户不存在！'
                return render(request, 'login/login.html', locals())

            if user.password == hashpwd:
                request.session['is_login'] = True
                request.session['user_id'] = user.id
                request.session['user_name'] = user.name
                if user.state == 7:
                    return redirect('/admincenter/')
                else:
                    return redirect('/index/')
            else:
                message = '密码错误！'
                return render(request, 'login/login.html', locals())
        else:
            return render(request, 'login/login.html', locals())

    login_form = forms.UserForm()
    return render(request, 'login/login.html', locals())

def register(request):
    if request.session.get('is_login', None):
        return redirect('/index/')

    if request.method == 'POST':
        register_form = forms.RegisterForm(request.POST)
        message = "请检查填写的内容！"
        if register_form.is_valid():
            username = register_form.cleaned_data.get('username')
            password1 = register_form.cleaned_data.get('password1')
            password2 = register_form.cleaned_data.get('password2')
            email = register_form.cleaned_data.get('email')
            sex = register_form.cleaned_data.get('sex')
            contact = register_form.cleaned_data.get('contact')
            state = 0

            if password1 != password2:
                message = '两次输入的密码不同！'
                return render(request, 'login/register.html', locals())
            else:
                same_name_user = models.User.objects.filter(name=username)
                if same_name_user:
                    message = '用户名已经存在'
                    return render(request, 'login/register.html', locals())
                same_email_user = models.User.objects.filter(email=email)
                if same_email_user:
                    message = '该邮箱已经被注册了！'
                    return render(request, 'login/register.html', locals())

                new_user = models.User()
                new_user.name = username
                s = hashlib.sha256()    # Get the hash algorithm.
                s.update(password1.encode("utf8"))    # Hash the data.
                hashpwd = s.hexdigest()
                new_user.password = hashpwd
                new_user.email = email
                new_user.sex = sex
                new_user.contact = contact
                new_user.state = state
                new_user.save()

                return redirect('/login/')
        else:
            return render(request, 'login/register.html', locals())
    register_form = forms.RegisterForm
    return render(request, 'login/register.html', locals())

def logout(request):
    if not request.session.get('is_login', None):
        # 如果本来就未登录，也就没有登出一说
        return redirect("/login/")
    request.session.flush()
    # 或者使用下面的方法
    # del request.session['is_login']
    # del request.session['user_id']
    # del request.session['user_name']
    return redirect("/login/")
def search(request):
    if(request.method=='POST'): 
        departure =request.POST.get('departure')
        destination =request.POST.get('destination')  
        time = request.POST.get('time')
        booklist=models.Market.objects.filter(seats__gt=0,departure=departure,destination=destination,time=time)
        context = {'booklist': booklist}
        return render(request,'market/list.html',context) 
    search_form=forms.SearchForm() 
    return render(request,'market/search.html',locals())
    
def terms(request):
    return render(request,'login/terms.html',locals())