import React from 'react';
import {Switch, Route} from 'react-router-dom';
import withPageTitle from './services/withPageTitle';

import PageContainer from './components/PageContainer.component';
import HomePage from './pages/HomePage.component';
import Register from './pages/Register/Register.component';
import Login from './pages/Login/Login.component';

const HomePageComponent = withPageTitle({
  component: PageContainer({component: HomePage}),
  title:
    'CLONE Stack Overflow - Where Developers Learn, Share, & Build Careers',
});

const RegisterComponent = withPageTitle({
  component: Register,
  title: 'Sign Up - CLONE Stack Overflow',
});

const LoginComponent = withPageTitle({
  component: Login,
  title: 'Log In - CLONE Stack Overflow',
});

const PostComponent = PageContainer({component: Post});

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={HomePageComponent} />
      <Route exact path='/register' component={RegisterComponent} />
      <Route exact path='/login' component={LoginComponent} />
    </Switch>
  );
};

export default Routes;
