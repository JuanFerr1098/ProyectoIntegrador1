import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import Login from './src/views/Index/index.js';
import Home from './src/views/Home/home.js';
import HomeAprendizaje from './src/views/Aprendizaje/homeAprendizaje.js';
import HomeRetos from './src/views/Retos/homeRetos.js';
import Curso from './src/views/Aprendizaje/curso.js';

const Stack = createStackNavigator();

function App() {
  return (
  
    <NavigationContainer>

      <Stack.Navigator 
      //para esconder el titulo que aparece en cada pantalla
      screenOptions={{headerShown: false }}
      >
        <Stack.Screen name="Newton App" component={Login} />
        <Stack.Screen name="Home" component={Home} />
        <Stack.Screen name="Aprendizaje" component={HomeAprendizaje} />
        <Stack.Screen name="Retos" component={HomeRetos} />
        <Stack.Screen name="Curso" component={Curso} />
      </Stack.Navigator>

    </NavigationContainer>
  );
}

export default App;