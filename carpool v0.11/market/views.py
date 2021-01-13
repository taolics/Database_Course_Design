from django.shortcuts import render,redirect
from django.http import HttpResponse
from . import forms
from . import models
from login import models as login_models
from dateutil.relativedelta import relativedelta
import datetime

def issue(request):
    if(request.method=='POST'):
        try:
            userid = request.session['user_id']
        except:
            return redirect('/login/')
        market_form = forms.IssueForm(request.POST)
        username = request.session.get('user_name', None)
        addinfo = request.POST.get('addinfo')
        seats = request.POST.get('seats')
        departure =request.POST.get('departure')
        destination = request.POST.get('destination')
        time = request.POST.get('time')
        contact = login_models.User.objects.get(name=username).contact


        new_book = models.Market() 
        new_book.username=username 
        new_book.addinfo=addinfo
        new_book.seats=seats
        new_book.departure=departure
        new_book.destination=destination
        new_book.time = time
        new_book.contact = contact
        
        
        new_user = login_models.User.objects.get(name=username)
        new_user.credit += 3
        new_book.safe = new_user.credit
        new_book.save()
        new_user.save()
        
        new_order = models.Orders()
        new_order.userid = userid
        new_order.orderid = new_book.id
        new_order.save()  
        return redirect('/personal/')
    market_form=forms.IssueForm()
    return render(request,'market/issue.html',locals())



def list(request):
    try:
        userid = request.session['user_id']
    except:
        return redirect('/login/')
    tbooklist=models.Market.objects.all()
    orderids = []
    orders=models.Orders.orderid.filter(userid=userid)
    booklist = []
    states = []
    for order in orders:
        orderids.append(order.orderid)
    print(orderids)
    for order in tbooklist:
        if order.id in orderids:
            order.state=1
        else:
            order.state=0 
        booklist.append(order)
    context={'booklist':booklist}
    return render(request,'market/list.html',context)


