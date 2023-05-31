import './SplashPage.css'
import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { NavLink} from "react-router-dom";
import Navigation from "../Navigation";

function SplashPage() {


    return (
        <div className="splash-page-flex-container">
            {/* <SideBar/> */}
            <div className="nav-main-container">
                <Navigation/>
                <div className="splash-page-container">
                    <h1 className="header1">Pick a Song</h1>
                </div>
            </div>
        </div>
    )
}


export default SplashPage