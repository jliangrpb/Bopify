import SideBar from '../SideBar/SideBar';
import Navigation from "../Navigation";
import AlbumIndex from '../AlbumIndex/AlbumIndex';
import './SplashPage.css'

function SplashPage() {


    return (
        <div className="splash-page-flex-container">
            <SideBar/>
            <div className="nav-main-container">
                <Navigation/>
                <div className="splash-page-container">
                    <h1 className="header1">Pick An Album</h1>
                    <AlbumIndex/>
                </div>
            </div>
        </div>
    )
}


export default SplashPage;