def admin(request):
    context = dict()
    id = request.session['user_id']
    market_booklist = []
    orders = models.Market.objects.all()
    for order in orders:
        attends = []
        userids = models.Orders.objects.filter(orderid=order.id).values('userid')
        print(userids)
        for userid in userids:
            attends += [login_models.User.objects.get(id=userid['userid']).name]
        order.attends = attends
        market_booklist += [order]
    context['market_booklist'] = market_booklist
    Users = login_models.User.objects.all()
    user_booklists = []
    for i in range(len(Users) // 6 + 1):
        begin = i*6
        end = min(i+6, len(Users))
        user_booklists.append(Users[begin:end])
    context['user_booklist'] = user_booklists
    #返回投诉信息
    complaint_info = []
    compinfos = models.compinfo.objects.filter(adminid=id)
    state_name = ['未处理', '已处理']
    for compinfo in compinfos:
        compinfo.processstate = state_name[int(compinfo.processstate)]
        complaint_info += [compinfo]
    
    
    context['compinfo_booklist'] = complaint_info
    return render(request,'market/admin.html',context)


def check(request, id):
    return personal(url='market/adminpersonal.html', userid=id)


def personal(request=None, url='market/personal.html', userid=-1):
    """
    个人中心，返回个人信息、发布的订单、参与的订单和投诉
    """
    if request != None:
        userid = request.session['user_id']
    context = dict()

    #返回个人信息
    user = login_models.User.objects.get(id=userid)
    context['user_info'] = user

    #返回发布的订单和参与的订单
    public_booklist = []
    attend_booklist = []
    username = user.name
    ordersid=models.Orders.objects.filter(userid=userid).values('orderid')
    for orderid in ordersid:
        id = int(orderid['orderid'])
        order = models.Market.objects.get(id=id)
        attends = []
        userids = models.Orders.objects.filter(orderid=order.id).values('userid')
        print(userids)
        for userid in userids:
            attends += [login_models.User.objects.get(id=userid['userid']).name]
        order.attends = attends
        if order.username == username:
            public_booklist += [order]
        else:
            attend_booklist += [order]

    context['public_booklist'] = public_booklist
    context['attend_booklist'] = attend_booklist
    #返回投诉信息
    complaint_info = []
    compinfos = models.compinfo.objects.filter(userac=username)
    state_name = ['未处理', '已处理']
    for compinfo in compinfos:
        compinfo.processstate = state_name[int(compinfo.processstate)]
        complaint_info += [compinfo]
    context['complaint_info'] = complaint_info

    return render(request,url, context)


def delete(request,id):
    now_book=models.Market.objects.get(id=id)
    now_book.delete()
    new_order = models.Orders.objects.get(orderid=id)
    new_order.delete()
    return redirect('/admincenter/')


def search(request):
    if(request.method=='POST'): 
        try:
            userid = request.session['user_id']
        except:
            return redirect('/login/')
        departure =request.POST.get('departure')
        destination =request.POST.get('destination')  
        time = request.POST.get('time')
        time = datetime.datetime.strptime(time, "%Y-%m-%dT%H:%M")
        start_time = time - datetime.timedelta(hours=1, minutes=30, seconds=00)
        end_time = time + datetime.timedelta(hours=1, minutes=30, seconds=00)
        
        tbooklist=models.Market.objects.filter(seats__gt=0,departure__contains=departure,destination__contains=destination,time__range=(start_time, end_time))
        orderids = []
        orders=models.Orders.objects.filter(userid=userid)
        booklist = []
        for order in orders:
            orderids.append(int(order.orderid))
        print(orderids)
        for order in tbooklist:
            print(order.id)
            if order.id in orderids:
                order.state=1
            else:
                order.state=0
            booklist.append(order)
        context={'booklist':booklist}
        return render(request,'market/list.html',context) 
    search_form=forms.SearchForm() 
    return render(request,'market/search.html',locals())


def cancel(request,id):
    try:
        userid = request.session['user_id']
    except:
        return redirect('/login/')
    now_market = models.Market.objects.get(id=id)
    if now_market is not None:
        orders = models.Orders.objects.filter(orderid=id)
        orders.delete()
        now_market.delete()
    else:
        order = models.Orders.objects.get(orderid=id, userid=userid)
        now_market.seats += 1
        order.delete()

        new_book = models.Market.objects.get(id=id)
        userids = models.Orders.objects.filter(orderid=id)
        total = 0
        safes = 0
        for u in userids:
            uid = u.userid
            print(uid)
            user = login_models.User.objects.get(id = uid)
            safes += user.credit
            total += 1
        new_book.safe = safes // total + (total-1)*3
        new_book.save()
    return redirect('/personal/')


def order(request,id):
    try:
        userid = request.session['user_id']
    except:
        return redirect('/login/')
    order = models.Market.objects.get(id=id)
    orderid=order.id
    same_id = models.Orders.objects.filter(userid=userid, orderid=orderid)
    if same_id:
        message = '订单已经存在'
        return redirect('/personal/')
    else:
        order.seats -= 1
        order.save()
        
        new_order = models.Orders()
        new_order.userid = userid
        new_order.orderid = orderid
        new_order.save()  
        
        new_user = login_models.User.objects.get(id=userid)
        new_user.credit += 1
        new_user.save()

        new_book = models.Market.objects.get(id = orderid)
        userids = models.Orders.objects.filter(orderid=order.id)
        total = 0
        safes = 0
        for u in userids:
            uid = u.userid
            print(uid)
            user = login_models.User.objects.get(id = uid)
            safes += user.credit
            total += 1
        new_book.safe = safes // total + (total-1)*3
        new_book.save()
        return redirect('/personal/')

 
def complaints(request):
    if(request.method=='POST'): 
        userac = request.session['user_name']
        userpa = request.POST.get('userpa')
        describe = request.POST.get('describe')
        new_compinfo = models.compinfo()
        new_compinfo.userac = login_models.User.objects.get(name=userac)
        try:
            new_compinfo.userpa = login_models.User.objects.get(name=userpa)
        except:
            return redirect('/not_exist/')
        new_compinfo.content = describe
        new_compinfo.processstate = 0
        new_compinfo.save()
        print(new_compinfo.userac)
        return redirect('/personal/')
    #complaint_form = forms.ComplaintForm()
    return render(request,'market/complaint.html',locals())



def not_exist(request):
    return render(request, 'market/not_exist.html', locals())


def identifys(request):
    if(request.method=='POST'): 
        try:
            userid = request.session['user_id']
        except:
            return redirect('/login/')
        content = request.POST.get('content')
        stunumber = request.POST.get('stunumber')
        new_ident = models.identifyinfo()
        new_ident.userid = userid
        new_ident.stunumber = stunumber
        new_ident.content = content
        new_ident.identifystate = 0
        new_ident.save()
        return redirect('/personal/')
    return render(request,'market/identify.html',locals())


def compprocess(request):
    complist=models.compinfo.objects.filter(processstate = 0)
    context = {'complist': complist}
    return render(request,'market/compprocess.html',context) 


def comppass(request,id):
    if(request.method=='POST'): 
        adminid = request.session['user_id']
        
        new_compinfo = models.compinfo.objects.get(id=id)
        new_compinfo.adminid = adminid
        userac = new_compinfo.userac.name
        userpa = new_compinfo.userpa.name
        new_compinfo.processstate = 1
        new_compinfo.save()
        new_user = login_models.User.objects.get(name=userac)
        if new_user is not None:
            new_user.credit += 10
            new_user.save()
        
        new_user2 = login_models.User.objects.get(name=userpa)
        if new_user2 is not None:
            new_user2.credit -= 20
            new_user2.save()
        
        return redirect('/compprocess/')

    
def compreject(request,id):
    if(request.method=='POST'): 
        adminid = request.session['user_id']
        
        new_compinfo = models.compinfo.objects.get(id=id)
        new_compinfo.adminid = adminid
        new_compinfo.processstate = 1
        new_compinfo.save()       
        return redirect('/compprocess/')


def identprocess(request):
    identlist=models.identifyinfo.objects.filter(identifystate = 0)
    context = {'identlist': identlist}
    return render(request,'market/identprocess.html',context) 


def idprpass(request,id):
    if(request.method=='POST'):
        adminid = request.session['user_id']
        new_ident = models.identifyinfo.objects.get(id=id)
        userid = new_ident.userid
        new_ident.identifystate = 1
        new_ident.adminid = adminid
        new_ident.save()
        new_user = login_models.User.objects.get(id=userid)
        new_user.credit += 100
        new_user.state = 1
        new_user.save()
        return redirect('/identprocess/')


def idprreject(request,id):
    if(request.method=='POST'):
        adminid = request.session['user_id']
        new_ident = models.identifyinfo.objects.get(id=id)
        userid = new_ident.userid
        new_ident.identifystate = 1
        new_ident.adminid = adminid
        new_ident.save()
        return redirect('/identprocess/') 