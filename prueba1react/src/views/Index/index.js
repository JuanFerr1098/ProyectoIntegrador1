import React from 'react';
import {Text, View, Button,  StyleSheet,
  TouchableOpacity,
  TextInput,} from "react-native";

export default function Index({navigation}){

  const [text, onChangeText] = React.useState ('Useless Text');
  const [number, onChangeNumber] = React.useState (null);

  return(
  <View style={styles.container}>
    <Text> INGRESE </Text>

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
        onPress={()=>navigation.navigate('Home')}
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
  