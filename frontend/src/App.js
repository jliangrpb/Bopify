import React from "react";
import { Route, Switch } from "react-router-dom";
import SignupFormPage from "./components/SignupFormPage";
import LoginFormPage from "./components/LoginFormPage";
import SplashPage from "./components/SplashPage/SplashPage";
import AlbumShow from "./components/AlbumShow/AlbumShow";
import PlayBar from "./components/Playbar/Playbar";
import SideBar from "./components/SideBar/SidesBar"

function App() {
  return (
    <>
    
      <Switch>
        <Route path="/login" >
          <LoginFormPage />
        </Route>
        <Route path="/signup">
          <SignupFormPage />
        </Route>
        <Route exact path='/'>
          <SideBar/>
          <SplashPage/>
          <PlayBar/>
        </Route>
        <Route path='/albums/:albumId'>
          <SideBar />
          <AlbumShow />
          <PlayBar/>
        </Route>
      </Switch>
    </>
  );
}


export default App;