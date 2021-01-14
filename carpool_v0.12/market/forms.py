from django import forms
class IssueForm(forms.Form):

    username = forms.CharField(label="用户名", max_length=128)
    seats = forms.IntegerField(label="座位数")
    departure = forms.CharField(label="出发地", max_length=128)
    destination = forms.CharField(label="目的地", max_length=128)
    addinfo = forms.CharField(label="备注信息", max_length=128)
    time = forms.DateTimeField(label="时间")

class SearchForm(forms.Form):

    username = forms.CharField(label="用户名", max_length=128)
    departure = forms.CharField(label="出发地", max_length=128)
    destination = forms.CharField(label="目的地", max_length=128)
    time = forms.CharField(label="出发时间", max_length=128)