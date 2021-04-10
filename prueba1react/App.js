import React from 'react';
import {
  Text,
  View,
  StyleSheet,
  TouchableOpacity,
  Alert,
  TextInput,
  StackNavigator,
} from 'react-native';
import { NavigationContainer } from '@react-navigation/bottom-tabs';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import Login from './login';



const App = () => {

  const [text, onChangeText] = React.useState ('Useless Text');
  const [number, onChangeNumber] = React.useState (null);
  const Tab = createBottomNavigator();

  return (
    

    <NavigationContainer>
    <Tab.Screen name="Login" component={Home} />
    </NavigationContainer>

    
  );
};

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'cyan',
  },
  title: {fontSize: 30, color: '#ffff'},

  button: {
    backgroundColor: 'black',
    padding: 7,
    marginTop: 10,
  },

  buttonText: {
    color: 'white',
    fontSize: 20,
  },

  textBoxStyle:{
    height: 40,
    padding:10, 
    width: 200,
    margin: 12,
    borderWidth: 3
  }
});

export default App;
