import React from 'react';
import {Text, View, StyleSheet, TouchableOpacity, SafeAreaView} from 'react-native';
import {Button, Appbar} from 'react-native-paper';
import {Entypo} from '@expo/vector-icons';


const MORE_ICON = Platform.OS === 'ios' ? 'dots-horizontal' : 'dots-vertical';


export default function Curso1 ({navigation}) {
  

  return (

    <View style={styles.container}>
      <SafeAreaView>
      <View>
      <Appbar.Header
          style={styles.header}
          >
          <Appbar.BackAction onPress={()=>navigation.navigate('Aprendizaje')} color="#FFFFFF"  />
            
            <Appbar.Content title="Curso 1" color="#FFFFFF" />
              {/* <Appbar.Action icon="magnify" onPress={() => {}} /> */}
              <Appbar.Action icon={MORE_ICON} onPress={() => {}} color="#FFFFFF" />
        
          </Appbar.Header>
          </View>
          
        <View style={styles.botonContainer}> 
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Trucos')}>
          Truco
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 2
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 3
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 4
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 5
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 6
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 7
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 8
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
          Tema 9
          </Button>
          <Button mode="contained" style={styles.buttonPurple} onPress={() => navigation.navigate ('Retos')}>
        Tema 10
        </Button>
        </View>   
      </SafeAreaView>
      
    </View>
  );
}

const styles = StyleSheet.create ({

  container: {
    flex: 1,
   // alignItems: 'center',
    backgroundColor: 'white',
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

  botonContainer: {
    justifyContent: 'center',
    alignItems: 'center',



  },
  header :{
    paddingHorizontal: 20,
    backgroundColor:"#00c49a",
  },
  buttonPurple: {
    backgroundColor:"#156064",
    width: 300,
    padding:10,
    marginTop: 10,
  },

  titulo:{
    //fontColor: "#172A3A",
    fontWeight: "bold",
    color : "#00c49a",
    fontSize: 20,
  },
  header :{
    backgroundColor:"#00c49a",
  },
});
