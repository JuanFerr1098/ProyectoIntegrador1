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



const App = () => {

  const [text, onChangeText] = React.useState ('Useless Text');
  const [number, onChangeNumber] = React.useState (null);

  return (
    <View style={styles.container}>
      
       <TextInput
        style={styles.textBoxStyle}
        onChangeText={onChangeNumber}
        value={number}
        placeholder="Usuario"
        /*keyboardType="numeric"*/
      />
      <TextInput
        style={styles.textBoxStyle}
        onChangeText={onChangeNumber}
        value={number}
        placeholder="Contraseña"
        keyboardType="numeric"
      />
      <TouchableOpacity
        onPress={() => Alert.alert ('Bienvenido a la App de Calculo Mental')}
        style={styles.button}
      >
        <Text style={styles.buttonText}>Ingresar</Text>
      </TouchableOpacity>

    </View>
  );
};

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
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