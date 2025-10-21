import React, {useEffect, useState} from 'react';
import './App.css';
import axios from "axios";
import {useAuth,  hasAuthParams} from "react-oidc-context";

type Phone = {
  name: string;
  inventory: number;
};

function App() {
  const auth = useAuth();
  const [hasTriedSignin, setHasTriedSignin] = useState(false);
  const [phones, setPhones] = useState<Phone[]>([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!hasAuthParams() &&
      !auth.isAuthenticated && !auth.activeNavigator && !auth.isLoading &&
      !hasTriedSignin
    ) {
      auth.signinRedirect();
      setHasTriedSignin(true);
    }
  }, [auth, hasTriedSignin]);

  useEffect(() => {
    if (!auth.isAuthenticated) {
      return;
    }

    const token = auth.user?.access_token;
    axios.get('http://localhost/api/inventory', {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
      .then(response => {
        setPhones(response.data);
        setLoading(false);
      })
      .catch(error => {
        console.error(error);
      });
  }, [auth]);

  return (
    <div style={{padding: 20}}>
      <h2>Inventory</h2>

      {auth.error && <p>Oops... {auth.error.name} caused {auth.error.message}</p>}

      {(loading || auth.isLoading) && <p>Loading...</p>}

      {auth.isAuthenticated && !loading &&
        <div>
            <p>User: <strong>{auth.user?.profile.preferred_username}</strong></p>
          <table>
              <thead>
                <tr><th>Phone</th><th>In Stock</th></tr>
              </thead>
              <tbody>
              {phones.map(phone => (
                <tr key={phone.name}><td>{phone.name}</td><td>{phone.inventory}</td></tr>
              ))}
              </tbody>
          </table>
          <br/>
        </div>
      }
    </div>
  );
}

export default App;
