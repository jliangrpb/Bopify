import './SideBar.css';
import { NavLink } from "react-router-dom";

const SideBar = () => {
    return (
        <nav className="sideBar-container">
            <div className="logoDiv">
                <img  src={require('../../assets/transparent-logo.png')}  alt='logo'/>
                <p className="logoName">Jamify</p>
            </div>
            <div className="sidebar-links">
                <NavLink to='/' className='home-div'>
                    <li>
                        <i className="fa-solid fa-house" style={{ color: '#ffffff' }}></i>
                        <p className="home-text">Home</p>
                    </li>
                </NavLink>
            </div>
        </nav>
    )
};

export default SideBar;