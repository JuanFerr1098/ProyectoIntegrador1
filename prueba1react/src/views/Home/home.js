import React from 'react';
import {Text, View, StyleSheet, TouchableOpacity} from 'react-native';
import {Button,} from 'react-native-paper';
import {Ionicons} from '@expo/vector-icons';
//import Icon from "@expo/vector-icons";
//const MORE_ICON = Platform.OS === 'ios' ? 'dots-horizontal' : 'dots-vertical';
export default function Home ({navigation}) {
  return (

    <View style={styles.container}>
    <View style style={styles.header}>
    <Ionicons name="menu" size={32 } color="#FFFFFF" />
    </View>
      
      <View style={styles.contenedor} >
        

      <View style={ styles.contenedorTexto}>
          <Text style={{
            fontSize:40,
            color: "#FFFFFF",
            fontWeight: "bold",
          }}
          >Hola</Text>
          <Text
          style={{
            fontSize: 20 ,
            paddingVertical: 10,
            paddingRight:50,
            lineHeight:22,
            color: "#004346",
            fontWeight: "bold",
          }}
          >Bienvenido a Newton App</Text>

          <Text
          style={{
            fontSize: 20 ,
            //paddingVertical: 10,
            paddingRight:50,
            lineHeight:22,
            color: "#004346",
          }}
          >¿A donde quieres ir?</Text>
        </View>
     
      </View>

      <View style={ styles.contenedorBotones}>
        <Button mode="contained" style={styles.buttonPurple} 
        /*onPress={()=>signUp}>*/
        onPress={()=>navigation.navigate('Aprendizaje')}>
        <Text style={styles.textBoton}>Aprendizaje</Text>
        </Button>
        <Button mode="contained" style={styles.buttonPurple} 
        /*onPress={()=>signUp}>*/
        onPress={()=>navigation.navigate('Retos')}>
        <Text style={styles.textBoton}>Retos</Text>
        </Button>
      </View>

    </View>
    




  );
}

const styles = StyleSheet.create ({
  container: {
    flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
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
    padding:10,
    marginTop: 30,
    width: 200,
    backgroundColor:"#FFFFFF",
    //fontColor:"#00c49a"
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

  contenedor:{
    flexDirection: "row",
    //marginTop: 40,
    alignItems: 'center',
    paddingHorizontal: 10,
    backgroundColor:"#00c49a",
  },

  header:{
    paddingHorizontal: 40,
    marginTop: 40,
    //paddingTop: 40,
    //backgroundColor:"#004346",
  },
  contenedorTexto:{
    padding: 40 ,
    marginTop:65,
  },

  contenedorBotones:{
    padding: 40 ,
    marginTop:70,
    alignItems: 'center',
    //justifyContent: 'center',
  },

  textBoton:{
    color : "#00c49a",
  }
});
