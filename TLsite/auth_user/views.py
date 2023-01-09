from django.contrib.auth import authenticate, login, logout, get_user_model
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
# Create your views here.
from .forms import LoginForm, RegisterForm, UserUpdateForm, trailGuideProfile
User = get_user_model()

def register_view(request):
    form = RegisterForm(request.POST or None)
    if form.is_valid():
        username = form.cleaned_data.get("username")
        email = form.cleaned_data.get("email")
        first_name = form.cleaned_data.get("first_name")
        last_name = form.cleaned_data.get("last_name")
        password = form.cleaned_data.get("password1")
        password2 = form.cleaned_data.get("password2")
        try:
            user = User.objects.create_user(username, email, password)
            user.last_name = last_name
            user.first_name = first_name
            user.save()
        except:
            user = None
        if user != None:
            login(request, user)
            return redirect("/")
        else:
            request.session['register_error'] = 1 # 1 == True
    return render(request, "auth_user/forms.html", {"form": form})


def login_view(request):
    form = LoginForm(request.POST or None)
    if form.is_valid():
        username = form.cleaned_data.get("username")
        password = form.cleaned_data.get("password")
        user = authenticate(request, username=username, password=password)
        if user != None:
            # user is valid and active -> is_active
            # request.user == user
            login(request, user)
            return redirect("/")
        else:
            # attempt = request.session.get("attempt") or 0
            # request.session['attempt'] = attempt + 1
            # return redirect("/invalid-password")
            request.session['invalid_user'] = 1 # 1 == True
    return render(request, "auth_user/forms.html", {"form": form})

def logout_view(request):
    logout(request)
    # request.user == Anon User
    return redirect("login_view")

@login_required
def profile_view(request):


    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = trailGuideProfile(request.POST, instance=request.user.trailguide)        
        if u_form.is_valid() and p_form.is_valid():
            print("success")
            u_form.save()
            p_form.save()
            messages.success(request, 'Profile details updated.')
            return redirect('profile_view')
        else:
            print("error")
            messages.error(request, "Problem with data entered in the form")
    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = trailGuideProfile(instance=request.user.trailguide)
    

    context = {
        'u_form': u_form,
        'p_form': p_form, 
    }

    return render(request,'auth_user/profile.html', context)
