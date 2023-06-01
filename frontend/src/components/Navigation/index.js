import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <ProfileButton user={sessionUser} />
    );
  } else {
    sessionLinks = (
      <>
        <NavLink to="/signup">
            <button className='nav-signup-button'>Sign up</button>
        </NavLink>
        <NavLink to="/login">
            <button className='nav-login-button'>Log In</button>
        </NavLink>
      </>
    );
  }

  return (
        <div className='navigation-bar-container'>
            <ul className='navigation-bar'>
                <div className="nav-bar-right">
                    <div className='icons'>
                      <a href="https://github.com/jliangrpb" className='github-link'>
                        <i className="fa-brands fa-github fa-lg"></i> Github</a>
                    </div>
                    <li>
                        <NavLink to='/'></NavLink>
                        {sessionLinks}
                    </li>
                </div>
            </ul>

        </div>
  );
}

export default Navigation;
