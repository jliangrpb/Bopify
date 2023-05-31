import React, { useState } from "react";
import * as sessionActions from "../../store/session";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import './LoginForm.css';
import { NavLink} from "react-router-dom";

function LoginFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [credential, setCredential] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const demoLogin = (e) => {
        e.preventDefault();
        return dispatch(sessionActions.login({ credential: 'demoman', password: 'password' }))
    }

  const handleSubmit = (e) => {
    e.preventDefault();
    const currentErrors = {};
    return dispatch(sessionActions.login({ credential, password }))
      .catch(async (res) => {
        let data;
        try {
          // .clone() essentially allows you to read the response body twice
          data = await res.clone().json();
        } catch {
          data = await res.text(); // Will hit this case if, e.g., server is down
        }
        if (data?.errors) {
          data.errors.map(error => {
            if (error.includes('Matching')) {
              return currentErrors['LoginError'] = error
            }
        })
        setErrors(currentErrors);
      }
      });
  };

  return (
    <>
      <div className='logo_header'>
              <i className="fa-brands fa-spotify fa-3x"></i>
              <h2>Jamify</h2>
          </div>
          <div className='login'>
              <form onSubmit={handleSubmit} className="forms" id="login_form">
                  <h2>Log In To Your Account</h2>
                  <div className='login-fields'>
                      <label>
                          Email address or Username
                          <input
                              type='text'
                              value={credential}
                              onChange={(e) => setCredential(e.target.value)}
                              required
                          />
                      </label>
                      <label>
                          Password
                          <input
                              type="password"
                              value={password}
                              onChange={(e) => setPassword(e.target.value)}
                              required
                          />
                      </label>
                  </div>
                  <p className='signup-errors'>{errors['LoginError']}</p>
                  <button type="submit">Log In</button>
                  <button onClick={demoLogin}>Demo Login</button>
                  
              </form>
              <div className='signup_link'>
                  <p>Don't have an account?</p>
                  <NavLink to='/signup'>
                      <button className='signup_button'>Sign up for Jamify</button>
                  </NavLink>
              </div>
          </div>
      </>
    );
}

export default LoginFormPage;