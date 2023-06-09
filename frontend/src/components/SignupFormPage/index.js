import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
import './SignupForm.css';
import { NavLink} from "react-router-dom";

function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const demoLogin = (e) => {
        e.preventDefault();
        return dispatch(sessionActions.login({credential: 'demoman', password: 'password'}))
    }

const handleSubmit = (e) => {
  e.preventDefault();
  const currentErrors = {};

  return dispatch(sessionActions.signup({email, username, password}))
  .catch(async (res) => {
      let data;
      console.log(data)
      try {
              data = await res.clone().json();
            } catch {
                data = await res.text();
            }
            if (data?.errors) {
                
                data.errors.map(error => {
                    if (error.includes('Email is invalid')) {
                        return currentErrors['EmailError'] = error
                  } else if (error.includes('Password')) {
                      return currentErrors['PasswordError'] = error
                    } else {
                        return currentErrors['UsernameError'] = error;
                    }
                })
                if (password !== confirmPassword) currentErrors['ConfirmPasswordError'] = 'Your confirmed password must match your password';
          }

          setErrors(currentErrors);
      });
  }

return (
        <div className='signup_page'>
            <header>
                <div className="header_container">
                    <div className="logo">
                        <i className="fa-brands fa-spotify"></i>
                        <h2>Jamify</h2>
                    </div>
                    <h2 className="signup_title">Sign up to start listening!</h2>
                </div>
            </header>
            
            <form onSubmit={handleSubmit} className="forms" id="signup_form">
                <h1>Sign up with your email address</h1>
                <div className="signup_labels">
                    <label>
                        What is your email?
                        <input
                            type="text"
                            value={email}
                            placeholder='Enter your email.'
                            onChange={(e) => setEmail(e.target.value)}
                        />
                    </label>
                    <p className='signup-errors'>{errors['EmailError']}</p>
                    <label>
                        Create a username
                        <input
                            type="text"
                            value={username}
                            placeholder='Enter a username'
                            onChange={(e) => setUsername(e.target.value)}
                            required
                        />
                    </label> 
                    <p className='signup-errors'>{errors['UsernameError']}</p>
                    <label>
                        Create a password
                        <input
                            type="password"
                            value={password}
                            placeholder='Create a password.'
                            onChange={(e) => setPassword(e.target.value)}
                        />
                    </label>
                    <p className='signup-errors'>{errors['PasswordError']}</p>
                    <label>
                        Confirm your password
                        <input
                            type="text"
                            value={confirmPassword}
                            placeholder='Enter your password again.'
                            onChange={(e) => setConfirmPassword(e.target.value)}
                        />
                    </label>
                    <p className='signup-errors'>{errors['ConfirmPasswordError']}</p>
                </div>
                <button type='submit'>Sign Up</button>
                <button onClick={demoLogin}>Demo Login</button>
            </form>
            <div className='login_link'>
                <span>Have an account? <NavLink to="/login">Log In.</NavLink></span>
            </div>
        </div>
        
    )
}

export default SignupFormPage;