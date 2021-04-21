import React from 'react';
import {Text, View, StyleSheet, TouchableOpacity} from 'react-native';
import {Button,} from 'react-native-paper';



export default function Home ({navigation}) {
  return (

    <View style={styles.container}>
   
    
      <Text style={styles.titulo}>Bienvenido a Newton App</Text>
      <Text style={styles.titulo}>Quieres ir a...</Text>

      <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Aprendizaje')}>
      <Text style={styles.textoBoton}>Aprendizaje</Text>
      </Button>

      <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
      <Text style={styles.textoBoton}>Retos</Text>
      </Button>

    </View>
  );
}

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor:"#00c49a",
    //backgroundColor: 'white',
  },
  button: {
    backgroundColor: 'black',
    padding: 7,
    marginTop: 10,
  },
  buttonText: {
    color: 'white',
    fontSize: 20,
    padding:5,
    marginTop: 5,
  },

  buttonPurple: {
    backgroundColor:"#FFFFFF",
    width: 200,
    padding:10,
    marginTop: 10,
  },

  textoBoton:{
    //fontColor: "#172A3A",
    fontWeight: "bold",
    color:"#00c49a",

  },
  titulo:{
    //fontColor: "#172A3A",
    fontWeight: "bold",
    color : "#FFFFFF",
    //color : "#00c49a",
    fontSize: 20,
  },
});
