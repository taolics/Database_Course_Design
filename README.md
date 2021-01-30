* carpool v0.12 is the local version (win10 + mysql)

* carpool v1.0 is the version running on the web server (centos7 + mysql) [due on 2021-1-14]

* carpool v1.0 is based on carpool v0.11, which contains no uploading-avatar function.

* update on 2021.1.10 - solve the problem when the user visit the website through the specific url

* update on 2021.1.14 - add the function of uploading avatar on personal center

  

* 本文档截取课程设计报告详细设计部分

# 七、详细设计

本部分将详细展示拼车系统的部分功能，但限于篇幅，本部分只罗列部分功能，更多功能欢迎登入网站网址进行体验。

### 1、用户注册

用户在登陆界面点击新用户注册按钮可以进行用户注册。注册信息包括用户名、密码、联系方式（QQ）、性别。用户的密码在提交至后端后，后端使用sha-256算法对用户密码进行散列加密，然后存到数据库中。联系方式是用户作为发布者时，其他订单参与者与之联系的方式，安全起见，我们推荐建议使用QQ号。此外，在用户注册模块，我们会对用户注册信息进行初步核实，例如若两次输入密码不一致、用户名已存在、邮箱已被注册、邮箱格式不正确、没有同意用户使用条款等情况，都会弹出提示框。


### 2、用户登录

 用户登录界面是用户访问系统的默认跳转界面，用户登录界面链接了用户注册链接，没有账号的用户可以事先进行注册。在用户登录的过程中，用户输入的密码也会经过sha-256算法散列，然后与数据库中用户注册时输入的密码进行比对。比对通过，则跳转到查询界面；比对不通过，则跳转到登录界面。

 

### 3、用户查询下单与联系发布人

用户通过输入出发地和目的地地址以及出发时间，系统根据用户输入信息返回对应的订单信息（时间与用户输入时间相差在1.5h之内，使用模糊查询的方式返回地点信息，即搜素江安，则会返回江安校区、四川大学江安校区等地点的订单），此外，鼠标移至某一行会进行高亮显示，方便用户查看订单信息。用户点击联系方式可以调用外链，跳转到QQ聊天页面与发布者联系。



### 4、用户发布订单

用户输出一个订单必要的信息（出发地地址、目的地地址、座位数、备注信息（可选）、出发时间），系统根据用户输入的信息以及用户个人信息自动生成一个订单。


 

### 5、用户取消订单

当用户不需要进行拼车或发布拼车信息错误时，可以通过取消按钮对订单进行取消。如果用户是该订单的发起人，则系统对该订单的参与人发送信息，提示该订单已经取消，同时取消参与人对该订单的参与；如果用户只是该订单的参与人，则只取消用户的参与，而不取消该订单。此外，在此界面，用户可以查看自己参与的订单、自己发布的订单、自己的投诉、自己的认证情况等信息。


### 6、用户认证

  用户需要认证过后才能进行发布信息和参与拼成等功能。用户通过提供个人的学号信息以及一句能够确认自己为四川大学学生的信息来进行认证。用户提交认证按钮后，该认证信息则进入管理员信息处理中心，等待管理员进行处理。


### 7、用户投诉

当用户在拼车过程中遭遇一些糟心的事情时，可以向管理员进行投诉。用户首先进入投诉界面，如何选择投诉类型、输入被投诉用户和投诉内容进行投诉，如果该用户不存在，系统将提示用户该被投诉用户不存在，用户需要对被投诉用户的用户名再认真检查一下。


 

### 8、管理员查看和删除订单

  管理员可以对不合理的订单进行删除，提高该系统的安全性。为用户提供一个更好的用户体验。此外，管理员登陆此界面还可以查看个人用户信息（点击对应用户名即可）、查看自己处理的投诉等信息。


 

### 9、管理员处理用户投诉

  管理员对用户提交的投诉信息进行审核，审核通过则对用户信誉分进行进一步的处理（投诉用户信誉分加10，被投诉者减20）。

 

### 10、管理员审核用户认证信息

用户需要进行认证才能对该系统进行进一步的使用。管理员通过核对该用户的学号以及认证内容判断该用户是否为本校学生，如果时则通过该用户的认证信息，反之则拒绝。

