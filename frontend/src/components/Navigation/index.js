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
    <ul>
      <li>
        <NavLink exact to="/">Home</NavLink>
        {sessionLinks}
      </li>
    </ul>
  );
}

export default Navigation;
