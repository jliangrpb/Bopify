import React from "react";
import { Route, Switch } from "react-router-dom";
import SignupFormPage from "./components/SignupFormPage";
import LoginFormPage from "./components/LoginFormPage";
import SplashPage from "./components/SplashPage/SplashPage";
import AlbumShow from "./components/AlbumShow/AlbumShow";

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
          <SplashPage/>
        </Route>
        <Route path='/albums/:albumId'>
          <AlbumShow />
        </Route>
      </Switch>
    </>
  );
}

export default App;