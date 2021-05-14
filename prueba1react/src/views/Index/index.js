/*import React from 'react';*/
import * as React from 'react';
import {Text, View,TouchableOpacity,StyleSheet} from "react-native";
import { TextInput, Button, Title } from 'react-native-paper';


export default function  Index({navigation}) {

  const [text, onChangeText] = React.useState ('Useless Text');
  const [email, setEmail] = React.useState (null);
  const [password, setPassword] = React.useState (null);

  const signUp = async()=>{
    try{
      firebase.auth().createUserWithEmailAndPasswordd(email,password);
      navigation.navigate('Home');
    }catch(err){
      setError(err.message);
    }
  }
 
  return(
  <View style={styles.container}>

    <Title style={styles.textStyle}>INGRESE</Title>

    <TextInput style={styles.input}
        mode ="flat"
        onChangeText={setEmail}
        value={email}
        placeholder="Email"
        /*keyboardType="numeric"*/
      />
      <TextInput  style={styles.input}
        mode ="flat"
        onChangeText={setPassword}
        value={password}
        secureTextEntry
        placeholder="Contraseña"
             />
    

      <Button mode="contained" style={styles.buttonPurple} 
      /*onPress={()=>signUp}>*/
      onPress={()=>navigation.navigate('Home')}>
      Ingresar
      </Button>

      <Button mode="text" style={styles.buttonText} 
      onPress = {()=>alert('Entro con Google')}>
      <Text style={styles.textBoton}>Sign in With Google</Text>
      </Button>
     
   
  </View>

  );

};

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    /*alignItems: 'center',
    backgroundColor: 'white',*/
  },
  title: {fontSize: 30, color: '#ffff'},
  textStyle:{
    fontWeight: "bold",
    color : "#00c49a",
    fontSize: 20,
    textAlign:'center',
  },
  button: {
    backgroundColor: 'cyan',
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
  },
  buttonPurple: {
    padding:10,
    marginTop: 30,
    width: 200,
    backgroundColor:"#00c49a",
  },

  buttonText: {
    padding:10,
    marginTop: 10,
    width: 300,
  },

  textBoton : {
    color : "#00c49a",
  },

  input:{
    margin:10,
    width:300,
  }
});